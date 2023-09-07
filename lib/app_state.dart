import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _showSplash = prefs.getBool('ff_showSplash') ?? _showSplash;
    });
    _safeInit(() {
      _displayFoodActions =
          prefs.getBool('ff_displayFoodActions') ?? _displayFoodActions;
    });
    _safeInit(() {
      _displayEnergyActions =
          prefs.getBool('ff_displayEnergyActions') ?? _displayEnergyActions;
    });
    _safeInit(() {
      _displayTransportActions = prefs.getBool('ff_displayTransportActions') ??
          _displayTransportActions;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showSplash = true;
  bool get showSplash => _showSplash;
  set showSplash(bool _value) {
    _showSplash = _value;
    prefs.setBool('ff_showSplash', _value);
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool _value) {
    _loading = _value;
  }

  String _activeDate = '';
  String get activeDate => _activeDate;
  set activeDate(String _value) {
    _activeDate = _value;
  }

  int _activeDateRelative = 0;
  int get activeDateRelative => _activeDateRelative;
  set activeDateRelative(int _value) {
    _activeDateRelative = _value;
  }

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

  bool _displayOptions = false;
  bool get displayOptions => _displayOptions;
  set displayOptions(bool _value) {
    _displayOptions = _value;
  }

  bool _displayDates = false;
  bool get displayDates => _displayDates;
  set displayDates(bool _value) {
    _displayDates = _value;
  }

  bool _displayDays = false;
  bool get displayDays => _displayDays;
  set displayDays(bool _value) {
    _displayDays = _value;
  }

  List<double> _XAxisDays = [-6, -5, -4, -3, -2, -1, 0];
  List<double> get XAxisDays => _XAxisDays;
  set XAxisDays(List<double> _value) {
    _XAxisDays = _value;
  }

  void addToXAxisDays(double _value) {
    _XAxisDays.add(_value);
  }

  void removeFromXAxisDays(double _value) {
    _XAxisDays.remove(_value);
  }

  void removeAtIndexFromXAxisDays(int _index) {
    _XAxisDays.removeAt(_index);
  }

  void updateXAxisDaysAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _XAxisDays[_index] = updateFn(_XAxisDays[_index]);
  }

  void insertAtIndexInXAxisDays(int _index, double _value) {
    _XAxisDays.insert(_index, _value);
  }

  List<double> _XAxisWeeks = [-3, -2, -1, 0];
  List<double> get XAxisWeeks => _XAxisWeeks;
  set XAxisWeeks(List<double> _value) {
    _XAxisWeeks = _value;
  }

  void addToXAxisWeeks(double _value) {
    _XAxisWeeks.add(_value);
  }

  void removeFromXAxisWeeks(double _value) {
    _XAxisWeeks.remove(_value);
  }

  void removeAtIndexFromXAxisWeeks(int _index) {
    _XAxisWeeks.removeAt(_index);
  }

  void updateXAxisWeeksAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _XAxisWeeks[_index] = updateFn(_XAxisWeeks[_index]);
  }

  void insertAtIndexInXAxisWeeks(int _index, double _value) {
    _XAxisWeeks.insert(_index, _value);
  }

  List<double> _XAxisMonths = [-3, -2, -1, 0];
  List<double> get XAxisMonths => _XAxisMonths;
  set XAxisMonths(List<double> _value) {
    _XAxisMonths = _value;
  }

  void addToXAxisMonths(double _value) {
    _XAxisMonths.add(_value);
  }

  void removeFromXAxisMonths(double _value) {
    _XAxisMonths.remove(_value);
  }

  void removeAtIndexFromXAxisMonths(int _index) {
    _XAxisMonths.removeAt(_index);
  }

  void updateXAxisMonthsAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _XAxisMonths[_index] = updateFn(_XAxisMonths[_index]);
  }

  void insertAtIndexInXAxisMonths(int _index, double _value) {
    _XAxisMonths.insert(_index, _value);
  }

  int _actionCO2e = 0;
  int get actionCO2e => _actionCO2e;
  set actionCO2e(int _value) {
    _actionCO2e = _value;
  }

  int _actionEmissionFactor = 0;
  int get actionEmissionFactor => _actionEmissionFactor;
  set actionEmissionFactor(int _value) {
    _actionEmissionFactor = _value;
  }

  String _actionHint = '';
  String get actionHint => _actionHint;
  set actionHint(String _value) {
    _actionHint = _value;
  }
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
