import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_stats_record.g.dart';

abstract class UsersStatsRecord
    implements Built<UsersStatsRecord, UsersStatsRecordBuilder> {
  static Serializer<UsersStatsRecord> get serializer =>
      _$usersStatsRecordSerializer;

  @nullable
  String get uid;

  @nullable
  int get periodics;

  @nullable
  BuiltList<int> get days;

  @nullable
  BuiltList<int> get weeks;

  @nullable
  BuiltList<int> get months;

  @nullable
  BuiltList<int> get transports;

  @nullable
  BuiltList<int> get energies;

  @nullable
  BuiltList<int> get foods;

  @nullable
  int get energyPeriodics;

  @nullable
  int get foodPeriodics;

  @nullable
  int get transportPeriodics;

  @nullable
  BuiltList<double> get daysChart;

  @nullable
  BuiltList<double> get weeksChart;

  @nullable
  BuiltList<double> get monthsChart;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersStatsRecordBuilder builder) => builder
    ..uid = ''
    ..periodics = 0
    ..days = ListBuilder()
    ..weeks = ListBuilder()
    ..months = ListBuilder()
    ..transports = ListBuilder()
    ..energies = ListBuilder()
    ..foods = ListBuilder()
    ..energyPeriodics = 0
    ..foodPeriodics = 0
    ..transportPeriodics = 0
    ..daysChart = ListBuilder()
    ..weeksChart = ListBuilder()
    ..monthsChart = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersStats');

  static Stream<UsersStatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersStatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersStatsRecord._();
  factory UsersStatsRecord([void Function(UsersStatsRecordBuilder) updates]) =
      _$UsersStatsRecord;

  static UsersStatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersStatsRecordData({
  String uid,
  int periodics,
  int energyPeriodics,
  int foodPeriodics,
  int transportPeriodics,
}) =>
    serializers.toFirestore(
        UsersStatsRecord.serializer,
        UsersStatsRecord((u) => u
          ..uid = uid
          ..periodics = periodics
          ..days = null
          ..weeks = null
          ..months = null
          ..transports = null
          ..energies = null
          ..foods = null
          ..energyPeriodics = energyPeriodics
          ..foodPeriodics = foodPeriodics
          ..transportPeriodics = transportPeriodics
          ..daysChart = null
          ..weeksChart = null
          ..monthsChart = null));
