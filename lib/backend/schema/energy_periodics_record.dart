import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'energy_periodics_record.g.dart';

abstract class EnergyPeriodicsRecord
    implements Built<EnergyPeriodicsRecord, EnergyPeriodicsRecordBuilder> {
  static Serializer<EnergyPeriodicsRecord> get serializer =>
      _$energyPeriodicsRecordSerializer;

  @nullable
  int get co2e;

  @nullable
  String get energy;

  @nullable
  String get powertype;

  @nullable
  String get userId;

  @nullable
  int get volume;

  @nullable
  String get peopleSharing;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EnergyPeriodicsRecordBuilder builder) =>
      builder
        ..co2e = 0
        ..energy = ''
        ..powertype = ''
        ..userId = ''
        ..volume = 0
        ..peopleSharing = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('energyPeriodics');

  static Stream<EnergyPeriodicsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EnergyPeriodicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EnergyPeriodicsRecord._();
  factory EnergyPeriodicsRecord(
          [void Function(EnergyPeriodicsRecordBuilder) updates]) =
      _$EnergyPeriodicsRecord;

  static EnergyPeriodicsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEnergyPeriodicsRecordData({
  int co2e,
  String energy,
  String powertype,
  String userId,
  int volume,
  String peopleSharing,
}) =>
    serializers.toFirestore(
        EnergyPeriodicsRecord.serializer,
        EnergyPeriodicsRecord((e) => e
          ..co2e = co2e
          ..energy = energy
          ..powertype = powertype
          ..userId = userId
          ..volume = volume
          ..peopleSharing = peopleSharing));
