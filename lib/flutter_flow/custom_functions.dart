import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int transportActionsCO2e(
  int distance,
  String passengers,
  String ownership,
  String powertype,
  String transport,
) {
  double co2e = 0;
  var passengersInt = int.parse(passengers);

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
    co2e = (distance * co2powertype * co2ownership) / passengersInt;
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
  else if (transport == "train") {
    double co2perkm = 24.8; // Default TER
    switch (powertype) {
      case "TGV":
        co2perkm = 1.73;
        break;
      case "TER":
        co2perkm = 24.8;
        break;
      case "intercites":
        co2perkm = 5.29;
        break;
      case "RER":
        co2perkm = 4.1;
        break;
      case "transilien":
        co2perkm = 4.1;
        break;
      case "tramway":
        co2perkm = 2.2;
        break;
    }
    co2e = distance * co2perkm;
  }

  // Train bus
  else if (transport == "bus") {
    double co2perkm = 103;

    switch (powertype) {
      case "Thermique":
        co2perkm = 103;
        break;
      case "Electrique":
        co2perkm = 9.5;
        break;
      case "Gaz Naturel":
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
    co2e = (distance * co2powertype * co2ownership) / passengersInt;
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

int energyPeriodicsCO2e(
  String energy,
  int volume,
  String powertype,
  String peopleSharing,
) {
  double co2e = 0;
  int peopleSharingInt = int.parse(peopleSharing);

  // Electricity
  if (energy == "electricity") {
    // powertype : CO2 per KWH
    // Default is Nuclear
    double co2powertype = 6;
    switch (powertype) {
      case "Nucléaire":
        co2powertype = 6;
        break;
      case "Éolienne (mer)":
        co2powertype = 9;
        break;
      case "Éolienne (terre)":
        co2powertype = 10;
        break;
      case "Hydroélectrique":
        co2powertype = 10;
        break;
      case "Biomasse":
        co2powertype = 32;
        break;
      case "Géothermique":
        co2powertype = 38;
        break;
      case "Fioul":
        co2powertype = 730;
        break;
      case "Charbon":
        co2powertype = 1058;
        break;
    }

    // Co2 volume * gCo2z/volume dividied by the number of people in the house
    co2e = (volume * co2powertype) / peopleSharingInt / 365;
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
    co2e = (volume * co2powertype) / peopleSharingInt / 365;
  }

  // Water
  else if (energy == "water") {
    double co2PerM3 = 7575;
    co2e = (volume * co2PerM3) / peopleSharingInt / 365;
  }

  return co2e.round();
}

int foodActionsCO2e(
  String food,
  String mainComponent,
  String sideComponent,
) {
  double co2e = 0.0;

  // FRUITS & SEEDS
  // Fruit : 0.27 g.co2e / g | 85g / portion
  double co2eFruit = 0.27 * 85;
  // Transformed fruit (compote) : 0.68 g.co2e / g | 85g  / portion
  double co2eTransformedFruit = 0.68 * 85;
  // Seed : 1.33 g.co2e / g |  40g / portion
  double co2eSeed = 1.33 * 40;

  // PROTEIN
  // Fish : 6.18 g.co2e / g | 110g / portion
  double co2eFish = 6.18 * 110;
  // Shellfish : 10.7 g.co2e / g | 110g / portion
  double co2eShellfish = 10.7 * 110;
  // Egg : 2.61 g.co2e / g | 50g / portion
  double co2eEgg = 2.61 * 50;
  // Meat : 21.78 g.co2e / g | 110g / portion
  double co2eMeat = 21.78 * 110;
  // Poultry : 5.91 g.co2e / g | 110g / portion
  double co2ePoultry = 5.91 * 110;
  // Deli : 7 g.co2e / g | 110g / portion
  double co2eDeli = 7.0 * 110;
  // Offal : 7.36 g.co2e / g | 110g / portion
  double co2eOffal = 7.36 * 110;

  // VEGETABLES / CEREALS / STARCHES
  // Breakfast cereals : 0.34 g.co2e / g | 80g / portion
  double co2eBreakfastCereals = 0.34 * 80;
  // Rice / Pasta / Wheat / Cereals : 0.71 g.co2e / g | 170g / portion
  double co2eRicePastaWheat = 0.71 * 170;
  // Legume (beans, because) : 0.79 g.co2e / g | 70g / portion
  double co2eLegume = 0.79 * 70;
  // Potatoes : 0.60 g.co2e / g | 170g / portion
  double co2ePotatoes = 0.60 * 170;
  // Vegetables : 1.29 g.co2e / g | 250g / portion
  double co2eVegetables = 1.29 * 250;

  // DAIRY
  // Glass of milk : 1.22 g.co2e / g | 250g / portion
  double co2eGlassMilk = 1.22 * 250;
  // Yogurt : 2.88 g.co2e / g | 100g / portion
  double co2eYogurt = 2.88 * 100;
  // Cheese  : 4.94 g.co2e / g | 30g / portion
  double co2eCheese = 4.94 * 30;

  // DESERT / CAKE
  // Cake / Pastry : 2.87 g.co2e / g | 40g / portion
  double co2eCakePastry = 2.87 * 40;
  // Icecream : 2.81 g.co2e / g | 50g / portion
  double co2eIcecream = 2.81 * 50;
  // Custard  : 1.51 g.co2e / g | 100g / portion
  double co2eCustard = 1.51 * 100;
  // Chocolate / Sweets  : 5.63 g.co2e / g |  ?

  // DRINKS
  // Bottle of Water  : 0.40 g.co2e / g | 250g / portion
  double co2eBottleWater = 0.40 * 250;
  // Tap Water : 0 g.co2e / g | 250g / portion
  double co2eTapWater = 0.0 * 250;
  // Fruit juice  : 1.90 g.co2e / g | 250g / portion
  double co2eFruitJuice = 1.90 * 250;
  // Soup : 0.95 g.co2e / g | 250g / portion
  double co2eSoup = 0.95 * 250;
  // Alcohol : 2.05 g.co2e / g | 250g / portion
  double co2eAlcohol = 2.05 * 250;
  // Hot drink  : 1.34 g.co2e / g | 250g / portion
  double co2eHotDrink = 1.34 * 250;
  // Soda : 1.34 g.co2e / g | 170g  / canette
  double co2eSoda = 170;

  // Bread
  // Bread  : 1.52 g.co2e / g | 50g / portion
  double co2eBread = 1.52 * 50;

  // Coffee
  // http://www.bco2.fr/dt_cafe_875.htm 1 cup per day un g
  double co2eCoffeeFilter = 57;
  double co2eCoffeeExpresso = 44;
  double co2eCoffeeCapsule = 74;

  // JUNK FOOD needs portions

  if (food == "starter") {
    switch (mainComponent) {
      case "Végétarienne":
        co2e += 75;
        break;
      case "Mixte":
        co2e += 150;
        break;
      case "Viande":
        co2e += 300;
        break;
    }
  } else if (food == "main") {
    switch (mainComponent) {
      case "Oeuf":
        co2e += co2eEgg;
        break;
      case "Poisson":
        co2e += co2eFish;
        break;
      case "Viande rouge":
        co2e += co2eMeat;
        break;
      case "Viande blanche":
        co2e += co2ePoultry;
        break;
    }

    switch (sideComponent) {
      case "Riz":
        co2e += co2eRicePastaWheat;
        break;
      case "Pâtes":
        co2e += co2eRicePastaWheat;
        break;
      case "Blé":
        co2e += co2eRicePastaWheat;
        break;
      case "Légumes":
        co2e += co2eVegetables;
        break;
      case "Pommes de terre":
        co2e += co2ePotatoes;
        break;
    }

    if (mainComponent == "Végétarien") {
      co2e = co2e * 2;
    }
  } else if (food == "desert") {
    switch (mainComponent) {
      case "Fruit":
        co2e += co2eFruit;
        break;
      case "Fruit transformé":
        co2e += co2eTransformedFruit;
        break;
      case "Yahourt":
        co2e += co2eYogurt;
        break;
      case "Pâtisserie":
        co2e += co2eCakePastry;
        break;
      case "Glace":
        co2e += co2eIcecream;
        break;
      case "Crême dessert":
        co2e += co2eCustard;
        break;
    }
  } else if (food == "drinks") {
    switch (mainComponent) {
      case "Eau en bouteille":
        co2e += co2eBottleWater;
        break;
      case "Eau du robinet":
        co2e += co2eTapWater;
        break;
      case "Jus de fruit":
        co2e += co2eFruitJuice;
        break;
      case "Soupe":
        co2e += co2eSoup;
        break;
      case "Alcool":
        co2e += co2eAlcohol;
        break;
      case "Boisson chaude":
        co2e += co2eHotDrink;
        break;
      case "Soda":
        co2e += co2eSoda;
        break;
    }
  } else if (food == "cheese") {
    int count = int.parse(mainComponent);
    co2e += co2eCheese * count;
  } else if (food == "bread") {
    int count = int.parse(mainComponent);
    co2e += co2eBread * count;
  } else if (food == "coffee") {
    switch (mainComponent) {
      case "Café filtre":
        co2e += co2eCoffeeFilter;
        break;
      case "Expresso":
        co2e += co2eCoffeeExpresso;
        break;
      case "Capsule":
        co2e += co2eCoffeeCapsule;
        break;
    }
  }

  // Breakfast

  return co2e.round();
}

double percentProgressBar(
  int co2e,
  String period,
) {
  //int planet = 3300; // Green : what the planet can support
  int frenchAverage = 12500; // Yellow french avarage
  //int usaAverage = 40000; // Red USA average
  // More is black

  int threshold = frenchAverage;

  if (period == "day") {
    threshold = frenchAverage;
  } else if (period == "week") {
    threshold = frenchAverage * 7;
  } else if (period == "month") {
    threshold = frenchAverage * 30;
  }

  double percent = co2e / threshold;

  if (percent > 1) {
    return 1;
  } else {
    return percent;
  }
}
