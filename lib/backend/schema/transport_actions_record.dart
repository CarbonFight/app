import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transport_actions_record.g.dart';

abstract class TransportActionsRecord
    implements Built<TransportActionsRecord, TransportActionsRecordBuilder> {
  static Serializer<TransportActionsRecord> get serializer =>
      _$transportActionsRecordSerializer;

  String? get transport;

  String? get powertype;

  String? get userId;

  int? get co2e;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get passengers;

  String? get day;

  BuiltList<String>? get periodicity;

  bool? get roundTrip;

  bool? get isPeriodic;

  bool? get isFavorite;

  String? get distance;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

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
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TransportActionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TransportActionsRecord._();
  factory TransportActionsRecord(
          [void Function(TransportActionsRecordBuilder) updates]) =
      _$TransportActionsRecord;

  static TransportActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTransportActionsRecordData({
  String? transport,
  String? powertype,
  String? userId,
  int? co2e,
  DateTime? createdTime,
  String? passengers,
  String? day,
  bool? roundTrip,
  bool? isPeriodic,
  bool? isFavorite,
  String? distance,
}) {
  final firestoreData = serializers.toFirestore(
    TransportActionsRecord.serializer,
    TransportActionsRecord(
      (t) => t
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
        ..distance = distance,
    ),
  );

  return firestoreData;
}
