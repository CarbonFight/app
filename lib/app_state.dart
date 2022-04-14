import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _showSplash = prefs.getBool('ff_showSplash') ?? _showSplash;
  }

  SharedPreferences prefs;

  bool addButtonsHome = false;

  bool _showSplash = true;
  bool get showSplash => _showSplash;
  set showSplash(bool _value) {
    _showSplash = _value;
    prefs.setBool('ff_showSplash', _value);
  }

  int actionCO2 = 0;

  DateTime time;

  bool loading = false;

  bool actionActive = true;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
