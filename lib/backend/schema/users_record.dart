import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_Name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "first_Name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "sponsorship_code" field.
  String? _sponsorshipCode;
  String get sponsorshipCode => _sponsorshipCode ?? '';
  bool hasSponsorshipCode() => _sponsorshipCode != null;

  // "sponsor" field.
  String? _sponsor;
  String get sponsor => _sponsor ?? '';
  bool hasSponsor() => _sponsor != null;

  // "team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "skipHowto" field.
  bool? _skipHowto;
  bool get skipHowto => _skipHowto ?? false;
  bool hasSkipHowto() => _skipHowto != null;

  // "connection_history" field.
  List<DateTime>? _connectionHistory;
  List<DateTime> get connectionHistory => _connectionHistory ?? const [];
  bool hasConnectionHistory() => _connectionHistory != null;

  // "target" field.
  double? _target;
  double get target => _target ?? 0.0;
  bool hasTarget() => _target != null;

  // "badge" field.
  String? _badge;
  String get badge => _badge ?? '';
  bool hasBadge() => _badge != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastName = snapshotData['last_Name'] as String?;
    _firstName = snapshotData['first_Name'] as String?;
    _sponsorshipCode = snapshotData['sponsorship_code'] as String?;
    _sponsor = snapshotData['sponsor'] as String?;
    _team = snapshotData['team'] as String?;
    _skipHowto = snapshotData['skipHowto'] as bool?;
    _connectionHistory = getDataList(snapshotData['connection_history']);
    _target = castToType<double>(snapshotData['target']);
    _badge = snapshotData['badge'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? lastName,
  String? firstName,
  String? sponsorshipCode,
  String? sponsor,
  String? team,
  bool? skipHowto,
  double? target,
  String? badge,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_Name': lastName,
      'first_Name': firstName,
      'sponsorship_code': sponsorshipCode,
      'sponsor': sponsor,
      'team': team,
      'skipHowto': skipHowto,
      'target': target,
      'badge': badge,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastName == e2?.lastName &&
        e1?.firstName == e2?.firstName &&
        e1?.sponsorshipCode == e2?.sponsorshipCode &&
        e1?.sponsor == e2?.sponsor &&
        e1?.team == e2?.team &&
        e1?.skipHowto == e2?.skipHowto &&
        listEquality.equals(e1?.connectionHistory, e2?.connectionHistory) &&
        e1?.target == e2?.target &&
        e1?.badge == e2?.badge;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastName,
        e?.firstName,
        e?.sponsorshipCode,
        e?.sponsor,
        e?.team,
        e?.skipHowto,
        e?.connectionHistory,
        e?.target,
        e?.badge
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
