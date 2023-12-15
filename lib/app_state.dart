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
      _actionCo2e = prefs.getInt('ff_actionCo2e') ?? _actionCo2e;
    });
    _safeInit(() {
      _chartXdays =
          prefs.getStringList('ff_chartXdays')?.map(int.parse).toList() ??
              _chartXdays;
    });
    _safeInit(() {
      _lastConnectionDay = prefs.containsKey('ff_lastConnectionDay')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastConnectionDay')!)
          : _lastConnectionDay;
    });
    _safeInit(() {
      _actionFE = prefs.getInt('ff_actionFE') ?? _actionFE;
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
    prefs.setInt('ff_actionCo2e', value);
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
    prefs.setStringList(
        'ff_chartXdays', value.map((x) => x.toString()).toList());
  }

  void addToChartXdays(int value) {
    _chartXdays.add(value);
    prefs.setStringList(
        'ff_chartXdays', _chartXdays.map((x) => x.toString()).toList());
  }

  void removeFromChartXdays(int value) {
    _chartXdays.remove(value);
    prefs.setStringList(
        'ff_chartXdays', _chartXdays.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromChartXdays(int index) {
    _chartXdays.removeAt(index);
    prefs.setStringList(
        'ff_chartXdays', _chartXdays.map((x) => x.toString()).toList());
  }

  void updateChartXdaysAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _chartXdays[index] = updateFn(_chartXdays[index]);
    prefs.setStringList(
        'ff_chartXdays', _chartXdays.map((x) => x.toString()).toList());
  }

  void insertAtIndexInChartXdays(int index, int value) {
    _chartXdays.insert(index, value);
    prefs.setStringList(
        'ff_chartXdays', _chartXdays.map((x) => x.toString()).toList());
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

  int _actionFE = 0;
  int get actionFE => _actionFE;
  set actionFE(int value) {
    _actionFE = value;
    prefs.setInt('ff_actionFE', value);
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
