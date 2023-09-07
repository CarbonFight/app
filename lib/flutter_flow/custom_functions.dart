import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String printScore(int? score) {
  String co2 = "0";
  String unit = "g";

  if (score! < 1000) {
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

String timestampToDay(DateTime? timestamp) {
  // Add your function code here!
  var formatter = DateFormat('d/M/y');
  String formattedDate = formatter.format(timestamp!);
  //return DateTime.parse(formattedDate); // change to 25/7/2022
  return formattedDate;
}

String setOneDayBefore(String? activeDate) {
  var parsedDate = DateFormat('d/M/y').parse(activeDate!);
  DateTime oneDayAgo = parsedDate.subtract(new Duration(days: 1));
  String formattedDate = DateFormat('d/M/y').format(oneDayAgo);

  return formattedDate;
}

String setOneDayAfter(String? activeDate) {
  var parsedDate = DateFormat('d/M/y').parse(activeDate!);
  DateTime oneDayAfter = parsedDate.add(new Duration(days: 1));
  String formattedDate = DateFormat('d/M/y').format(oneDayAfter);

  return formattedDate;
}

double ratioScoreTotal(
  int? score,
  int? total,
) {
  // Add your function code here!
  var ratio = (score! / total!);
  if (ratio > 1) {
    ratio = 1;
  }
  var output = ratio.toStringAsFixed(2);
  return double.parse(output);
}

Color progressBarColor(
  int? score,
  int? total,
) {
  var ratio = (score! / total!);
  if (ratio > 0.9) {
    return Colors.red.shade900;
  } else if (ratio > 0.8) {
    return Colors.deepOrange.shade900;
  } else {
    return Colors.teal.shade600;
  }
}

String printRatioScoreTotal(
  int? score,
  int? total,
) {
  if (total == 0) {
    total = 1; // No divide by zero
  }

  // Add your function code here!
  var ratio = 100 * (score! / total!);
  var val = ratio.toStringAsFixed(0);
  var unit = '%';
  return val + " " + unit;
}

int calculateActionCO2e(
  int? emissionFactor,
  int? count,
  int? multiplicator,
  int? divider,
  String? shared,
) {
  // Default values
  count = count ?? 0;
  multiplicator = multiplicator ?? 1;
  divider = divider ?? 1;
  emissionFactor = emissionFactor ?? 0;
  shared = shared ?? "1";

  double co2e =
      ((emissionFactor * count) * multiplicator) / divider / int.parse(shared);

  return co2e.round();
}

List<String> getTransportPassengers(String? transport) {
  List<String> params = [];

  switch (transport) {
    case "car":
      params.add('1');
      params.add('2');
      params.add('3');
      params.add('4');
      params.add('5');
      params.add('6');
      params.add('7');
      params.add('8');
      break;
    case "bus":
      params.add('Non applicable');
      break;
    case "scooter":
      params.add('1');
      params.add('2');
      break;
    case "train":
      params.add('Non applicable');
      break;
    case "bike":
      params.add('1');
      params.add('2');
      break;
    case "flight":
      params.add('Non applicable');
      break;
    case "metro":
      params.add('Non applicable');
      break;
    case "moto":
      params.add('1');
      params.add('2');
      break;
  }

  return params;
}

String getTransportDistanceLabel(String? transport) {
  String label = "";

  switch (transport) {
    case "car":
      label = "Distance parcourue (en KMs)";
      break;
    case "bus":
      label = "Nombre de stations";
      break;
    case "scooter":
      label = "Distance parcourue (en KMs)";
      break;
    case "train":
      label = "Distance parcourue (en KMs)";
      break;
    case "bike":
      label = "Distance parcourue (en KMs)";
      break;
    case "flight":
      label = "Distance parcourue (en KMs)";
      break;
    case "metro":
      label = "Nombre de stations";
      break;
    case "moto":
      label = "Distance parcourue (en KMs)";
      break;
  }

  return label;
}

String getEnergyVolumeLabel(String? energy) {
  String label = "";

  switch (energy) {
    case "electricity":
      label = "Consommation annuelle en KWH";
      break;
    case "gas":
      label = "Consommation annuelle en KWH";
      break;
    case "water":
      label = "Consommation annuelle en M3";
      break;
  }

  return label;
}

int getActiveScore(
  List<int>? scores,
  int? dayRelative,
) {
  return scores![dayRelative!];
}

String printRank(int? rank) {
  // Rank starts at 0
  var newRank = rank! + 1;
  var newRankString = "#" + newRank.toString();
  return newRankString;
}
