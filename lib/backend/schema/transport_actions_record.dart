import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transport_actions_record.g.dart';

abstract class TransportActionsRecord
    implements Built<TransportActionsRecord, TransportActionsRecordBuilder> {
  static Serializer<TransportActionsRecord> get serializer =>
      _$transportActionsRecordSerializer;

  @nullable
  String get transport;

  @nullable
  int get distance;

  @nullable
  String get powertype;

  @nullable
  int get passengers;

  @nullable
  String get ownership;

  @nullable
  String get userId;

  @nullable
  int get co2e;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransportActionsRecordBuilder builder) =>
      builder
        ..transport = ''
        ..distance = 0
        ..powertype = ''
        ..passengers = 0
        ..ownership = ''
        ..userId = ''
        ..co2e = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transportActions');

  static Stream<TransportActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransportActionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransportActionsRecord._();
  factory TransportActionsRecord(
          [void Function(TransportActionsRecordBuilder) updates]) =
      _$TransportActionsRecord;

  static TransportActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransportActionsRecordData({
  String transport,
  int distance,
  String powertype,
  int passengers,
  String ownership,
  String userId,
  int co2e,
  DateTime createdTime,
}) =>
    serializers.toFirestore(
        TransportActionsRecord.serializer,
        TransportActionsRecord((t) => t
          ..transport = transport
          ..distance = distance
          ..powertype = powertype
          ..passengers = passengers
          ..ownership = ownership
          ..userId = userId
          ..co2e = co2e
          ..createdTime = createdTime));
