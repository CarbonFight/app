import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ChallengesRecord extends FirestoreRecord {
  ChallengesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "hasEnoughSponsors" field.
  bool? _hasEnoughSponsors;
  bool get hasEnoughSponsors => _hasEnoughSponsors ?? false;
  bool hasHasEnoughSponsors() => _hasEnoughSponsors != null;

  // "actionLvl1" field.
  bool? _actionLvl1;
  bool get actionLvl1 => _actionLvl1 ?? false;
  bool hasActionLvl1() => _actionLvl1 != null;

  // "actionLvl2" field.
  bool? _actionLvl2;
  bool get actionLvl2 => _actionLvl2 ?? false;
  bool hasActionLvl2() => _actionLvl2 != null;

  // "actionLvl3" field.
  bool? _actionLvl3;
  bool get actionLvl3 => _actionLvl3 ?? false;
  bool hasActionLvl3() => _actionLvl3 != null;

  // "actionLvl4" field.
  bool? _actionLvl4;
  bool get actionLvl4 => _actionLvl4 ?? false;
  bool hasActionLvl4() => _actionLvl4 != null;

  // "actionLvl5" field.
  bool? _actionLvl5;
  bool get actionLvl5 => _actionLvl5 ?? false;
  bool hasActionLvl5() => _actionLvl5 != null;

  // "onboardingTransport" field.
  bool? _onboardingTransport;
  bool get onboardingTransport => _onboardingTransport ?? false;
  bool hasOnboardingTransport() => _onboardingTransport != null;

  // "onboardingServices" field.
  bool? _onboardingServices;
  bool get onboardingServices => _onboardingServices ?? false;
  bool hasOnboardingServices() => _onboardingServices != null;

  // "onboardingObjects" field.
  bool? _onboardingObjects;
  bool get onboardingObjects => _onboardingObjects ?? false;
  bool hasOnboardingObjects() => _onboardingObjects != null;

  // "onboardingLodging" field.
  bool? _onboardingLodging;
  bool get onboardingLodging => _onboardingLodging ?? false;
  bool hasOnboardingLodging() => _onboardingLodging != null;

  // "onboardingFurniture" field.
  bool? _onboardingFurniture;
  bool get onboardingFurniture => _onboardingFurniture ?? false;
  bool hasOnboardingFurniture() => _onboardingFurniture != null;

  // "onboardingFood" field.
  bool? _onboardingFood;
  bool get onboardingFood => _onboardingFood ?? false;
  bool hasOnboardingFood() => _onboardingFood != null;

  // "onboardingDigital" field.
  bool? _onboardingDigital;
  bool get onboardingDigital => _onboardingDigital ?? false;
  bool hasOnboardingDigital() => _onboardingDigital != null;

  // "onboardingClothes" field.
  bool? _onboardingClothes;
  bool get onboardingClothes => _onboardingClothes ?? false;
  bool hasOnboardingClothes() => _onboardingClothes != null;

  // "onboardingAppliance" field.
  bool? _onboardingAppliance;
  bool get onboardingAppliance => _onboardingAppliance ?? false;
  bool hasOnboardingAppliance() => _onboardingAppliance != null;

  // "dayStreakLvl1" field.
  bool? _dayStreakLvl1;
  bool get dayStreakLvl1 => _dayStreakLvl1 ?? false;
  bool hasDayStreakLvl1() => _dayStreakLvl1 != null;

  // "dayStreakLvl2" field.
  bool? _dayStreakLvl2;
  bool get dayStreakLvl2 => _dayStreakLvl2 ?? false;
  bool hasDayStreakLvl2() => _dayStreakLvl2 != null;

  // "dayStreakLvl3" field.
  bool? _dayStreakLvl3;
  bool get dayStreakLvl3 => _dayStreakLvl3 ?? false;
  bool hasDayStreakLvl3() => _dayStreakLvl3 != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _hasEnoughSponsors = snapshotData['hasEnoughSponsors'] as bool?;
    _actionLvl1 = snapshotData['actionLvl1'] as bool?;
    _actionLvl2 = snapshotData['actionLvl2'] as bool?;
    _actionLvl3 = snapshotData['actionLvl3'] as bool?;
    _actionLvl4 = snapshotData['actionLvl4'] as bool?;
    _actionLvl5 = snapshotData['actionLvl5'] as bool?;
    _onboardingTransport = snapshotData['onboardingTransport'] as bool?;
    _onboardingServices = snapshotData['onboardingServices'] as bool?;
    _onboardingObjects = snapshotData['onboardingObjects'] as bool?;
    _onboardingLodging = snapshotData['onboardingLodging'] as bool?;
    _onboardingFurniture = snapshotData['onboardingFurniture'] as bool?;
    _onboardingFood = snapshotData['onboardingFood'] as bool?;
    _onboardingDigital = snapshotData['onboardingDigital'] as bool?;
    _onboardingClothes = snapshotData['onboardingClothes'] as bool?;
    _onboardingAppliance = snapshotData['onboardingAppliance'] as bool?;
    _dayStreakLvl1 = snapshotData['dayStreakLvl1'] as bool?;
    _dayStreakLvl2 = snapshotData['dayStreakLvl2'] as bool?;
    _dayStreakLvl3 = snapshotData['dayStreakLvl3'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challenges');

  static Stream<ChallengesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengesRecord.fromSnapshot(s));

  static Future<ChallengesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChallengesRecord.fromSnapshot(s));

  static ChallengesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengesRecordData({
  String? uid,
  bool? hasEnoughSponsors,
  bool? actionLvl1,
  bool? actionLvl2,
  bool? actionLvl3,
  bool? actionLvl4,
  bool? actionLvl5,
  bool? onboardingTransport,
  bool? onboardingServices,
  bool? onboardingObjects,
  bool? onboardingLodging,
  bool? onboardingFurniture,
  bool? onboardingFood,
  bool? onboardingDigital,
  bool? onboardingClothes,
  bool? onboardingAppliance,
  bool? dayStreakLvl1,
  bool? dayStreakLvl2,
  bool? dayStreakLvl3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'hasEnoughSponsors': hasEnoughSponsors,
      'actionLvl1': actionLvl1,
      'actionLvl2': actionLvl2,
      'actionLvl3': actionLvl3,
      'actionLvl4': actionLvl4,
      'actionLvl5': actionLvl5,
      'onboardingTransport': onboardingTransport,
      'onboardingServices': onboardingServices,
      'onboardingObjects': onboardingObjects,
      'onboardingLodging': onboardingLodging,
      'onboardingFurniture': onboardingFurniture,
      'onboardingFood': onboardingFood,
      'onboardingDigital': onboardingDigital,
      'onboardingClothes': onboardingClothes,
      'onboardingAppliance': onboardingAppliance,
      'dayStreakLvl1': dayStreakLvl1,
      'dayStreakLvl2': dayStreakLvl2,
      'dayStreakLvl3': dayStreakLvl3,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengesRecordDocumentEquality implements Equality<ChallengesRecord> {
  const ChallengesRecordDocumentEquality();

  @override
  bool equals(ChallengesRecord? e1, ChallengesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.hasEnoughSponsors == e2?.hasEnoughSponsors &&
        e1?.actionLvl1 == e2?.actionLvl1 &&
        e1?.actionLvl2 == e2?.actionLvl2 &&
        e1?.actionLvl3 == e2?.actionLvl3 &&
        e1?.actionLvl4 == e2?.actionLvl4 &&
        e1?.actionLvl5 == e2?.actionLvl5 &&
        e1?.onboardingTransport == e2?.onboardingTransport &&
        e1?.onboardingServices == e2?.onboardingServices &&
        e1?.onboardingObjects == e2?.onboardingObjects &&
        e1?.onboardingLodging == e2?.onboardingLodging &&
        e1?.onboardingFurniture == e2?.onboardingFurniture &&
        e1?.onboardingFood == e2?.onboardingFood &&
        e1?.onboardingDigital == e2?.onboardingDigital &&
        e1?.onboardingClothes == e2?.onboardingClothes &&
        e1?.onboardingAppliance == e2?.onboardingAppliance &&
        e1?.dayStreakLvl1 == e2?.dayStreakLvl1 &&
        e1?.dayStreakLvl2 == e2?.dayStreakLvl2 &&
        e1?.dayStreakLvl3 == e2?.dayStreakLvl3;
  }

  @override
  int hash(ChallengesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.hasEnoughSponsors,
        e?.actionLvl1,
        e?.actionLvl2,
        e?.actionLvl3,
        e?.actionLvl4,
        e?.actionLvl5,
        e?.onboardingTransport,
        e?.onboardingServices,
        e?.onboardingObjects,
        e?.onboardingLodging,
        e?.onboardingFurniture,
        e?.onboardingFood,
        e?.onboardingDigital,
        e?.onboardingClothes,
        e?.onboardingAppliance,
        e?.dayStreakLvl1,
        e?.dayStreakLvl2,
        e?.dayStreakLvl3
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengesRecord;
}
