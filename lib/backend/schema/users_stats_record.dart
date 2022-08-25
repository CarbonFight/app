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

  int? get periodics;

  BuiltList<int>? get days;

  BuiltList<int>? get weeks;

  BuiltList<int>? get months;

  BuiltList<int>? get transports;

  BuiltList<int>? get energies;

  BuiltList<int>? get foods;

  int? get energyPeriodics;

  int? get foodPeriodics;

  int? get transportPeriodics;

  BuiltList<double>? get daysChart;

  BuiltList<double>? get weeksChart;

  BuiltList<double>? get monthsChart;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

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
  int? periodics,
  int? energyPeriodics,
  int? foodPeriodics,
  int? transportPeriodics,
}) {
  final firestoreData = serializers.toFirestore(
    UsersStatsRecord.serializer,
    UsersStatsRecord(
      (u) => u
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
        ..monthsChart = null,
    ),
  );

  return firestoreData;
}
