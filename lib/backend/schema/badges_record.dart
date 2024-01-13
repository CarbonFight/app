import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BadgesRecord extends FirestoreRecord {
  BadgesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "onboardingHowtoFinished" field.
  bool? _onboardingHowtoFinished;
  bool get onboardingHowtoFinished => _onboardingHowtoFinished ?? false;
  bool hasOnboardingHowtoFinished() => _onboardingHowtoFinished != null;

  // "onboardingAllChallenges" field.
  bool? _onboardingAllChallenges;
  bool get onboardingAllChallenges => _onboardingAllChallenges ?? false;
  bool hasOnboardingAllChallenges() => _onboardingAllChallenges != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _onboardingHowtoFinished = snapshotData['onboardingHowtoFinished'] as bool?;
    _onboardingAllChallenges = snapshotData['onboardingAllChallenges'] as bool?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('badges');

  static Stream<BadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesRecord.fromSnapshot(s));

  static Future<BadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesRecord.fromSnapshot(s));

  static BadgesRecord fromSnapshot(DocumentSnapshot snapshot) => BadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesRecordData({
  bool? onboardingHowtoFinished,
  bool? onboardingAllChallenges,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'onboardingHowtoFinished': onboardingHowtoFinished,
      'onboardingAllChallenges': onboardingAllChallenges,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    return e1?.onboardingHowtoFinished == e2?.onboardingHowtoFinished &&
        e1?.onboardingAllChallenges == e2?.onboardingAllChallenges &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(BadgesRecord? e) => const ListEquality()
      .hash([e?.onboardingHowtoFinished, e?.onboardingAllChallenges, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
