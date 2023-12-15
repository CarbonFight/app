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

String? pS(int? co2e) {
  String quantity = "0";
  String unit = "g";

  if (co2e! == 0) {
    quantity = "-";
    unit = "";
  } else if (co2e! < 1000) {
    quantity = co2e.toStringAsFixed(0);
    unit = " g";
  } else if (co2e >= 1000 && co2e < 10000) {
    quantity = (co2e / 1000).toStringAsFixed(2);
    unit = " kg";
  } else if (co2e >= 10000 && co2e < 20000) {
    quantity = (co2e / 1000).toStringAsFixed(1);
    unit = " kg";
  } else if (co2e >= 20000 && co2e < 1000000) {
    quantity = (co2e / 1000).toStringAsFixed(0);
    unit = " kg";
  } else if (co2e >= 1000000) {
    quantity = (co2e / 1000000).toStringAsFixed(2);
    unit = " T";
  }
  return quantity + unit;
}

double? pRatio(
  int co2e,
  double target,
) {
  // Convert Year target from Tonnes to Grammes and to Day target
  double targetDay = target * 1000000 / 365;
  String result;

  // avoiding division by 0
  if (targetDay == 0 && co2e > 0) {
    result = 1.toStringAsFixed(2);
  } else if (targetDay == 0 && co2e == 0) {
    result = 0.toStringAsFixed(2);
  } else {
    // Calculate ratio
    result = (co2e / targetDay).toStringAsFixed(2);
    if ((co2e / targetDay) > 1) {
      result = 1.toStringAsFixed(2);
    }
  }

  return double.parse(result);
}

int calculateActionCO2e(
  int? count,
  int? multiplicator,
  int? divider,
  String? shared,
  double? emissionFactor,
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

double? pRatioChallenges(
  int? score,
  int? target,
) {
  // Calculate ratio
  var ratio = (score! / target!);
  if (ratio > 1) {
    ratio = 1;
  }
  var output = ratio.toStringAsFixed(2);
  return double.parse(output);
}

String? pTargetDay(double? target) {
  double targetDay = target! * 1000 / 365;
  return targetDay.toStringAsFixed(1) + " Kg";
}

DateTime? lastMidnight() {
  var now = DateTime.now();
  var lastMidnight = DateTime(now.year, now.month, now.day);
  return lastMidnight;
}

List<int> successStats(SuccessRecord success) {
  // Score
  int successScoreTotal = 350;
  int successScore = 0;

  // Lodging
  int successCountLodgingTotal = 7;
  int successCountLodging = 0;

  // Lodging Count
  if (success.led != 0) {
    successCountLodging += 1;
  }
  if (success.pub != 0) {
    successCountLodging += 1;
  }
  if (success.greenEnergy != 0) {
    successCountLodging += 1;
  }
  if (success.lights != 0) {
    successCountLodging += 1;
  }
  if (success.night != 0) {
    successCountLodging += 1;
  }
  if (success.thermostat != 0) {
    successCountLodging += 1;
  }
  if (success.bath != 0) {
    successCountLodging += 1;
  }

  // Lodging points
  if (success.led == 1 || success.led == 3) {
    successScore += 30;
  }
  if (success.pub == 1 || success.pub == 3) {
    successScore += 30;
  }
  if (success.greenEnergy == 1 || success.greenEnergy == 3) {
    successScore += 50;
  }
  if (success.lights == 1 || success.lights == 3) {
    successScore += 30;
  }
  if (success.night == 1 || success.night == 3) {
    successScore += 30;
  }
  if (success.thermostat == 1 || success.thermostat == 3) {
    successScore += 30;
  }
  if (success.bath == 1 || success.bath == 3) {
    successScore += 30;
  }

  // Clothes
  int successCountClothesTotal = 4;
  int successCountClothes = 0;

  // Lodging Count
  if (success.dry != 0) {
    successCountClothes += 1;
  }
  if (success.cold != 0) {
    successCountClothes += 1;
  }
  if (success.sell != 0) {
    successCountClothes += 1;
  }
  if (success.second != 0) {
    successCountClothes += 1;
  }

  // Lodging points
  if (success.dry == 1 || success.dry == 3) {
    successScore += 30;
  }
  if (success.cold == 1 || success.cold == 3) {
    successScore += 30;
  }
  if (success.sell == 1 || success.sell == 3) {
    successScore += 30;
  }
  if (success.second == 1 || success.second == 3) {
    successScore += 30;
  }

  return [
    successScore,
    successScoreTotal,
    successCountLodging,
    successCountLodgingTotal,
    successCountClothes,
    successCountClothesTotal,
    0,
    4,
    0,
    3,
    0,
    7,
    0,
    11
  ];
}

List<int> challengesStats(ChallengesRecord challenges) {
  int challengesScore = 0;
  int challengesScoreTotal = 90;

  // Transport
  int challengesCountTransportTotal = 7;
  int challengesCountTransport = 0;

  if (challenges.onboardingTransport) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingServices) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingObjects) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingLodging) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingFurniture) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingFood) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingDigital) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingClothes) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingAppliance) {
    challengesCountTransport += 1;
    challengesScore += 10;
  }

  return [
    challengesScore,
    challengesScoreTotal,
    challengesCountTransport,
    challengesCountTransportTotal,
    0,
    13,
    0,
    5,
    0,
    5,
    0,
    5
  ];
}

String? pSFE(double? co2e) {
  String quantity = "0";
  String unit = "g";

  if (co2e! == 0) {
    quantity = "-";
    unit = "";
  } else if (co2e! < 1000) {
    quantity = co2e.toStringAsFixed(0);
    unit = " g";
  } else if (co2e >= 1000 && co2e < 10000) {
    quantity = (co2e / 1000).toStringAsFixed(2);
    unit = " kg";
  } else if (co2e >= 10000 && co2e < 20000) {
    quantity = (co2e / 1000).toStringAsFixed(1);
    unit = " kg";
  } else if (co2e >= 20000 && co2e < 1000000) {
    quantity = (co2e / 1000).toStringAsFixed(0);
    unit = " kg";
  } else if (co2e >= 1000000) {
    quantity = (co2e / 1000000).toStringAsFixed(2);
    unit = " T";
  }
  return quantity + unit;
}

List<int> depreciationDaysCalculator(
  String yearBuy,
  String? yearCreation,
  int? yearsDecay,
) {
  // return number of days for objects

  // This year
  String yearNow = DateFormat('y').format(new DateTime.now());
  // If yearCreation not set (buy new thing), set yearCreation=yearBuy
  yearCreation = yearCreation ?? yearBuy;
  // Default decay is 5 years
  yearsDecay = yearsDecay ?? 5;

  // Difference betweenn year of buy and year of creation
  int yearDiffNewOld = int.parse(yearBuy) - int.parse(yearCreation);
  // Difference between year of buy and this year
  int yearDiffBuy = int.parse(yearNow) - int.parse(yearBuy);

  int yearsLeft = yearsDecay - yearDiffNewOld - yearDiffBuy;

  // if user set buy date before year of creation
  if (yearsLeft < 0) {
    yearsLeft = 0;
  }

  int daysDecay = (yearsDecay * 365);

  return [daysDecay, yearsLeft];
}

String depreciationEndDate(
  String startYear,
  int yearsLeft,
) {
  String endYear = (int.parse(startYear) + yearsLeft).toString();
  return endYear;
}
