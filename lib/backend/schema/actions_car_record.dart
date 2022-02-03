import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'actions_car_record.g.dart';

abstract class ActionsCarRecord
    implements Built<ActionsCarRecord, ActionsCarRecordBuilder> {
  static Serializer<ActionsCarRecord> get serializer =>
      _$actionsCarRecordSerializer;

  @nullable
  int get co2e;

  @nullable
  DateTime get date;

  @nullable
  int get distance;

  @nullable
  String get ownership;

  @nullable
  int get passengers;

  @nullable
  String get powertype;

  @nullable
  String get userId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ActionsCarRecordBuilder builder) => builder
    ..co2e = 0
    ..distance = 0
    ..ownership = ''
    ..passengers = 0
    ..powertype = ''
    ..userId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actionsCar');

  static Stream<ActionsCarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ActionsCarRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ActionsCarRecord._();
  factory ActionsCarRecord([void Function(ActionsCarRecordBuilder) updates]) =
      _$ActionsCarRecord;

  static ActionsCarRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createActionsCarRecordData({
  int co2e,
  DateTime date,
  int distance,
  String ownership,
  int passengers,
  String powertype,
  String userId,
}) =>
    serializers.toFirestore(
        ActionsCarRecord.serializer,
        ActionsCarRecord((a) => a
          ..co2e = co2e
          ..date = date
          ..distance = distance
          ..ownership = ownership
          ..passengers = passengers
          ..powertype = powertype
          ..userId = userId));
