// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom action code
Future updateUserScores(String userId) async {
  // Add your function code here!

  int dayScore = 0;
  int globalScore = 0;

  // Transports of the day
  await FirebaseFirestore.instance
      .collection('transportActions')
      .where("userId", isEqualTo: userId)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      dayScore += doc["co2e"];
      globalScore += doc["co2e"];
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
      globalScore += doc["co2e"];
    });
  });

  // Update Scores
  QuerySnapshot querySnap = await FirebaseFirestore.instance
      .collection('scores')
      .where("userId", isEqualTo: userId)
      .get();
  QueryDocumentSnapshot doc = querySnap.docs[0];
  DocumentReference docRef = doc.reference;
  await docRef.update({'day_Score': dayScore});
  await docRef.update({'global_Score': globalScore});
}
