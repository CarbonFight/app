import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ActionsRecord extends FirestoreRecord {
  ActionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "option" field.
  String? _option;
  String get option => _option ?? '';
  bool hasOption() => _option != null;

  // "co2e" field.
  int? _co2e;
  int get co2e => _co2e ?? 0;
  bool hasCo2e() => _co2e != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "emission_factor" field.
  double? _emissionFactor;
  double get emissionFactor => _emissionFactor ?? 0.0;
  bool hasEmissionFactor() => _emissionFactor != null;

  // "peopleSharing" field.
  int? _peopleSharing;
  int get peopleSharing => _peopleSharing ?? 0;
  bool hasPeopleSharing() => _peopleSharing != null;

  // "roundtrip" field.
  bool? _roundtrip;
  bool get roundtrip => _roundtrip ?? false;
  bool hasRoundtrip() => _roundtrip != null;

  // "isPeriodic" field.
  bool? _isPeriodic;
  bool get isPeriodic => _isPeriodic ?? false;
  bool hasIsPeriodic() => _isPeriodic != null;

  // "periodicity" field.
  List<String>? _periodicity;
  List<String> get periodicity => _periodicity ?? const [];
  bool hasPeriodicity() => _periodicity != null;

  // "side" field.
  List<String>? _side;
  List<String> get side => _side ?? const [];
  bool hasSide() => _side != null;

  // "newPurchase" field.
  bool? _newPurchase;
  bool get newPurchase => _newPurchase ?? false;
  bool hasNewPurchase() => _newPurchase != null;

  // "yearPurchase" field.
  String? _yearPurchase;
  String get yearPurchase => _yearPurchase ?? '';
  bool hasYearPurchase() => _yearPurchase != null;

  // "yearPreviousPurchase" field.
  String? _yearPreviousPurchase;
  String get yearPreviousPurchase => _yearPreviousPurchase ?? '';
  bool hasYearPreviousPurchase() => _yearPreviousPurchase != null;

  // "yearEndPurchase" field.
  String? _yearEndPurchase;
  String get yearEndPurchase => _yearEndPurchase ?? '';
  bool hasYearEndPurchase() => _yearEndPurchase != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _country = snapshotData['country'] as String?;
    _category = snapshotData['category'] as String?;
    _action = snapshotData['action'] as String?;
    _option = snapshotData['option'] as String?;
    _co2e = castToType<int>(snapshotData['co2e']);
    _count = castToType<int>(snapshotData['count']);
    _emissionFactor = castToType<double>(snapshotData['emission_factor']);
    _peopleSharing = castToType<int>(snapshotData['peopleSharing']);
    _roundtrip = snapshotData['roundtrip'] as bool?;
    _isPeriodic = snapshotData['isPeriodic'] as bool?;
    _periodicity = getDataList(snapshotData['periodicity']);
    _side = getDataList(snapshotData['side']);
    _newPurchase = snapshotData['newPurchase'] as bool?;
    _yearPurchase = snapshotData['yearPurchase'] as String?;
    _yearPreviousPurchase = snapshotData['yearPreviousPurchase'] as String?;
    _yearEndPurchase = snapshotData['yearEndPurchase'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actions');

  static Stream<ActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActionsRecord.fromSnapshot(s));

  static Future<ActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActionsRecord.fromSnapshot(s));

  static ActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActionsRecordData({
  String? uid,
  DateTime? createdTime,
  String? country,
  String? category,
  String? action,
  String? option,
  int? co2e,
  int? count,
  double? emissionFactor,
  int? peopleSharing,
  bool? roundtrip,
  bool? isPeriodic,
  bool? newPurchase,
  String? yearPurchase,
  String? yearPreviousPurchase,
  String? yearEndPurchase,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_time': createdTime,
      'country': country,
      'category': category,
      'action': action,
      'option': option,
      'co2e': co2e,
      'count': count,
      'emission_factor': emissionFactor,
      'peopleSharing': peopleSharing,
      'roundtrip': roundtrip,
      'isPeriodic': isPeriodic,
      'newPurchase': newPurchase,
      'yearPurchase': yearPurchase,
      'yearPreviousPurchase': yearPreviousPurchase,
      'yearEndPurchase': yearEndPurchase,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActionsRecordDocumentEquality implements Equality<ActionsRecord> {
  const ActionsRecordDocumentEquality();

  @override
  bool equals(ActionsRecord? e1, ActionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.country == e2?.country &&
        e1?.category == e2?.category &&
        e1?.action == e2?.action &&
        e1?.option == e2?.option &&
        e1?.co2e == e2?.co2e &&
        e1?.count == e2?.count &&
        e1?.emissionFactor == e2?.emissionFactor &&
        e1?.peopleSharing == e2?.peopleSharing &&
        e1?.roundtrip == e2?.roundtrip &&
        e1?.isPeriodic == e2?.isPeriodic &&
        listEquality.equals(e1?.periodicity, e2?.periodicity) &&
        listEquality.equals(e1?.side, e2?.side) &&
        e1?.newPurchase == e2?.newPurchase &&
        e1?.yearPurchase == e2?.yearPurchase &&
        e1?.yearPreviousPurchase == e2?.yearPreviousPurchase &&
        e1?.yearEndPurchase == e2?.yearEndPurchase;
  }

  @override
  int hash(ActionsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdTime,
        e?.country,
        e?.category,
        e?.action,
        e?.option,
        e?.co2e,
        e?.count,
        e?.emissionFactor,
        e?.peopleSharing,
        e?.roundtrip,
        e?.isPeriodic,
        e?.periodicity,
        e?.side,
        e?.newPurchase,
        e?.yearPurchase,
        e?.yearPreviousPurchase,
        e?.yearEndPurchase
      ]);

  @override
  bool isValidKey(Object? o) => o is ActionsRecord;
}
