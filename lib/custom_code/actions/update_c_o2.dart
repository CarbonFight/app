// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom action code
Future<int> updateCO2(
  int distance,
  String powertype,
  int passengers,
  String ownership,
) async {
  // powertype : CO2 per Km
  double co2powertype = powertype == "Thermic"
      ? 193
      : powertype == "Electricity"
          ? 19.8
          : powertype == "Hybrid"
              ? 50
              : 50;

  // Ownership
  double co2ownership = ownership == "Owner"
      ? 1
      : ownership == "Short rent"
          ? 0.6
          : ownership == "Long rent"
              ? 0.8
              : ownership == "Taxi"
                  ? 0.4
                  : 1;

  double co2 = (distance * co2powertype * co2ownership) / passengers;
  return co2.round();
}
