import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersStatsRecord extends FirestoreRecord {
  UsersStatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "days" field.
  List<int>? _days;
  List<int> get days => _days ?? const [];
  bool hasDays() => _days != null;

  // "weeks" field.
  List<int>? _weeks;
  List<int> get weeks => _weeks ?? const [];
  bool hasWeeks() => _weeks != null;

  // "months" field.
  List<int>? _months;
  List<int> get months => _months ?? const [];
  bool hasMonths() => _months != null;

  // "daysChart" field.
  List<double>? _daysChart;
  List<double> get daysChart => _daysChart ?? const [];
  bool hasDaysChart() => _daysChart != null;

  // "weeksChart" field.
  List<double>? _weeksChart;
  List<double> get weeksChart => _weeksChart ?? const [];
  bool hasWeeksChart() => _weeksChart != null;

  // "monthsChart" field.
  List<double>? _monthsChart;
  List<double> get monthsChart => _monthsChart ?? const [];
  bool hasMonthsChart() => _monthsChart != null;

  // "co2target" field.
  int? _co2target;
  int get co2target => _co2target ?? 0;
  bool hasCo2target() => _co2target != null;

  // "daysStreak" field.
  int? _daysStreak;
  int get daysStreak => _daysStreak ?? 0;
  bool hasDaysStreak() => _daysStreak != null;

  // "trophy50Actions" field.
  bool? _trophy50Actions;
  bool get trophy50Actions => _trophy50Actions ?? false;
  bool hasTrophy50Actions() => _trophy50Actions != null;

  // "trophy50Actions3Periodics" field.
  bool? _trophy50Actions3Periodics;
  bool get trophy50Actions3Periodics => _trophy50Actions3Periodics ?? false;
  bool hasTrophy50Actions3Periodics() => _trophy50Actions3Periodics != null;

  // "trophy50ActionsStart" field.
  bool? _trophy50ActionsStart;
  bool get trophy50ActionsStart => _trophy50ActionsStart ?? false;
  bool hasTrophy50ActionsStart() => _trophy50ActionsStart != null;

  // "trophy50ActionsGoals" field.
  bool? _trophy50ActionsGoals;
  bool get trophy50ActionsGoals => _trophy50ActionsGoals ?? false;
  bool hasTrophy50ActionsGoals() => _trophy50ActionsGoals != null;

  // "trophy50Actions7DaysStreak" field.
  bool? _trophy50Actions7DaysStreak;
  bool get trophy50Actions7DaysStreak => _trophy50Actions7DaysStreak ?? false;
  bool hasTrophy50Actions7DaysStreak() => _trophy50Actions7DaysStreak != null;

  // "globalScore" field.
  int? _globalScore;
  int get globalScore => _globalScore ?? 0;
  bool hasGlobalScore() => _globalScore != null;

  // "globalProjection" field.
  int? _globalProjection;
  int get globalProjection => _globalProjection ?? 0;
  bool hasGlobalProjection() => _globalProjection != null;

  // "trophiesPoints" field.
  int? _trophiesPoints;
  int get trophiesPoints => _trophiesPoints ?? 0;
  bool hasTrophiesPoints() => _trophiesPoints != null;

  // "allActionsCount" field.
  int? _allActionsCount;
  int get allActionsCount => _allActionsCount ?? 0;
  bool hasAllActionsCount() => _allActionsCount != null;

  // "allPeriodicsCO2e" field.
  int? _allPeriodicsCO2e;
  int get allPeriodicsCO2e => _allPeriodicsCO2e ?? 0;
  bool hasAllPeriodicsCO2e() => _allPeriodicsCO2e != null;

  // "allPeriodicsCount" field.
  int? _allPeriodicsCount;
  int get allPeriodicsCount => _allPeriodicsCount ?? 0;
  bool hasAllPeriodicsCount() => _allPeriodicsCount != null;

  // "foodActionsDayCO2e" field.
  List<int>? _foodActionsDayCO2e;
  List<int> get foodActionsDayCO2e => _foodActionsDayCO2e ?? const [];
  bool hasFoodActionsDayCO2e() => _foodActionsDayCO2e != null;

  // "foodActionsWeekCO2e" field.
  List<int>? _foodActionsWeekCO2e;
  List<int> get foodActionsWeekCO2e => _foodActionsWeekCO2e ?? const [];
  bool hasFoodActionsWeekCO2e() => _foodActionsWeekCO2e != null;

  // "foodActionsMonthCO2e" field.
  List<int>? _foodActionsMonthCO2e;
  List<int> get foodActionsMonthCO2e => _foodActionsMonthCO2e ?? const [];
  bool hasFoodActionsMonthCO2e() => _foodActionsMonthCO2e != null;

  // "foodActionsCount" field.
  int? _foodActionsCount;
  int get foodActionsCount => _foodActionsCount ?? 0;
  bool hasFoodActionsCount() => _foodActionsCount != null;

  // "foodPeriodicsCO2e" field.
  int? _foodPeriodicsCO2e;
  int get foodPeriodicsCO2e => _foodPeriodicsCO2e ?? 0;
  bool hasFoodPeriodicsCO2e() => _foodPeriodicsCO2e != null;

  // "foodPeriodicsCount" field.
  int? _foodPeriodicsCount;
  int get foodPeriodicsCount => _foodPeriodicsCount ?? 0;
  bool hasFoodPeriodicsCount() => _foodPeriodicsCount != null;

  // "energyActionsDayCO2e" field.
  List<int>? _energyActionsDayCO2e;
  List<int> get energyActionsDayCO2e => _energyActionsDayCO2e ?? const [];
  bool hasEnergyActionsDayCO2e() => _energyActionsDayCO2e != null;

  // "energyActionsWeekCO2e" field.
  List<int>? _energyActionsWeekCO2e;
  List<int> get energyActionsWeekCO2e => _energyActionsWeekCO2e ?? const [];
  bool hasEnergyActionsWeekCO2e() => _energyActionsWeekCO2e != null;

  // "energyActionsMonthCO2e" field.
  List<int>? _energyActionsMonthCO2e;
  List<int> get energyActionsMonthCO2e => _energyActionsMonthCO2e ?? const [];
  bool hasEnergyActionsMonthCO2e() => _energyActionsMonthCO2e != null;

  // "energyActionsCount" field.
  int? _energyActionsCount;
  int get energyActionsCount => _energyActionsCount ?? 0;
  bool hasEnergyActionsCount() => _energyActionsCount != null;

  // "energyPeriodicsCO2e" field.
  int? _energyPeriodicsCO2e;
  int get energyPeriodicsCO2e => _energyPeriodicsCO2e ?? 0;
  bool hasEnergyPeriodicsCO2e() => _energyPeriodicsCO2e != null;

  // "energyPeriodicsCount" field.
  int? _energyPeriodicsCount;
  int get energyPeriodicsCount => _energyPeriodicsCount ?? 0;
  bool hasEnergyPeriodicsCount() => _energyPeriodicsCount != null;

  // "transportActionsDayCO2e" field.
  List<int>? _transportActionsDayCO2e;
  List<int> get transportActionsDayCO2e => _transportActionsDayCO2e ?? const [];
  bool hasTransportActionsDayCO2e() => _transportActionsDayCO2e != null;

  // "transportActionsWeekCO2e" field.
  List<int>? _transportActionsWeekCO2e;
  List<int> get transportActionsWeekCO2e =>
      _transportActionsWeekCO2e ?? const [];
  bool hasTransportActionsWeekCO2e() => _transportActionsWeekCO2e != null;

  // "transportActionsMonthCO2e" field.
  List<int>? _transportActionsMonthCO2e;
  List<int> get transportActionsMonthCO2e =>
      _transportActionsMonthCO2e ?? const [];
  bool hasTransportActionsMonthCO2e() => _transportActionsMonthCO2e != null;

  // "transportActionsCount" field.
  int? _transportActionsCount;
  int get transportActionsCount => _transportActionsCount ?? 0;
  bool hasTransportActionsCount() => _transportActionsCount != null;

  // "transportPeriodicsCO2e" field.
  int? _transportPeriodicsCO2e;
  int get transportPeriodicsCO2e => _transportPeriodicsCO2e ?? 0;
  bool hasTransportPeriodicsCO2e() => _transportPeriodicsCO2e != null;

  // "transportPeriodicsCount" field.
  int? _transportPeriodicsCount;
  int get transportPeriodicsCount => _transportPeriodicsCount ?? 0;
  bool hasTransportPeriodicsCount() => _transportPeriodicsCount != null;

  // "foodActionsDayCO2eChart" field.
  List<double>? _foodActionsDayCO2eChart;
  List<double> get foodActionsDayCO2eChart =>
      _foodActionsDayCO2eChart ?? const [];
  bool hasFoodActionsDayCO2eChart() => _foodActionsDayCO2eChart != null;

  // "foodActionsWeekCO2eChart" field.
  List<double>? _foodActionsWeekCO2eChart;
  List<double> get foodActionsWeekCO2eChart =>
      _foodActionsWeekCO2eChart ?? const [];
  bool hasFoodActionsWeekCO2eChart() => _foodActionsWeekCO2eChart != null;

  // "foodActionsMonthCO2eChart" field.
  List<double>? _foodActionsMonthCO2eChart;
  List<double> get foodActionsMonthCO2eChart =>
      _foodActionsMonthCO2eChart ?? const [];
  bool hasFoodActionsMonthCO2eChart() => _foodActionsMonthCO2eChart != null;

  // "energyActionsDayCO2eChart" field.
  List<double>? _energyActionsDayCO2eChart;
  List<double> get energyActionsDayCO2eChart =>
      _energyActionsDayCO2eChart ?? const [];
  bool hasEnergyActionsDayCO2eChart() => _energyActionsDayCO2eChart != null;

  // "energyActionsWeekCO2eChart" field.
  List<double>? _energyActionsWeekCO2eChart;
  List<double> get energyActionsWeekCO2eChart =>
      _energyActionsWeekCO2eChart ?? const [];
  bool hasEnergyActionsWeekCO2eChart() => _energyActionsWeekCO2eChart != null;

  // "energyActionsMonthCO2eChart" field.
  List<double>? _energyActionsMonthCO2eChart;
  List<double> get energyActionsMonthCO2eChart =>
      _energyActionsMonthCO2eChart ?? const [];
  bool hasEnergyActionsMonthCO2eChart() => _energyActionsMonthCO2eChart != null;

  // "transportActionsDayCO2eChart" field.
  List<double>? _transportActionsDayCO2eChart;
  List<double> get transportActionsDayCO2eChart =>
      _transportActionsDayCO2eChart ?? const [];
  bool hasTransportActionsDayCO2eChart() =>
      _transportActionsDayCO2eChart != null;

  // "transportActionsWeekCO2eChart" field.
  List<double>? _transportActionsWeekCO2eChart;
  List<double> get transportActionsWeekCO2eChart =>
      _transportActionsWeekCO2eChart ?? const [];
  bool hasTransportActionsWeekCO2eChart() =>
      _transportActionsWeekCO2eChart != null;

  // "transportActionsMonthCO2eChart" field.
  List<double>? _transportActionsMonthCO2eChart;
  List<double> get transportActionsMonthCO2eChart =>
      _transportActionsMonthCO2eChart ?? const [];
  bool hasTransportActionsMonthCO2eChart() =>
      _transportActionsMonthCO2eChart != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _days = getDataList(snapshotData['days']);
    _weeks = getDataList(snapshotData['weeks']);
    _months = getDataList(snapshotData['months']);
    _daysChart = getDataList(snapshotData['daysChart']);
    _weeksChart = getDataList(snapshotData['weeksChart']);
    _monthsChart = getDataList(snapshotData['monthsChart']);
    _co2target = castToType<int>(snapshotData['co2target']);
    _daysStreak = castToType<int>(snapshotData['daysStreak']);
    _trophy50Actions = snapshotData['trophy50Actions'] as bool?;
    _trophy50Actions3Periodics =
        snapshotData['trophy50Actions3Periodics'] as bool?;
    _trophy50ActionsStart = snapshotData['trophy50ActionsStart'] as bool?;
    _trophy50ActionsGoals = snapshotData['trophy50ActionsGoals'] as bool?;
    _trophy50Actions7DaysStreak =
        snapshotData['trophy50Actions7DaysStreak'] as bool?;
    _globalScore = castToType<int>(snapshotData['globalScore']);
    _globalProjection = castToType<int>(snapshotData['globalProjection']);
    _trophiesPoints = castToType<int>(snapshotData['trophiesPoints']);
    _allActionsCount = castToType<int>(snapshotData['allActionsCount']);
    _allPeriodicsCO2e = castToType<int>(snapshotData['allPeriodicsCO2e']);
    _allPeriodicsCount = castToType<int>(snapshotData['allPeriodicsCount']);
    _foodActionsDayCO2e = getDataList(snapshotData['foodActionsDayCO2e']);
    _foodActionsWeekCO2e = getDataList(snapshotData['foodActionsWeekCO2e']);
    _foodActionsMonthCO2e = getDataList(snapshotData['foodActionsMonthCO2e']);
    _foodActionsCount = castToType<int>(snapshotData['foodActionsCount']);
    _foodPeriodicsCO2e = castToType<int>(snapshotData['foodPeriodicsCO2e']);
    _foodPeriodicsCount = castToType<int>(snapshotData['foodPeriodicsCount']);
    _energyActionsDayCO2e = getDataList(snapshotData['energyActionsDayCO2e']);
    _energyActionsWeekCO2e = getDataList(snapshotData['energyActionsWeekCO2e']);
    _energyActionsMonthCO2e =
        getDataList(snapshotData['energyActionsMonthCO2e']);
    _energyActionsCount = castToType<int>(snapshotData['energyActionsCount']);
    _energyPeriodicsCO2e = castToType<int>(snapshotData['energyPeriodicsCO2e']);
    _energyPeriodicsCount =
        castToType<int>(snapshotData['energyPeriodicsCount']);
    _transportActionsDayCO2e =
        getDataList(snapshotData['transportActionsDayCO2e']);
    _transportActionsWeekCO2e =
        getDataList(snapshotData['transportActionsWeekCO2e']);
    _transportActionsMonthCO2e =
        getDataList(snapshotData['transportActionsMonthCO2e']);
    _transportActionsCount =
        castToType<int>(snapshotData['transportActionsCount']);
    _transportPeriodicsCO2e =
        castToType<int>(snapshotData['transportPeriodicsCO2e']);
    _transportPeriodicsCount =
        castToType<int>(snapshotData['transportPeriodicsCount']);
    _foodActionsDayCO2eChart =
        getDataList(snapshotData['foodActionsDayCO2eChart']);
    _foodActionsWeekCO2eChart =
        getDataList(snapshotData['foodActionsWeekCO2eChart']);
    _foodActionsMonthCO2eChart =
        getDataList(snapshotData['foodActionsMonthCO2eChart']);
    _energyActionsDayCO2eChart =
        getDataList(snapshotData['energyActionsDayCO2eChart']);
    _energyActionsWeekCO2eChart =
        getDataList(snapshotData['energyActionsWeekCO2eChart']);
    _energyActionsMonthCO2eChart =
        getDataList(snapshotData['energyActionsMonthCO2eChart']);
    _transportActionsDayCO2eChart =
        getDataList(snapshotData['transportActionsDayCO2eChart']);
    _transportActionsWeekCO2eChart =
        getDataList(snapshotData['transportActionsWeekCO2eChart']);
    _transportActionsMonthCO2eChart =
        getDataList(snapshotData['transportActionsMonthCO2eChart']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersStats');

  static Stream<UsersStatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersStatsRecord.fromSnapshot(s));

  static Future<UsersStatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersStatsRecord.fromSnapshot(s));

  static UsersStatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersStatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersStatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersStatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersStatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersStatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersStatsRecordData({
  String? uid,
  int? co2target,
  int? daysStreak,
  bool? trophy50Actions,
  bool? trophy50Actions3Periodics,
  bool? trophy50ActionsStart,
  bool? trophy50ActionsGoals,
  bool? trophy50Actions7DaysStreak,
  int? globalScore,
  int? globalProjection,
  int? trophiesPoints,
  int? allActionsCount,
  int? allPeriodicsCO2e,
  int? allPeriodicsCount,
  int? foodActionsCount,
  int? foodPeriodicsCO2e,
  int? foodPeriodicsCount,
  int? energyActionsCount,
  int? energyPeriodicsCO2e,
  int? energyPeriodicsCount,
  int? transportActionsCount,
  int? transportPeriodicsCO2e,
  int? transportPeriodicsCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'co2target': co2target,
      'daysStreak': daysStreak,
      'trophy50Actions': trophy50Actions,
      'trophy50Actions3Periodics': trophy50Actions3Periodics,
      'trophy50ActionsStart': trophy50ActionsStart,
      'trophy50ActionsGoals': trophy50ActionsGoals,
      'trophy50Actions7DaysStreak': trophy50Actions7DaysStreak,
      'globalScore': globalScore,
      'globalProjection': globalProjection,
      'trophiesPoints': trophiesPoints,
      'allActionsCount': allActionsCount,
      'allPeriodicsCO2e': allPeriodicsCO2e,
      'allPeriodicsCount': allPeriodicsCount,
      'foodActionsCount': foodActionsCount,
      'foodPeriodicsCO2e': foodPeriodicsCO2e,
      'foodPeriodicsCount': foodPeriodicsCount,
      'energyActionsCount': energyActionsCount,
      'energyPeriodicsCO2e': energyPeriodicsCO2e,
      'energyPeriodicsCount': energyPeriodicsCount,
      'transportActionsCount': transportActionsCount,
      'transportPeriodicsCO2e': transportPeriodicsCO2e,
      'transportPeriodicsCount': transportPeriodicsCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersStatsRecordDocumentEquality implements Equality<UsersStatsRecord> {
  const UsersStatsRecordDocumentEquality();

  @override
  bool equals(UsersStatsRecord? e1, UsersStatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        listEquality.equals(e1?.days, e2?.days) &&
        listEquality.equals(e1?.weeks, e2?.weeks) &&
        listEquality.equals(e1?.months, e2?.months) &&
        listEquality.equals(e1?.daysChart, e2?.daysChart) &&
        listEquality.equals(e1?.weeksChart, e2?.weeksChart) &&
        listEquality.equals(e1?.monthsChart, e2?.monthsChart) &&
        e1?.co2target == e2?.co2target &&
        e1?.daysStreak == e2?.daysStreak &&
        e1?.trophy50Actions == e2?.trophy50Actions &&
        e1?.trophy50Actions3Periodics == e2?.trophy50Actions3Periodics &&
        e1?.trophy50ActionsStart == e2?.trophy50ActionsStart &&
        e1?.trophy50ActionsGoals == e2?.trophy50ActionsGoals &&
        e1?.trophy50Actions7DaysStreak == e2?.trophy50Actions7DaysStreak &&
        e1?.globalScore == e2?.globalScore &&
        e1?.globalProjection == e2?.globalProjection &&
        e1?.trophiesPoints == e2?.trophiesPoints &&
        e1?.allActionsCount == e2?.allActionsCount &&
        e1?.allPeriodicsCO2e == e2?.allPeriodicsCO2e &&
        e1?.allPeriodicsCount == e2?.allPeriodicsCount &&
        listEquality.equals(e1?.foodActionsDayCO2e, e2?.foodActionsDayCO2e) &&
        listEquality.equals(e1?.foodActionsWeekCO2e, e2?.foodActionsWeekCO2e) &&
        listEquality.equals(
            e1?.foodActionsMonthCO2e, e2?.foodActionsMonthCO2e) &&
        e1?.foodActionsCount == e2?.foodActionsCount &&
        e1?.foodPeriodicsCO2e == e2?.foodPeriodicsCO2e &&
        e1?.foodPeriodicsCount == e2?.foodPeriodicsCount &&
        listEquality.equals(
            e1?.energyActionsDayCO2e, e2?.energyActionsDayCO2e) &&
        listEquality.equals(
            e1?.energyActionsWeekCO2e, e2?.energyActionsWeekCO2e) &&
        listEquality.equals(
            e1?.energyActionsMonthCO2e, e2?.energyActionsMonthCO2e) &&
        e1?.energyActionsCount == e2?.energyActionsCount &&
        e1?.energyPeriodicsCO2e == e2?.energyPeriodicsCO2e &&
        e1?.energyPeriodicsCount == e2?.energyPeriodicsCount &&
        listEquality.equals(
            e1?.transportActionsDayCO2e, e2?.transportActionsDayCO2e) &&
        listEquality.equals(
            e1?.transportActionsWeekCO2e, e2?.transportActionsWeekCO2e) &&
        listEquality.equals(
            e1?.transportActionsMonthCO2e, e2?.transportActionsMonthCO2e) &&
        e1?.transportActionsCount == e2?.transportActionsCount &&
        e1?.transportPeriodicsCO2e == e2?.transportPeriodicsCO2e &&
        e1?.transportPeriodicsCount == e2?.transportPeriodicsCount &&
        listEquality.equals(
            e1?.foodActionsDayCO2eChart, e2?.foodActionsDayCO2eChart) &&
        listEquality.equals(
            e1?.foodActionsWeekCO2eChart, e2?.foodActionsWeekCO2eChart) &&
        listEquality.equals(
            e1?.foodActionsMonthCO2eChart, e2?.foodActionsMonthCO2eChart) &&
        listEquality.equals(
            e1?.energyActionsDayCO2eChart, e2?.energyActionsDayCO2eChart) &&
        listEquality.equals(
            e1?.energyActionsWeekCO2eChart, e2?.energyActionsWeekCO2eChart) &&
        listEquality.equals(
            e1?.energyActionsMonthCO2eChart, e2?.energyActionsMonthCO2eChart) &&
        listEquality.equals(e1?.transportActionsDayCO2eChart,
            e2?.transportActionsDayCO2eChart) &&
        listEquality.equals(e1?.transportActionsWeekCO2eChart,
            e2?.transportActionsWeekCO2eChart) &&
        listEquality.equals(e1?.transportActionsMonthCO2eChart,
            e2?.transportActionsMonthCO2eChart);
  }

  @override
  int hash(UsersStatsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.days,
        e?.weeks,
        e?.months,
        e?.daysChart,
        e?.weeksChart,
        e?.monthsChart,
        e?.co2target,
        e?.daysStreak,
        e?.trophy50Actions,
        e?.trophy50Actions3Periodics,
        e?.trophy50ActionsStart,
        e?.trophy50ActionsGoals,
        e?.trophy50Actions7DaysStreak,
        e?.globalScore,
        e?.globalProjection,
        e?.trophiesPoints,
        e?.allActionsCount,
        e?.allPeriodicsCO2e,
        e?.allPeriodicsCount,
        e?.foodActionsDayCO2e,
        e?.foodActionsWeekCO2e,
        e?.foodActionsMonthCO2e,
        e?.foodActionsCount,
        e?.foodPeriodicsCO2e,
        e?.foodPeriodicsCount,
        e?.energyActionsDayCO2e,
        e?.energyActionsWeekCO2e,
        e?.energyActionsMonthCO2e,
        e?.energyActionsCount,
        e?.energyPeriodicsCO2e,
        e?.energyPeriodicsCount,
        e?.transportActionsDayCO2e,
        e?.transportActionsWeekCO2e,
        e?.transportActionsMonthCO2e,
        e?.transportActionsCount,
        e?.transportPeriodicsCO2e,
        e?.transportPeriodicsCount,
        e?.foodActionsDayCO2eChart,
        e?.foodActionsWeekCO2eChart,
        e?.foodActionsMonthCO2eChart,
        e?.energyActionsDayCO2eChart,
        e?.energyActionsWeekCO2eChart,
        e?.energyActionsMonthCO2eChart,
        e?.transportActionsDayCO2eChart,
        e?.transportActionsWeekCO2eChart,
        e?.transportActionsMonthCO2eChart
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersStatsRecord;
}
