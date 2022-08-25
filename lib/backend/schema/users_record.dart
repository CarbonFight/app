import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get email;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get uid;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  int? get co2target;

  int? get totalPoints;

  int? get globalScore;

  int? get globalProjection;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = ''
    ..phoneNumber = ''
    ..uid = ''
    ..photoUrl = ''
    ..co2target = 0
    ..totalPoints = 0
    ..globalScore = 0
    ..globalProjection = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  DateTime? createdTime,
  String? displayName,
  String? email,
  String? phoneNumber,
  String? uid,
  String? photoUrl,
  int? co2target,
  int? totalPoints,
  int? globalScore,
  int? globalProjection,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..createdTime = createdTime
        ..displayName = displayName
        ..email = email
        ..phoneNumber = phoneNumber
        ..uid = uid
        ..photoUrl = photoUrl
        ..co2target = co2target
        ..totalPoints = totalPoints
        ..globalScore = globalScore
        ..globalProjection = globalProjection,
    ),
  );

  return firestoreData;
}
