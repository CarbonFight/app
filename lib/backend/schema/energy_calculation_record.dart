import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'energy_calculation_record.g.dart';

abstract class EnergyCalculationRecord
    implements Built<EnergyCalculationRecord, EnergyCalculationRecordBuilder> {
  static Serializer<EnergyCalculationRecord> get serializer =>
      _$energyCalculationRecordSerializer;

  String? get powertype;

  String? get country;

  double? get co2;

  String? get energy;

  bool? get defaultValue;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EnergyCalculationRecordBuilder builder) =>
      builder
        ..powertype = ''
        ..country = ''
        ..co2 = 0.0
        ..energy = ''
        ..defaultValue = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('energyCalculation');

  static Stream<EnergyCalculationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EnergyCalculationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EnergyCalculationRecord._();
  factory EnergyCalculationRecord(
          [void Function(EnergyCalculationRecordBuilder) updates]) =
      _$EnergyCalculationRecord;

  static EnergyCalculationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEnergyCalculationRecordData({
  String? powertype,
  String? country,
  double? co2,
  String? energy,
  bool? defaultValue,
}) {
  final firestoreData = serializers.toFirestore(
    EnergyCalculationRecord.serializer,
    EnergyCalculationRecord(
      (e) => e
        ..powertype = powertype
        ..country = country
        ..co2 = co2
        ..energy = energy
        ..defaultValue = defaultValue,
    ),
  );

  return firestoreData;
}
