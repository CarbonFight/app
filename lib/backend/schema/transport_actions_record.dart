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
  String get powertype;

  @nullable
  String get userId;

  @nullable
  int get co2e;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get passengers;

  @nullable
  String get day;

  @nullable
  BuiltList<String> get periodicity;

  @nullable
  bool get roundTrip;

  @nullable
  bool get isPeriodic;

  @nullable
  bool get isFavorite;

  @nullable
  String get distance;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransportActionsRecordBuilder builder) =>
      builder
        ..transport = ''
        ..powertype = ''
        ..userId = ''
        ..co2e = 0
        ..passengers = ''
        ..day = ''
        ..periodicity = ListBuilder()
        ..roundTrip = false
        ..isPeriodic = false
        ..isFavorite = false
        ..distance = '';

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
  String powertype,
  String userId,
  int co2e,
  DateTime createdTime,
  String passengers,
  String day,
  bool roundTrip,
  bool isPeriodic,
  bool isFavorite,
  String distance,
}) =>
    serializers.toFirestore(
        TransportActionsRecord.serializer,
        TransportActionsRecord((t) => t
          ..transport = transport
          ..powertype = powertype
          ..userId = userId
          ..co2e = co2e
          ..createdTime = createdTime
          ..passengers = passengers
          ..day = day
          ..periodicity = null
          ..roundTrip = roundTrip
          ..isPeriodic = isPeriodic
          ..isFavorite = isFavorite
          ..distance = distance));
