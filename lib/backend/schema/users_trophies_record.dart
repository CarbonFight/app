import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_trophies_record.g.dart';

abstract class UsersTrophiesRecord
    implements Built<UsersTrophiesRecord, UsersTrophiesRecordBuilder> {
  static Serializer<UsersTrophiesRecord> get serializer =>
      _$usersTrophiesRecordSerializer;

  String? get uid;

  bool? get hasStart;

  bool? get hasParams;

  bool? get hasGoals;

  bool? get has3Periodics;

  bool? get has50Actions;

  bool? get has7DaysStreak;

  bool? get has2Invites;

  bool? get has5Likes;

  bool? get hasReviewApp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersTrophiesRecordBuilder builder) => builder
    ..uid = ''
    ..hasStart = false
    ..hasParams = false
    ..hasGoals = false
    ..has3Periodics = false
    ..has50Actions = false
    ..has7DaysStreak = false
    ..has2Invites = false
    ..has5Likes = false
    ..hasReviewApp = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersTrophies');

  static Stream<UsersTrophiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersTrophiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersTrophiesRecord._();
  factory UsersTrophiesRecord(
          [void Function(UsersTrophiesRecordBuilder) updates]) =
      _$UsersTrophiesRecord;

  static UsersTrophiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersTrophiesRecordData({
  String? uid,
  bool? hasStart,
  bool? hasParams,
  bool? hasGoals,
  bool? has3Periodics,
  bool? has50Actions,
  bool? has7DaysStreak,
  bool? has2Invites,
  bool? has5Likes,
  bool? hasReviewApp,
}) {
  final firestoreData = serializers.toFirestore(
    UsersTrophiesRecord.serializer,
    UsersTrophiesRecord(
      (u) => u
        ..uid = uid
        ..hasStart = hasStart
        ..hasParams = hasParams
        ..hasGoals = hasGoals
        ..has3Periodics = has3Periodics
        ..has50Actions = has50Actions
        ..has7DaysStreak = has7DaysStreak
        ..has2Invites = has2Invites
        ..has5Likes = has5Likes
        ..hasReviewApp = hasReviewApp,
    ),
  );

  return firestoreData;
}
