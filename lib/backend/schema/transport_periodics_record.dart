import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transport_periodics_record.g.dart';

abstract class TransportPeriodicsRecord
    implements
        Built<TransportPeriodicsRecord, TransportPeriodicsRecordBuilder> {
  static Serializer<TransportPeriodicsRecord> get serializer =>
      _$transportPeriodicsRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get transport;

  @nullable
  int get distance;

  @nullable
  String get powertype;

  @nullable
  String get ownership;

  @nullable
  int get co2e;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get passengers;

  @nullable
  BuiltList<String> get periodicity;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransportPeriodicsRecordBuilder builder) =>
      builder
        ..uid = ''
        ..transport = ''
        ..distance = 0
        ..powertype = ''
        ..ownership = ''
        ..co2e = 0
        ..passengers = ''
        ..periodicity = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transportPeriodics');

  static Stream<TransportPeriodicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransportPeriodicsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransportPeriodicsRecord._();
  factory TransportPeriodicsRecord(
          [void Function(TransportPeriodicsRecordBuilder) updates]) =
      _$TransportPeriodicsRecord;

  static TransportPeriodicsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransportPeriodicsRecordData({
  String uid,
  String transport,
  int distance,
  String powertype,
  String ownership,
  int co2e,
  DateTime createdTime,
  String passengers,
}) =>
    serializers.toFirestore(
        TransportPeriodicsRecord.serializer,
        TransportPeriodicsRecord((t) => t
          ..uid = uid
          ..transport = transport
          ..distance = distance
          ..powertype = powertype
          ..ownership = ownership
          ..co2e = co2e
          ..createdTime = createdTime
          ..passengers = passengers
          ..periodicity = null));
