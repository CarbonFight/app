import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:carbon_fight/login/login_widget.dart';
import 'package:carbon_fight/home/home_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  Stream<CarbonFightFirebaseUser> userStream;
  CarbonFightFirebaseUser initialUser;
  bool displaySplashImage = true;

  void setLocale(Locale value) => setState(() => _locale = value);

  @override
  void initState() {
    super.initState();
    userStream = carbonFightFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarbonFight',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.primaryColor,
                  size: 50,
                ),
              ),
            )
          : currentUser.loggedIn
              ? HomeWidget()
              : LoginWidget(),
    );
  }
}
