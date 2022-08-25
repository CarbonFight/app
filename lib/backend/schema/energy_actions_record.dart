import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'energy_actions_record.g.dart';

abstract class EnergyActionsRecord
    implements Built<EnergyActionsRecord, EnergyActionsRecordBuilder> {
  static Serializer<EnergyActionsRecord> get serializer =>
      _$energyActionsRecordSerializer;

  String? get energy;

  String? get powertype;

  String? get userId;

  int? get co2e;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get peopleSharing;

  String? get day;

  bool? get isPeriodic;

  String? get volume;

  bool? get isNew;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EnergyActionsRecordBuilder builder) => builder
    ..energy = ''
    ..powertype = ''
    ..userId = ''
    ..co2e = 0
    ..peopleSharing = ''
    ..day = ''
    ..isPeriodic = false
    ..volume = ''
    ..isNew = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('energyActions');

  static Stream<EnergyActionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EnergyActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EnergyActionsRecord._();
  factory EnergyActionsRecord(
          [void Function(EnergyActionsRecordBuilder) updates]) =
      _$EnergyActionsRecord;

  static EnergyActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEnergyActionsRecordData({
  String? energy,
  String? powertype,
  String? userId,
  int? co2e,
  DateTime? createdTime,
  String? peopleSharing,
  String? day,
  bool? isPeriodic,
  String? volume,
  bool? isNew,
}) {
  final firestoreData = serializers.toFirestore(
    EnergyActionsRecord.serializer,
    EnergyActionsRecord(
      (e) => e
        ..energy = energy
        ..powertype = powertype
        ..userId = userId
        ..co2e = co2e
        ..createdTime = createdTime
        ..peopleSharing = peopleSharing
        ..day = day
        ..isPeriodic = isPeriodic
        ..volume = volume
        ..isNew = isNew,
    ),
  );

  return firestoreData;
}
