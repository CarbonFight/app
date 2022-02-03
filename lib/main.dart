import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:carbon_fight/login/login_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home/home_widget.dart';
import 'profile/profile_widget.dart';
import 'add/add_widget.dart';
import 'list/list_widget.dart';
import 'help/help_widget.dart';
import 'add_car/add_car_widget.dart';

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
              ? NavBarPage()
              : LoginWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'AddCar';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'Profile': ProfileWidget(),
      'Add': AddWidget(),
      'List': ListWidget(),
      'Help': HelpWidget(),
      'AddCar': AddCarWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.primaryColor,
        selectedItemColor: FlutterFlowTheme.secondaryColor,
        unselectedItemColor: FlutterFlowTheme.tertiaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24,
            ),
            label: 'Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 24,
            ),
            label: 'Add',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 24,
            ),
            label: 'List',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_outline_sharp,
              size: 24,
            ),
            label: 'Help',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
              size: 30,
            ),
            label: 'Car',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
