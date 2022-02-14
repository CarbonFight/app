// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom action code
Future<int> dayScore(String userId) async {
  // Add your function code here!

  int dayScore = 0;

  // Transports of the day
  await FirebaseFirestore.instance
      .collection('transportActions')
      .where("userId", isEqualTo: userId)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      dayScore += doc["co2e"];
    });
  });

  // Energy of the day
  await FirebaseFirestore.instance
      .collection('energyActions')
      .where("userId", isEqualTo: userId)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      dayScore += doc["co2e"];
    });
  });

  print("Transport + energy: " + dayScore.toString());
  return dayScore;
}
