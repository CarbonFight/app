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
  int get day0;

  @nullable
  int get day1;

  @nullable
  int get day2;

  @nullable
  int get day3;

  @nullable
  int get day4;

  @nullable
  int get day5;

  @nullable
  int get day6;

  @nullable
  int get month0;

  @nullable
  int get month1;

  @nullable
  int get month2;

  @nullable
  int get month3;

  @nullable
  String get uid;

  @nullable
  int get week0;

  @nullable
  int get week1;

  @nullable
  int get week2;

  @nullable
  int get week3;

  @nullable
  int get periodics;

  @nullable
  int get transportDay0;

  @nullable
  int get energyDay0;

  @nullable
  int get foodDay0;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersStatsRecordBuilder builder) => builder
    ..day0 = 0
    ..day1 = 0
    ..day2 = 0
    ..day3 = 0
    ..day4 = 0
    ..day5 = 0
    ..day6 = 0
    ..month0 = 0
    ..month1 = 0
    ..month2 = 0
    ..month3 = 0
    ..uid = ''
    ..week0 = 0
    ..week1 = 0
    ..week2 = 0
    ..week3 = 0
    ..periodics = 0
    ..transportDay0 = 0
    ..energyDay0 = 0
    ..foodDay0 = 0;

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
  int day0,
  int day1,
  int day2,
  int day3,
  int day4,
  int day5,
  int day6,
  int month0,
  int month1,
  int month2,
  int month3,
  String uid,
  int week0,
  int week1,
  int week2,
  int week3,
  int periodics,
  int transportDay0,
  int energyDay0,
  int foodDay0,
}) =>
    serializers.toFirestore(
        UsersStatsRecord.serializer,
        UsersStatsRecord((u) => u
          ..day0 = day0
          ..day1 = day1
          ..day2 = day2
          ..day3 = day3
          ..day4 = day4
          ..day5 = day5
          ..day6 = day6
          ..month0 = month0
          ..month1 = month1
          ..month2 = month2
          ..month3 = month3
          ..uid = uid
          ..week0 = week0
          ..week1 = week1
          ..week2 = week2
          ..week3 = week3
          ..periodics = periodics
          ..transportDay0 = transportDay0
          ..energyDay0 = energyDay0
          ..foodDay0 = foodDay0));
