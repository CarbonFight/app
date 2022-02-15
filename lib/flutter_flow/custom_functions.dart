import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int transportActions(
  int distance,
  int passengers,
  String ownership,
  String powertype,
  String transport,
) {
  double co2e = 0;

  if (transport == "car") {
    // powertype : CO2 per Km
    // Default is Thermic
    double co2powertype = 193;
    switch (powertype) {
      case "Thermic":
        co2powertype = 193;
        break;
      case "Electricity":
        co2powertype = 19.8;
        break;
      case "Hybrid":
        co2powertype = 50;
        break;
    }

    // ownership : Ratio applied to co2e
    // Default is Owner
    double co2ownership = 1;
    switch (ownership) {
      case "Owner":
        co2ownership = 1;
        break;
      case "Short rent":
        co2ownership = 0.6;
        break;
      case "Long rent":
        co2ownership = 0.8;
        break;
      case "Taxi":
        co2ownership = 0.4;
        break;
    }

    // Co2 is distance * co2 per km for powertype * ratio of ownership / nomber of passengers
    co2e = (distance * co2powertype * co2ownership) / passengers;
  }

  // Bike
  else if (transport == "bike") {
    // powertype : CO2 per Km
    // Default is Classic
    double co2powertype = 0;
    switch (powertype) {
      case "Classic":
        co2powertype = 0;
        break;
      case "Electricity":
        co2powertype = 2;
        break;
    }
    co2e = distance * co2powertype;
  }

  // Moto
  else if (transport == "moto") {
    double co2perkm = 168;
    co2e = distance * co2perkm;
  }

  // Flight
  else if (transport == "flight") {
    double co2perkm = 82.8;
    co2e = distance * co2perkm;
  }

  // Metro
  else if (transport == "metro") {
    // 2.5 gCo2e / km (Paris)
    // Distance is not KM but number of stations
    // ~0.57 Km between 2 stations (Paris)
    double co2perkm = 2.5;
    double distanceBetweenTwoStations = 0.570;
    co2e = distance * co2perkm * distanceBetweenTwoStations;
  }

  // TGV (High Speed Train)
  else if (transport == "tgv") {
    double co2perkm = 1.73;
    co2e = distance * co2perkm;
  }

  // Train TER
  else if (transport == "ter") {
    double co2perkm = 24.8;
    co2e = distance * co2perkm;
  }

  // Train intercites
  else if (transport == "intercites") {
    double co2perkm = 5.29;
    co2e = distance * co2perkm;
  }

  // Train rer
  else if (transport == "rer") {
    double co2perkm = 4.1;
    co2e = distance * co2perkm;
  }

  // Train transilien
  else if (transport == "transilien") {
    double co2perkm = 4.1;
    co2e = distance * co2perkm;
  }

  // Train tramway
  else if (transport == "tramway") {
    double co2perkm = 2.2;
    co2e = distance * co2perkm;
  }

  // Train bus
  else if (transport == "bus") {
    double co2perkm = 103;

    switch (powertype) {
      case "Thermic":
        co2perkm = 103;
        break;
      case "Electricity":
        co2perkm = 9.5;
        break;
      case "gnv":
        co2perkm = 113;
        break;
    }
    co2e = distance * co2perkm;
  } else if (transport == "scooter") {
    // powertype : CO2 per Km
    // Default is Thermic
    double co2powertype = 61.6;
    switch (powertype) {
      case "Thermic":
        co2powertype = 61.6;
        break;
      case "Electricity":
        co2powertype = 4.1;
        break;
    }

    // ownership : Ratio applied to co2e
    // Default is Owner
    double co2ownership = 1;
    switch (ownership) {
      case "Owner":
        co2ownership = 1;
        break;
      case "Short rent":
        co2ownership = 0.6;
        break;
      case "Long rent":
        co2ownership = 0.8;
        break;
    }

    // Co2 is distance * co2 per km for powertype * ratio of ownership / nomber of passengers
    co2e = (distance * co2powertype * co2ownership) / passengers;
  }

  return co2e.round();
}

String printScore(int score) {
  String co2 = "0";
  String unit = "g";

  if (score < 1000) {
    co2 = score.toString();
    unit = "g";
  } else if (score >= 1000 && score < 10000) {
    co2 = (score / 1000).toStringAsFixed(2);
    unit = "kg";
  } else if (score >= 10000 && score < 20000) {
    co2 = (score / 1000).toStringAsFixed(1);
    unit = "kg";
  } else if (score >= 20000 && score < 1000000) {
    co2 = (score / 1000).toStringAsFixed(0);
    unit = "kg";
  } else if (score >= 1000000) {
    co2 = (score / 1000000).toStringAsFixed(2);
    unit = "T";
  }
  return co2 + " " + unit;
}

int energyActions(
  String energy,
  int volume,
  String powertype,
  int peopleSharing,
) {
  double co2e = 0;

  // Electricity
  if (energy == "electricity") {
    // powertype : CO2 per KWH
    // Default is Nuclear
    double co2powertype = 6;
    switch (powertype) {
      case "Nuclear":
        co2powertype = 6;
        break;
      case "Wind turbine (Offshore)":
        co2powertype = 9;
        break;
      case "Wind turbine":
        co2powertype = 10;
        break;
      case "Hydroelectric":
        co2powertype = 10;
        break;
      case "Biomass":
        co2powertype = 32;
        break;
      case "Geothermal":
        co2powertype = 38;
        break;
      case "Fuel oil":
        co2powertype = 730;
        break;
      case "Coal":
        co2powertype = 1058;
        break;
    }

    // Co2 volume * gCo2z/volume dividied by the number of people in the house
    co2e = (volume * co2powertype) / peopleSharing;
  }

  // Gas
  else if (energy == "gas") {
    // powertype : CO2 per KWH
    // Default is Natural
    double co2powertype = 239;
    switch (powertype) {
      case "Natural":
        co2powertype = 239;
        break;
      case "Cokerie":
        co2powertype = 171;
        break;
      case "Furnace":
        co2powertype = 968;
        break;
    }
    co2e = (volume * co2powertype) / peopleSharing;
  }

  // Water
  else if (energy == "water") {
    double co2PerM3 = 7575;
    co2e = (volume * co2PerM3) / peopleSharing;
  }

  return co2e.round();
}
