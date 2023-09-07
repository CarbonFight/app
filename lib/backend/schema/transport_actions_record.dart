import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransportActionsRecord extends FirestoreRecord {
  TransportActionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transport" field.
  String? _transport;
  String get transport => _transport ?? '';
  bool hasTransport() => _transport != null;

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

  // "passengers" field.
  String? _passengers;
  String get passengers => _passengers ?? '';
  bool hasPassengers() => _passengers != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "periodicity" field.
  List<String>? _periodicity;
  List<String> get periodicity => _periodicity ?? const [];
  bool hasPeriodicity() => _periodicity != null;

  // "roundTrip" field.
  bool? _roundTrip;
  bool get roundTrip => _roundTrip ?? false;
  bool hasRoundTrip() => _roundTrip != null;

  // "isPeriodic" field.
  bool? _isPeriodic;
  bool get isPeriodic => _isPeriodic ?? false;
  bool hasIsPeriodic() => _isPeriodic != null;

  // "isFavorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  bool hasDistance() => _distance != null;

  void _initializeFields() {
    _transport = snapshotData['transport'] as String?;
    _powertype = snapshotData['powertype'] as String?;
    _userId = snapshotData['userId'] as String?;
    _co2e = castToType<int>(snapshotData['co2e']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _passengers = snapshotData['passengers'] as String?;
    _day = snapshotData['day'] as String?;
    _periodicity = getDataList(snapshotData['periodicity']);
    _roundTrip = snapshotData['roundTrip'] as bool?;
    _isPeriodic = snapshotData['isPeriodic'] as bool?;
    _isFavorite = snapshotData['isFavorite'] as bool?;
    _distance = snapshotData['distance'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transportActions');

  static Stream<TransportActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransportActionsRecord.fromSnapshot(s));

  static Future<TransportActionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransportActionsRecord.fromSnapshot(s));

  static TransportActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransportActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransportActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransportActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransportActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransportActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransportActionsRecordData({
  String? transport,
  String? powertype,
  String? userId,
  int? co2e,
  DateTime? createdTime,
  String? passengers,
  String? day,
  bool? roundTrip,
  bool? isPeriodic,
  bool? isFavorite,
  String? distance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transport': transport,
      'powertype': powertype,
      'userId': userId,
      'co2e': co2e,
      'created_time': createdTime,
      'passengers': passengers,
      'day': day,
      'roundTrip': roundTrip,
      'isPeriodic': isPeriodic,
      'isFavorite': isFavorite,
      'distance': distance,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransportActionsRecordDocumentEquality
    implements Equality<TransportActionsRecord> {
  const TransportActionsRecordDocumentEquality();

  @override
  bool equals(TransportActionsRecord? e1, TransportActionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.transport == e2?.transport &&
        e1?.powertype == e2?.powertype &&
        e1?.userId == e2?.userId &&
        e1?.co2e == e2?.co2e &&
        e1?.createdTime == e2?.createdTime &&
        e1?.passengers == e2?.passengers &&
        e1?.day == e2?.day &&
        listEquality.equals(e1?.periodicity, e2?.periodicity) &&
        e1?.roundTrip == e2?.roundTrip &&
        e1?.isPeriodic == e2?.isPeriodic &&
        e1?.isFavorite == e2?.isFavorite &&
        e1?.distance == e2?.distance;
  }

  @override
  int hash(TransportActionsRecord? e) => const ListEquality().hash([
        e?.transport,
        e?.powertype,
        e?.userId,
        e?.co2e,
        e?.createdTime,
        e?.passengers,
        e?.day,
        e?.periodicity,
        e?.roundTrip,
        e?.isPeriodic,
        e?.isFavorite,
        e?.distance
      ]);

  @override
  bool isValidKey(Object? o) => o is TransportActionsRecord;
}
