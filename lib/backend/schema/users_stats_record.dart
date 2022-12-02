import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_stats_record.g.dart';

abstract class UsersStatsRecord
    implements Built<UsersStatsRecord, UsersStatsRecordBuilder> {
  static Serializer<UsersStatsRecord> get serializer =>
      _$usersStatsRecordSerializer;

  String? get uid;

  BuiltList<int>? get days;

  BuiltList<int>? get weeks;

  BuiltList<int>? get months;

  BuiltList<double>? get daysChart;

  BuiltList<double>? get weeksChart;

  BuiltList<double>? get monthsChart;

  int? get co2target;

  int? get daysStreak;

  bool? get trophy50Actions;

  bool? get trophy50Actions3Periodics;

  bool? get trophy50ActionsStart;

  bool? get trophy50ActionsGoals;

  bool? get trophy50Actions7DaysStreak;

  int? get globalScore;

  int? get globalProjection;

  int? get trophiesPoints;

  int? get allActionsCount;

  int? get allPeriodicsCO2e;

  int? get allPeriodicsCount;

  BuiltList<int>? get foodActionsDayCO2e;

  BuiltList<int>? get foodActionsWeekCO2e;

  BuiltList<int>? get foodActionsMonthCO2e;

  int? get foodActionsCount;

  int? get foodPeriodicsCO2e;

  int? get foodPeriodicsCount;

  BuiltList<int>? get energyActionsDayCO2e;

  BuiltList<int>? get energyActionsWeekCO2e;

  BuiltList<int>? get energyActionsMonthCO2e;

  int? get energyActionsCount;

  int? get energyPeriodicsCO2e;

  int? get energyPeriodicsCount;

  BuiltList<int>? get transportActionsDayCO2e;

  BuiltList<int>? get transportActionsWeekCO2e;

  BuiltList<int>? get transportActionsMonthCO2e;

  int? get transportActionsCount;

  int? get transportPeriodicsCO2e;

  int? get transportPeriodicsCount;

  BuiltList<double>? get foodActionsDayCO2eChart;

  BuiltList<double>? get foodActionsWeekCO2eChart;

  BuiltList<double>? get foodActionsMonthCO2eChart;

  BuiltList<double>? get energyActionsDayCO2eChart;

  BuiltList<double>? get energyActionsWeekCO2eChart;

  BuiltList<double>? get energyActionsMonthCO2eChart;

  BuiltList<double>? get transportActionsDayCO2eChart;

  BuiltList<double>? get transportActionsWeekCO2eChart;

  BuiltList<double>? get transportActionsMonthCO2eChart;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersStatsRecordBuilder builder) => builder
    ..uid = ''
    ..days = ListBuilder()
    ..weeks = ListBuilder()
    ..months = ListBuilder()
    ..daysChart = ListBuilder()
    ..weeksChart = ListBuilder()
    ..monthsChart = ListBuilder()
    ..co2target = 0
    ..daysStreak = 0
    ..trophy50Actions = false
    ..trophy50Actions3Periodics = false
    ..trophy50ActionsStart = false
    ..trophy50ActionsGoals = false
    ..trophy50Actions7DaysStreak = false
    ..globalScore = 0
    ..globalProjection = 0
    ..trophiesPoints = 0
    ..allActionsCount = 0
    ..allPeriodicsCO2e = 0
    ..allPeriodicsCount = 0
    ..foodActionsDayCO2e = ListBuilder()
    ..foodActionsWeekCO2e = ListBuilder()
    ..foodActionsMonthCO2e = ListBuilder()
    ..foodActionsCount = 0
    ..foodPeriodicsCO2e = 0
    ..foodPeriodicsCount = 0
    ..energyActionsDayCO2e = ListBuilder()
    ..energyActionsWeekCO2e = ListBuilder()
    ..energyActionsMonthCO2e = ListBuilder()
    ..energyActionsCount = 0
    ..energyPeriodicsCO2e = 0
    ..energyPeriodicsCount = 0
    ..transportActionsDayCO2e = ListBuilder()
    ..transportActionsWeekCO2e = ListBuilder()
    ..transportActionsMonthCO2e = ListBuilder()
    ..transportActionsCount = 0
    ..transportPeriodicsCO2e = 0
    ..transportPeriodicsCount = 0
    ..foodActionsDayCO2eChart = ListBuilder()
    ..foodActionsWeekCO2eChart = ListBuilder()
    ..foodActionsMonthCO2eChart = ListBuilder()
    ..energyActionsDayCO2eChart = ListBuilder()
    ..energyActionsWeekCO2eChart = ListBuilder()
    ..energyActionsMonthCO2eChart = ListBuilder()
    ..transportActionsDayCO2eChart = ListBuilder()
    ..transportActionsWeekCO2eChart = ListBuilder()
    ..transportActionsMonthCO2eChart = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersStats');

  static Stream<UsersStatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersStatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersStatsRecord._();
  factory UsersStatsRecord([void Function(UsersStatsRecordBuilder) updates]) =
      _$UsersStatsRecord;

  static UsersStatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    UsersStatsRecord.serializer,
    UsersStatsRecord(
      (u) => u
        ..uid = uid
        ..days = null
        ..weeks = null
        ..months = null
        ..daysChart = null
        ..weeksChart = null
        ..monthsChart = null
        ..co2target = co2target
        ..daysStreak = daysStreak
        ..trophy50Actions = trophy50Actions
        ..trophy50Actions3Periodics = trophy50Actions3Periodics
        ..trophy50ActionsStart = trophy50ActionsStart
        ..trophy50ActionsGoals = trophy50ActionsGoals
        ..trophy50Actions7DaysStreak = trophy50Actions7DaysStreak
        ..globalScore = globalScore
        ..globalProjection = globalProjection
        ..trophiesPoints = trophiesPoints
        ..allActionsCount = allActionsCount
        ..allPeriodicsCO2e = allPeriodicsCO2e
        ..allPeriodicsCount = allPeriodicsCount
        ..foodActionsDayCO2e = null
        ..foodActionsWeekCO2e = null
        ..foodActionsMonthCO2e = null
        ..foodActionsCount = foodActionsCount
        ..foodPeriodicsCO2e = foodPeriodicsCO2e
        ..foodPeriodicsCount = foodPeriodicsCount
        ..energyActionsDayCO2e = null
        ..energyActionsWeekCO2e = null
        ..energyActionsMonthCO2e = null
        ..energyActionsCount = energyActionsCount
        ..energyPeriodicsCO2e = energyPeriodicsCO2e
        ..energyPeriodicsCount = energyPeriodicsCount
        ..transportActionsDayCO2e = null
        ..transportActionsWeekCO2e = null
        ..transportActionsMonthCO2e = null
        ..transportActionsCount = transportActionsCount
        ..transportPeriodicsCO2e = transportPeriodicsCO2e
        ..transportPeriodicsCount = transportPeriodicsCount
        ..foodActionsDayCO2eChart = null
        ..foodActionsWeekCO2eChart = null
        ..foodActionsMonthCO2eChart = null
        ..energyActionsDayCO2eChart = null
        ..energyActionsWeekCO2eChart = null
        ..energyActionsMonthCO2eChart = null
        ..transportActionsDayCO2eChart = null
        ..transportActionsWeekCO2eChart = null
        ..transportActionsMonthCO2eChart = null,
    ),
  );

  return firestoreData;
}
