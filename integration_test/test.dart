import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:carbon_fight/main.dart';
import 'package:carbon_fight/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:carbon_fight/backend/firebase/firebase_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Signin Email', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));

    await tester.tap(find.byKey(ValueKey('Text_c72v')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 5000),
    );
    expect(find.byKey(ValueKey('Button_3aqs')), findsWidgets);
    await tester.enterText(
        find.byKey(ValueKey('lastname_9toe')), 'FFTestLastName');
    await tester.enterText(
        find.byKey(ValueKey('firstname_fcye')), 'FFTestFirstName');
    await tester.enterText(
        find.byKey(ValueKey('email_9a72')), 'FFTest@carbonfight.app');
    await tester.enterText(
        find.byKey(ValueKey('password_ds89')), 'FFTestPassword');
    await tester.tap(find.byKey(ValueKey('optin_v7sj')));
    await tester.tap(find.byKey(ValueKey('Button_3aqs')));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
