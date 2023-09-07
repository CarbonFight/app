import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodActionsRecord extends FirestoreRecord {
  FoodActionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "co2e" field.
  int? _co2e;
  int get co2e => _co2e ?? 0;
  bool hasCo2e() => _co2e != null;

  // "food" field.
  String? _food;
  String get food => _food ?? '';
  bool hasFood() => _food != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "periodicity" field.
  List<String>? _periodicity;
  List<String> get periodicity => _periodicity ?? const [];
  bool hasPeriodicity() => _periodicity != null;

  // "isPeriodic" field.
  bool? _isPeriodic;
  bool get isPeriodic => _isPeriodic ?? false;
  bool hasIsPeriodic() => _isPeriodic != null;

  // "isFavorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "sideComponent" field.
  List<String>? _sideComponent;
  List<String> get sideComponent => _sideComponent ?? const [];
  bool hasSideComponent() => _sideComponent != null;

  // "mainComponent" field.
  String? _mainComponent;
  String get mainComponent => _mainComponent ?? '';
  bool hasMainComponent() => _mainComponent != null;

  // "portions" field.
  int? _portions;
  int get portions => _portions ?? 0;
  bool hasPortions() => _portions != null;

  void _initializeFields() {
    _co2e = castToType<int>(snapshotData['co2e']);
    _food = snapshotData['food'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userId = snapshotData['userId'] as String?;
    _day = snapshotData['day'] as String?;
    _periodicity = getDataList(snapshotData['periodicity']);
    _isPeriodic = snapshotData['isPeriodic'] as bool?;
    _isFavorite = snapshotData['isFavorite'] as bool?;
    _sideComponent = getDataList(snapshotData['sideComponent']);
    _mainComponent = snapshotData['mainComponent'] as String?;
    _portions = castToType<int>(snapshotData['portions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodActions');

  static Stream<FoodActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodActionsRecord.fromSnapshot(s));

  static Future<FoodActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodActionsRecord.fromSnapshot(s));

  static FoodActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodActionsRecordData({
  int? co2e,
  String? food,
  DateTime? createdTime,
  String? userId,
  String? day,
  bool? isPeriodic,
  bool? isFavorite,
  String? mainComponent,
  int? portions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'co2e': co2e,
      'food': food,
      'created_time': createdTime,
      'userId': userId,
      'day': day,
      'isPeriodic': isPeriodic,
      'isFavorite': isFavorite,
      'mainComponent': mainComponent,
      'portions': portions,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodActionsRecordDocumentEquality implements Equality<FoodActionsRecord> {
  const FoodActionsRecordDocumentEquality();

  @override
  bool equals(FoodActionsRecord? e1, FoodActionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.co2e == e2?.co2e &&
        e1?.food == e2?.food &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userId == e2?.userId &&
        e1?.day == e2?.day &&
        listEquality.equals(e1?.periodicity, e2?.periodicity) &&
        e1?.isPeriodic == e2?.isPeriodic &&
        e1?.isFavorite == e2?.isFavorite &&
        listEquality.equals(e1?.sideComponent, e2?.sideComponent) &&
        e1?.mainComponent == e2?.mainComponent &&
        e1?.portions == e2?.portions;
  }

  @override
  int hash(FoodActionsRecord? e) => const ListEquality().hash([
        e?.co2e,
        e?.food,
        e?.createdTime,
        e?.userId,
        e?.day,
        e?.periodicity,
        e?.isPeriodic,
        e?.isFavorite,
        e?.sideComponent,
        e?.mainComponent,
        e?.portions
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodActionsRecord;
}
