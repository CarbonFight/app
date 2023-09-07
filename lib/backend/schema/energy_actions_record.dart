import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnergyActionsRecord extends FirestoreRecord {
  EnergyActionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "energy" field.
  String? _energy;
  String get energy => _energy ?? '';
  bool hasEnergy() => _energy != null;

  // "powertype" field.
  String? _powertype;
  String get powertype => _powertype ?? '';
  bool hasPowertype() => _powertype != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "co2e" field.
  int? _co2e;
  int get co2e => _co2e ?? 0;
  bool hasCo2e() => _co2e != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "peopleSharing" field.
  String? _peopleSharing;
  String get peopleSharing => _peopleSharing ?? '';
  bool hasPeopleSharing() => _peopleSharing != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "isPeriodic" field.
  bool? _isPeriodic;
  bool get isPeriodic => _isPeriodic ?? false;
  bool hasIsPeriodic() => _isPeriodic != null;

  // "volume" field.
  String? _volume;
  String get volume => _volume ?? '';
  bool hasVolume() => _volume != null;

  // "isNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  bool hasIsNew() => _isNew != null;

  void _initializeFields() {
    _energy = snapshotData['energy'] as String?;
    _powertype = snapshotData['powertype'] as String?;
    _userId = snapshotData['userId'] as String?;
    _co2e = castToType<int>(snapshotData['co2e']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _peopleSharing = snapshotData['peopleSharing'] as String?;
    _day = snapshotData['day'] as String?;
    _isPeriodic = snapshotData['isPeriodic'] as bool?;
    _volume = snapshotData['volume'] as String?;
    _isNew = snapshotData['isNew'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('energyActions');

  static Stream<EnergyActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnergyActionsRecord.fromSnapshot(s));

  static Future<EnergyActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnergyActionsRecord.fromSnapshot(s));

  static EnergyActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnergyActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnergyActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnergyActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnergyActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnergyActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'energy': energy,
      'powertype': powertype,
      'userId': userId,
      'co2e': co2e,
      'created_time': createdTime,
      'peopleSharing': peopleSharing,
      'day': day,
      'isPeriodic': isPeriodic,
      'volume': volume,
      'isNew': isNew,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnergyActionsRecordDocumentEquality
    implements Equality<EnergyActionsRecord> {
  const EnergyActionsRecordDocumentEquality();

  @override
  bool equals(EnergyActionsRecord? e1, EnergyActionsRecord? e2) {
    return e1?.energy == e2?.energy &&
        e1?.powertype == e2?.powertype &&
        e1?.userId == e2?.userId &&
        e1?.co2e == e2?.co2e &&
        e1?.createdTime == e2?.createdTime &&
        e1?.peopleSharing == e2?.peopleSharing &&
        e1?.day == e2?.day &&
        e1?.isPeriodic == e2?.isPeriodic &&
        e1?.volume == e2?.volume &&
        e1?.isNew == e2?.isNew;
  }

  @override
  int hash(EnergyActionsRecord? e) => const ListEquality().hash([
        e?.energy,
        e?.powertype,
        e?.userId,
        e?.co2e,
        e?.createdTime,
        e?.peopleSharing,
        e?.day,
        e?.isPeriodic,
        e?.volume,
        e?.isNew
      ]);

  @override
  bool isValidKey(Object? o) => o is EnergyActionsRecord;
}
