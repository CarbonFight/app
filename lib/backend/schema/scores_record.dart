import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scores_record.g.dart';

abstract class ScoresRecord
    implements Built<ScoresRecord, ScoresRecordBuilder> {
  static Serializer<ScoresRecord> get serializer => _$scoresRecordSerializer;

  @nullable
  String get userId;

  @nullable
  int get userLevel;

  @nullable
  String get userPseudo;

  @nullable
  int get userScore;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ScoresRecordBuilder builder) => builder
    ..userId = ''
    ..userLevel = 0
    ..userPseudo = ''
    ..userScore = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scores');

  static Stream<ScoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ScoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ScoresRecord._();
  factory ScoresRecord([void Function(ScoresRecordBuilder) updates]) =
      _$ScoresRecord;

  static ScoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createScoresRecordData({
  String userId,
  int userLevel,
  String userPseudo,
  int userScore,
}) =>
    serializers.toFirestore(
        ScoresRecord.serializer,
        ScoresRecord((s) => s
          ..userId = userId
          ..userLevel = userLevel
          ..userPseudo = userPseudo
          ..userScore = userScore));
