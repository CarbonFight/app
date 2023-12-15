import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SuccessRecord extends FirestoreRecord {
  SuccessRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "led" field.
  int? _led;
  int get led => _led ?? 0;
  bool hasLed() => _led != null;

  // "pub" field.
  int? _pub;
  int get pub => _pub ?? 0;
  bool hasPub() => _pub != null;

  // "greenEnergy" field.
  int? _greenEnergy;
  int get greenEnergy => _greenEnergy ?? 0;
  bool hasGreenEnergy() => _greenEnergy != null;

  // "bath" field.
  int? _bath;
  int get bath => _bath ?? 0;
  bool hasBath() => _bath != null;

  // "thermostat" field.
  int? _thermostat;
  int get thermostat => _thermostat ?? 0;
  bool hasThermostat() => _thermostat != null;

  // "night" field.
  int? _night;
  int get night => _night ?? 0;
  bool hasNight() => _night != null;

  // "lights" field.
  int? _lights;
  int get lights => _lights ?? 0;
  bool hasLights() => _lights != null;

  // "sell" field.
  int? _sell;
  int get sell => _sell ?? 0;
  bool hasSell() => _sell != null;

  // "second" field.
  int? _second;
  int get second => _second ?? 0;
  bool hasSecond() => _second != null;

  // "cold" field.
  int? _cold;
  int get cold => _cold ?? 0;
  bool hasCold() => _cold != null;

  // "dry" field.
  int? _dry;
  int get dry => _dry ?? 0;
  bool hasDry() => _dry != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _led = castToType<int>(snapshotData['led']);
    _pub = castToType<int>(snapshotData['pub']);
    _greenEnergy = castToType<int>(snapshotData['greenEnergy']);
    _bath = castToType<int>(snapshotData['bath']);
    _thermostat = castToType<int>(snapshotData['thermostat']);
    _night = castToType<int>(snapshotData['night']);
    _lights = castToType<int>(snapshotData['lights']);
    _sell = castToType<int>(snapshotData['sell']);
    _second = castToType<int>(snapshotData['second']);
    _cold = castToType<int>(snapshotData['cold']);
    _dry = castToType<int>(snapshotData['dry']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('success');

  static Stream<SuccessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuccessRecord.fromSnapshot(s));

  static Future<SuccessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuccessRecord.fromSnapshot(s));

  static SuccessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuccessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuccessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuccessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuccessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuccessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuccessRecordData({
  String? uid,
  int? led,
  int? pub,
  int? greenEnergy,
  int? bath,
  int? thermostat,
  int? night,
  int? lights,
  int? sell,
  int? second,
  int? cold,
  int? dry,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'led': led,
      'pub': pub,
      'greenEnergy': greenEnergy,
      'bath': bath,
      'thermostat': thermostat,
      'night': night,
      'lights': lights,
      'sell': sell,
      'second': second,
      'cold': cold,
      'dry': dry,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuccessRecordDocumentEquality implements Equality<SuccessRecord> {
  const SuccessRecordDocumentEquality();

  @override
  bool equals(SuccessRecord? e1, SuccessRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.led == e2?.led &&
        e1?.pub == e2?.pub &&
        e1?.greenEnergy == e2?.greenEnergy &&
        e1?.bath == e2?.bath &&
        e1?.thermostat == e2?.thermostat &&
        e1?.night == e2?.night &&
        e1?.lights == e2?.lights &&
        e1?.sell == e2?.sell &&
        e1?.second == e2?.second &&
        e1?.cold == e2?.cold &&
        e1?.dry == e2?.dry;
  }

  @override
  int hash(SuccessRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.led,
        e?.pub,
        e?.greenEnergy,
        e?.bath,
        e?.thermostat,
        e?.night,
        e?.lights,
        e?.sell,
        e?.second,
        e?.cold,
        e?.dry
      ]);

  @override
  bool isValidKey(Object? o) => o is SuccessRecord;
}
