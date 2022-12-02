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
    _displayFoodActions =
        prefs.getBool('ff_displayFoodActions') ?? _displayFoodActions;
    _displayEnergyActions =
        prefs.getBool('ff_displayEnergyActions') ?? _displayEnergyActions;
    _displayTransportActions =
        prefs.getBool('ff_displayTransportActions') ?? _displayTransportActions;
  }

  late SharedPreferences prefs;

  bool _showSplash = true;
  bool get showSplash => _showSplash;
  set showSplash(bool _value) {
    _showSplash = _value;
    prefs.setBool('ff_showSplash', _value);
  }

  bool loading = false;

  String activeDate = '';

  int activeDateRelative = 0;

  bool _displayFoodActions = true;
  bool get displayFoodActions => _displayFoodActions;
  set displayFoodActions(bool _value) {
    _displayFoodActions = _value;
    prefs.setBool('ff_displayFoodActions', _value);
  }

  bool _displayEnergyActions = true;
  bool get displayEnergyActions => _displayEnergyActions;
  set displayEnergyActions(bool _value) {
    _displayEnergyActions = _value;
    prefs.setBool('ff_displayEnergyActions', _value);
  }

  bool _displayTransportActions = true;
  bool get displayTransportActions => _displayTransportActions;
  set displayTransportActions(bool _value) {
    _displayTransportActions = _value;
    prefs.setBool('ff_displayTransportActions', _value);
  }

  bool displayOptions = false;

  bool displayDates = false;

  bool displayDays = false;

  List<double> XAxisDays = [-6, -5, -4, -3, -2, -1, 0];

  List<double> XAxisWeeks = [-3, -2, -1, 0];

  List<double> XAxisMonths = [-3, -2, -1, 0];
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
