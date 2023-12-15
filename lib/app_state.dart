import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
      _lastConnectionDay = prefs.containsKey('ff_lastConnectionDay')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastConnectionDay')!)
          : _lastConnectionDay;
    });
    _safeInit(() {
      _successCount = prefs.getInt('ff_successCount') ?? _successCount;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _actionCo2e = 0;
  int get actionCo2e => _actionCo2e;
  set actionCo2e(int value) {
    _actionCo2e = value;
  }

  double _actionFE = 0.0;
  double get actionFE => _actionFE;
  set actionFE(double value) {
    _actionFE = value;
  }

  List<int> _chartXdays = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];
  List<int> get chartXdays => _chartXdays;
  set chartXdays(List<int> value) {
    _chartXdays = value;
  }

  void addToChartXdays(int value) {
    _chartXdays.add(value);
  }

  void removeFromChartXdays(int value) {
    _chartXdays.remove(value);
  }

  void removeAtIndexFromChartXdays(int index) {
    _chartXdays.removeAt(index);
  }

  void updateChartXdaysAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _chartXdays[index] = updateFn(_chartXdays[index]);
  }

  void insertAtIndexInChartXdays(int index, int value) {
    _chartXdays.insert(index, value);
  }

  DateTime? _lastConnectionDay =
      DateTime.fromMillisecondsSinceEpoch(1702651140000);
  DateTime? get lastConnectionDay => _lastConnectionDay;
  set lastConnectionDay(DateTime? value) {
    _lastConnectionDay = value;
    value != null
        ? prefs.setInt('ff_lastConnectionDay', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastConnectionDay');
  }

  int _successCount = 0;
  int get successCount => _successCount;
  set successCount(int value) {
    _successCount = value;
    prefs.setInt('ff_successCount', value);
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
