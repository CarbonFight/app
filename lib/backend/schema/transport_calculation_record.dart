import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transport_calculation_record.g.dart';

abstract class TransportCalculationRecord
    implements
        Built<TransportCalculationRecord, TransportCalculationRecordBuilder> {
  static Serializer<TransportCalculationRecord> get serializer =>
      _$transportCalculationRecordSerializer;

  String? get country;

  String? get powertype;

  String? get transport;

  double? get co2;

  bool? get defaultValue;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TransportCalculationRecordBuilder builder) =>
      builder
        ..country = ''
        ..powertype = ''
        ..transport = ''
        ..co2 = 0.0
        ..defaultValue = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transportCalculation');

  static Stream<TransportCalculationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TransportCalculationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TransportCalculationRecord._();
  factory TransportCalculationRecord(
          [void Function(TransportCalculationRecordBuilder) updates]) =
      _$TransportCalculationRecord;

  static TransportCalculationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTransportCalculationRecordData({
  String? country,
  String? powertype,
  String? transport,
  double? co2,
  bool? defaultValue,
}) {
  final firestoreData = serializers.toFirestore(
    TransportCalculationRecord.serializer,
    TransportCalculationRecord(
      (t) => t
        ..country = country
        ..powertype = powertype
        ..transport = transport
        ..co2 = co2
        ..defaultValue = defaultValue,
    ),
  );

  return firestoreData;
}
