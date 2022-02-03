import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int actionCarCO2(
  int distance,
  String passengers,
  String ownership,
  String powertype,
) {
  // powertype : CO2 per Km
  int co2powertype = powertype == "Thermic"
      ? 193
      : powertype == "Electricity"
          ? 20
          : powertype == "Hybrid"
              ? 50
              : 50;

  int co2 = distance * co2powertype;
  return co2;
}
