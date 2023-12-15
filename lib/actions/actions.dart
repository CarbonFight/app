import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future updateFEandCOE(
  BuildContext context, {
  required String? category,
  required String? action,
  String? option,
  int? count,
  int? multiplicator,
  int? divider,
  String? shared,
}) async {
  ApiCallResponse? getEmissionFactor;

  getEmissionFactor = await GetEmissionFactorCall.call(
    category: category,
    action: action,
    option: option,
  );
  if ((getEmissionFactor.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().actionCo2e = functions.calculateActionCO2e(
          count,
          multiplicator,
          divider,
          shared,
          GetEmissionFactorCall.co2e(
            (getEmissionFactor?.jsonBody ?? ''),
          ));
      FFAppState().actionFE = GetEmissionFactorCall.co2e(
        (getEmissionFactor?.jsonBody ?? ''),
      );
    });
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Oups !'),
          content: const Text(
              'Il y a eu un problème lors de la réception du facteur d\'émission'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
