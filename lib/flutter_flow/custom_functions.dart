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
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

String? pS(int? co2e) {
  String quantity = "0";
  String unit = "g";

  if (co2e! == 0) {
    quantity = "0";
    unit = " g";
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
  int? amortization,
  String? shared,
  int? emissionFactor,
) {
  // Default values
  count = count ?? 0;
  multiplicator = multiplicator ?? 1;
  amortization = amortization ?? 0;
  emissionFactor = emissionFactor ?? 0;
  shared = shared ?? "1";

  double co2e = 0;
  if (amortization != 0 && amortization != "") {
    co2e = ((emissionFactor * count) * multiplicator) /
        (amortization * 365) /
        int.parse(shared);
  } else {
    co2e = ((emissionFactor * count) * multiplicator) / int.parse(shared);
  }

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
  int successScore = 0;
  int successScoreTotal = 350;

  // Transport
  int successCountTransportTotal = 0;
  int successCountTransport = 0;

  // Services
  int successCountServicesTotal = 0;
  int successCountServices = 0;

  // Objects
  int successCountObjectsTotal = 0;
  int successCountObjects = 0;

  // Lodging
  int successCountLodgingTotal = 7;
  int successCountLodging = 0;

  // Furniture
  int successCountFurnitureTotal = 0;
  int successCountFurniture = 0;

  // Food
  int successCountFoodTotal = 0;
  int successCountFood = 0;

  // Digital
  int successCountDigitalTotal = 0;
  int successCountDigital = 0;

  // Clothes
  int successCountClothesTotal = 4;
  int successCountClothes = 0;

  // Appliance
  int successCountApplianceTotal = 0;
  int successCountAppliance = 0;

  // Total
  int successCountTotal = successCountTransportTotal +
      successCountServicesTotal +
      successCountObjectsTotal +
      successCountLodgingTotal +
      successCountFurnitureTotal +
      successCountFoodTotal +
      successCountDigitalTotal +
      successCountClothesTotal +
      successCountApplianceTotal;
  int successCount = successCountTransport +
      successCountServices +
      successCountObjects +
      successCountLodging +
      successCountFurniture +
      successCountFood +
      successCountDigital +
      successCountClothes +
      successCountAppliance;

  // Lodging Count
  if (success.led != 0) {
    successCountLodging += 1;
    successCount += 1;
  }
  if (success.pub != 0) {
    successCountLodging += 1;
    successCount += 1;
  }
  if (success.greenEnergy != 0) {
    successCountLodging += 1;
    successCount += 1;
  }
  if (success.lights != 0) {
    successCountLodging += 1;
    successCount += 1;
  }
  if (success.night != 0) {
    successCountLodging += 1;
    successCount += 1;
  }
  if (success.thermostat != 0) {
    successCountLodging += 1;
    successCount += 1;
  }
  if (success.bath != 0) {
    successCountLodging += 1;
    successCount += 1;
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

  // Lodging Count
  if (success.dry != 0) {
    successCountClothes += 1;
    successCount += 1;
  }
  if (success.cold != 0) {
    successCountClothes += 1;
    successCount += 1;
  }
  if (success.sell != 0) {
    successCountClothes += 1;
    successCount += 1;
  }
  if (success.second != 0) {
    successCountClothes += 1;
    successCount += 1;
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
    successScore, // 0
    successScoreTotal, // 1
    successCount, // 2
    successCountTotal, // 3
    successCountTransport, // 4
    successCountTransportTotal, // 5
    successCountServices, // 6
    successCountServicesTotal, // 7
    successCountObjects, // 8
    successCountObjectsTotal, // 9
    successCountLodging, // 10
    successCountLodgingTotal, // 11
    successCountFurniture, // 12
    successCountFurnitureTotal, // 13
    successCountFood, // 14
    successCountFoodTotal, // 15
    successCountDigital, // 16
    successCountDigitalTotal, // 17
    successCountClothes, // 18
    successCountClothesTotal, // 19
    successCountAppliance, // 20
    successCountApplianceTotal // 21
  ];
}

List<int> challengesStats(ChallengesRecord challenges) {
  int challengesScore = 0;
  int challengesScoreTotal = 80;

  // Transport
  int challengesCountTransportTotal = 0;
  int challengesCountTransport = 0;

  // Services
  int challengesCountServicesTotal = 0;
  int challengesCountServices = 0;

  // Objects
  int challengesCountObjectsTotal = 0;
  int challengesCountObjects = 0;

  // Lodging
  int challengesCountLodgingTotal = 0;
  int challengesCountLodging = 0;

  // Furniture
  int challengesCountFurnitureTotal = 0;
  int challengesCountFurniture = 0;

  // Food
  int challengesCountFoodTotal = 0;
  int challengesCountFood = 0;

  // Digital
  int challengesCountDigitalTotal = 0;
  int challengesCountDigital = 0;

  // Clothes
  int challengesCountClothesTotal = 0;
  int challengesCountClothes = 0;

  // Appliance
  int challengesCountApplianceTotal = 0;
  int challengesCountAppliance = 0;

  // Onboarding
  int challengesCountOnboardingTotal = 8;
  int challengesCountOnboarding = 0;

  // Loyalty
  int challengesCountLoyaltyTotal = 0;
  int challengesCountLoyalty = 0;

  // Community
  int challengesCountCommunityTotal = 0;
  int challengesCountCommunity = 0;

  // Total
  int challengesCountTotal = challengesCountTransportTotal +
      challengesCountServicesTotal +
      challengesCountObjectsTotal +
      challengesCountLodgingTotal +
      challengesCountFurnitureTotal +
      challengesCountFoodTotal +
      challengesCountDigitalTotal +
      challengesCountClothesTotal +
      challengesCountApplianceTotal +
      challengesCountOnboardingTotal +
      challengesCountLoyaltyTotal +
      challengesCountCommunityTotal;
  int challengesCount = challengesCountTransport +
      challengesCountServices +
      challengesCountObjects +
      challengesCountLodging +
      challengesCountFurniture +
      challengesCountFood +
      challengesCountDigital +
      challengesCountClothes +
      challengesCountAppliance +
      challengesCountOnboarding +
      challengesCountLoyalty +
      challengesCountCommunity;

  if (challenges.onboardingTransport) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingServices) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingObjects) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingLodging) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingFurniture) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingFood) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingDigital) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingClothes) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }
  if (challenges.onboardingAppliance) {
    challengesCount += 1;
    challengesCountOnboarding += 1;
    challengesScore += 10;
  }

  return [
    challengesScore, // 0
    challengesScoreTotal, // 1
    challengesCount, // 2
    challengesCountTotal, // 3
    challengesCountTransport, // 4
    challengesCountTransportTotal, // 5
    challengesCountServices, // 6
    challengesCountServicesTotal, // 7
    challengesCountObjects, // 8
    challengesCountObjectsTotal, // 9
    challengesCountLodging, // 10
    challengesCountLodgingTotal, // 11
    challengesCountFurniture, // 12
    challengesCountFurnitureTotal, // 13
    challengesCountFood, // 14
    challengesCountFoodTotal, // 15
    challengesCountDigital, // 16
    challengesCountDigitalTotal, // 17
    challengesCountClothes, // 18
    challengesCountClothesTotal, // 19
    challengesCountAppliance, // 20
    challengesCountApplianceTotal, // 21
    challengesCountOnboarding, // 22
    challengesCountOnboardingTotal, // 23
    challengesCountLoyalty, // 24
    challengesCountLoyaltyTotal, // 25
    challengesCountCommunity, // 26
    challengesCountCommunityTotal // 27
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

List<int> itemEndYear(
  String yearBuy,
  int yearsDecay,
) {
  // return number of days for objects

  // This year
  String yearNow = DateFormat('y').format(new DateTime.now());

  int yearsLeft = int.parse(yearBuy) - int.parse(yearNow) + yearsDecay;
  int yearEnd = int.parse(yearNow) + yearsLeft;

  // if user set buy date before year of creation
  if (yearsLeft < 0) {
    yearsLeft = 0;
    yearEnd = int.parse(yearNow);
  }

  return [yearsLeft, yearEnd];
}

int actionsStats(int actionsCount) {
  return (actionsCount * 10);
}

int calculateScore(
  int actions,
  int challenges,
  int success,
) {
  return (actions + success + challenges);
}

int pQuotaLeft(
  double target,
  int co2eDay,
) {
  double targetDay = target * 1000000 / 365; // T to g
  return (targetDay - co2eDay).round();
}
