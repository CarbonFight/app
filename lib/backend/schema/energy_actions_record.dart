import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'energy_actions_record.g.dart';

abstract class EnergyActionsRecord
    implements Built<EnergyActionsRecord, EnergyActionsRecordBuilder> {
  static Serializer<EnergyActionsRecord> get serializer =>
      _$energyActionsRecordSerializer;

  @nullable
  String get energy;

  @nullable
  int get volume;

  @nullable
  String get powertype;

  @nullable
  int get peopleSharing;

  @nullable
  String get userId;

  @nullable
  int get co2e;

  @nullable
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EnergyActionsRecordBuilder builder) => builder
    ..energy = ''
    ..volume = 0
    ..powertype = ''
    ..peopleSharing = 0
    ..userId = ''
    ..co2e = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('energyActions');

  static Stream<EnergyActionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EnergyActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EnergyActionsRecord._();
  factory EnergyActionsRecord(
          [void Function(EnergyActionsRecordBuilder) updates]) =
      _$EnergyActionsRecord;

  static EnergyActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEnergyActionsRecordData({
  String energy,
  int volume,
  String powertype,
  int peopleSharing,
  String userId,
  int co2e,
  DateTime timestamp,
}) =>
    serializers.toFirestore(
        EnergyActionsRecord.serializer,
        EnergyActionsRecord((e) => e
          ..energy = energy
          ..volume = volume
          ..powertype = powertype
          ..peopleSharing = peopleSharing
          ..userId = userId
          ..co2e = co2e
          ..timestamp = timestamp));
