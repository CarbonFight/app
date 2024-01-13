import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatsRecord extends FirestoreRecord {
  StatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "sponsorshipCount" field.
  int? _sponsorshipCount;
  int get sponsorshipCount => _sponsorshipCount ?? 0;
  bool hasSponsorshipCount() => _sponsorshipCount != null;

  // "actionsCountTotal" field.
  int? _actionsCountTotal;
  int get actionsCountTotal => _actionsCountTotal ?? 0;
  bool hasActionsCountTotal() => _actionsCountTotal != null;

  // "actionsCountTransport" field.
  int? _actionsCountTransport;
  int get actionsCountTransport => _actionsCountTransport ?? 0;
  bool hasActionsCountTransport() => _actionsCountTransport != null;

  // "actionsCountServices" field.
  int? _actionsCountServices;
  int get actionsCountServices => _actionsCountServices ?? 0;
  bool hasActionsCountServices() => _actionsCountServices != null;

  // "actionsCountObjects" field.
  int? _actionsCountObjects;
  int get actionsCountObjects => _actionsCountObjects ?? 0;
  bool hasActionsCountObjects() => _actionsCountObjects != null;

  // "actionsCountLodging" field.
  int? _actionsCountLodging;
  int get actionsCountLodging => _actionsCountLodging ?? 0;
  bool hasActionsCountLodging() => _actionsCountLodging != null;

  // "actionsCountFurniture" field.
  int? _actionsCountFurniture;
  int get actionsCountFurniture => _actionsCountFurniture ?? 0;
  bool hasActionsCountFurniture() => _actionsCountFurniture != null;

  // "actionsCountFood" field.
  int? _actionsCountFood;
  int get actionsCountFood => _actionsCountFood ?? 0;
  bool hasActionsCountFood() => _actionsCountFood != null;

  // "actionsCountDigital" field.
  int? _actionsCountDigital;
  int get actionsCountDigital => _actionsCountDigital ?? 0;
  bool hasActionsCountDigital() => _actionsCountDigital != null;

  // "actionsCountClothes" field.
  int? _actionsCountClothes;
  int get actionsCountClothes => _actionsCountClothes ?? 0;
  bool hasActionsCountClothes() => _actionsCountClothes != null;

  // "actionsCountAppliance" field.
  int? _actionsCountAppliance;
  int get actionsCountAppliance => _actionsCountAppliance ?? 0;
  bool hasActionsCountAppliance() => _actionsCountAppliance != null;

  // "eventActionAddCount" field.
  int? _eventActionAddCount;
  int get eventActionAddCount => _eventActionAddCount ?? 0;
  bool hasEventActionAddCount() => _eventActionAddCount != null;

  // "eventActionUpdateCount" field.
  int? _eventActionUpdateCount;
  int get eventActionUpdateCount => _eventActionUpdateCount ?? 0;
  bool hasEventActionUpdateCount() => _eventActionUpdateCount != null;

  // "eventActionDeleteCount" field.
  int? _eventActionDeleteCount;
  int get eventActionDeleteCount => _eventActionDeleteCount ?? 0;
  bool hasEventActionDeleteCount() => _eventActionDeleteCount != null;

  // "eventUpdateTargetCount" field.
  int? _eventUpdateTargetCount;
  int get eventUpdateTargetCount => _eventUpdateTargetCount ?? 0;
  bool hasEventUpdateTargetCount() => _eventUpdateTargetCount != null;

  // "eventUpdateTeamCount" field.
  int? _eventUpdateTeamCount;
  int get eventUpdateTeamCount => _eventUpdateTeamCount ?? 0;
  bool hasEventUpdateTeamCount() => _eventUpdateTeamCount != null;

  // "weekTotalPerDay" field.
  List<int>? _weekTotalPerDay;
  List<int> get weekTotalPerDay => _weekTotalPerDay ?? const [];
  bool hasWeekTotalPerDay() => _weekTotalPerDay != null;

  // "weekTotal" field.
  int? _weekTotal;
  int get weekTotal => _weekTotal ?? 0;
  bool hasWeekTotal() => _weekTotal != null;

  // "weekTransport" field.
  int? _weekTransport;
  int get weekTransport => _weekTransport ?? 0;
  bool hasWeekTransport() => _weekTransport != null;

  // "weekServices" field.
  int? _weekServices;
  int get weekServices => _weekServices ?? 0;
  bool hasWeekServices() => _weekServices != null;

  // "weekObjects" field.
  int? _weekObjects;
  int get weekObjects => _weekObjects ?? 0;
  bool hasWeekObjects() => _weekObjects != null;

  // "weekLodging" field.
  int? _weekLodging;
  int get weekLodging => _weekLodging ?? 0;
  bool hasWeekLodging() => _weekLodging != null;

  // "weekFurniture" field.
  int? _weekFurniture;
  int get weekFurniture => _weekFurniture ?? 0;
  bool hasWeekFurniture() => _weekFurniture != null;

  // "weekFood" field.
  int? _weekFood;
  int get weekFood => _weekFood ?? 0;
  bool hasWeekFood() => _weekFood != null;

  // "weekDigital" field.
  int? _weekDigital;
  int get weekDigital => _weekDigital ?? 0;
  bool hasWeekDigital() => _weekDigital != null;

  // "weekClothes" field.
  int? _weekClothes;
  int get weekClothes => _weekClothes ?? 0;
  bool hasWeekClothes() => _weekClothes != null;

  // "weekAppliance" field.
  int? _weekAppliance;
  int get weekAppliance => _weekAppliance ?? 0;
  bool hasWeekAppliance() => _weekAppliance != null;

  // "monthTotalPerDay" field.
  List<int>? _monthTotalPerDay;
  List<int> get monthTotalPerDay => _monthTotalPerDay ?? const [];
  bool hasMonthTotalPerDay() => _monthTotalPerDay != null;

  // "monthTotal" field.
  int? _monthTotal;
  int get monthTotal => _monthTotal ?? 0;
  bool hasMonthTotal() => _monthTotal != null;

  // "monthTransport" field.
  int? _monthTransport;
  int get monthTransport => _monthTransport ?? 0;
  bool hasMonthTransport() => _monthTransport != null;

  // "monthServices" field.
  int? _monthServices;
  int get monthServices => _monthServices ?? 0;
  bool hasMonthServices() => _monthServices != null;

  // "monthObjects" field.
  int? _monthObjects;
  int get monthObjects => _monthObjects ?? 0;
  bool hasMonthObjects() => _monthObjects != null;

  // "monthLodging" field.
  int? _monthLodging;
  int get monthLodging => _monthLodging ?? 0;
  bool hasMonthLodging() => _monthLodging != null;

  // "monthFurniture" field.
  int? _monthFurniture;
  int get monthFurniture => _monthFurniture ?? 0;
  bool hasMonthFurniture() => _monthFurniture != null;

  // "monthFood" field.
  int? _monthFood;
  int get monthFood => _monthFood ?? 0;
  bool hasMonthFood() => _monthFood != null;

  // "monthDigital" field.
  int? _monthDigital;
  int get monthDigital => _monthDigital ?? 0;
  bool hasMonthDigital() => _monthDigital != null;

  // "monthClothes" field.
  int? _monthClothes;
  int get monthClothes => _monthClothes ?? 0;
  bool hasMonthClothes() => _monthClothes != null;

  // "monthAppliance" field.
  int? _monthAppliance;
  int get monthAppliance => _monthAppliance ?? 0;
  bool hasMonthAppliance() => _monthAppliance != null;

  // "yearTotalPerDay" field.
  List<int>? _yearTotalPerDay;
  List<int> get yearTotalPerDay => _yearTotalPerDay ?? const [];
  bool hasYearTotalPerDay() => _yearTotalPerDay != null;

  // "yearTotal" field.
  int? _yearTotal;
  int get yearTotal => _yearTotal ?? 0;
  bool hasYearTotal() => _yearTotal != null;

  // "yearTransport" field.
  int? _yearTransport;
  int get yearTransport => _yearTransport ?? 0;
  bool hasYearTransport() => _yearTransport != null;

  // "yearServices" field.
  int? _yearServices;
  int get yearServices => _yearServices ?? 0;
  bool hasYearServices() => _yearServices != null;

  // "yearObjects" field.
  int? _yearObjects;
  int get yearObjects => _yearObjects ?? 0;
  bool hasYearObjects() => _yearObjects != null;

  // "yearLodging" field.
  int? _yearLodging;
  int get yearLodging => _yearLodging ?? 0;
  bool hasYearLodging() => _yearLodging != null;

  // "yearFurniture" field.
  int? _yearFurniture;
  int get yearFurniture => _yearFurniture ?? 0;
  bool hasYearFurniture() => _yearFurniture != null;

  // "yearFood" field.
  int? _yearFood;
  int get yearFood => _yearFood ?? 0;
  bool hasYearFood() => _yearFood != null;

  // "yearDigital" field.
  int? _yearDigital;
  int get yearDigital => _yearDigital ?? 0;
  bool hasYearDigital() => _yearDigital != null;

  // "yearClothes" field.
  int? _yearClothes;
  int get yearClothes => _yearClothes ?? 0;
  bool hasYearClothes() => _yearClothes != null;

  // "yearAppliance" field.
  int? _yearAppliance;
  int get yearAppliance => _yearAppliance ?? 0;
  bool hasYearAppliance() => _yearAppliance != null;

  // "dayTotal" field.
  int? _dayTotal;
  int get dayTotal => _dayTotal ?? 0;
  bool hasDayTotal() => _dayTotal != null;

  // "dayTransport" field.
  int? _dayTransport;
  int get dayTransport => _dayTransport ?? 0;
  bool hasDayTransport() => _dayTransport != null;

  // "dayServices" field.
  int? _dayServices;
  int get dayServices => _dayServices ?? 0;
  bool hasDayServices() => _dayServices != null;

  // "dayObjects" field.
  int? _dayObjects;
  int get dayObjects => _dayObjects ?? 0;
  bool hasDayObjects() => _dayObjects != null;

  // "dayLodging" field.
  int? _dayLodging;
  int get dayLodging => _dayLodging ?? 0;
  bool hasDayLodging() => _dayLodging != null;

  // "dayFurniture" field.
  int? _dayFurniture;
  int get dayFurniture => _dayFurniture ?? 0;
  bool hasDayFurniture() => _dayFurniture != null;

  // "dayFood" field.
  int? _dayFood;
  int get dayFood => _dayFood ?? 0;
  bool hasDayFood() => _dayFood != null;

  // "dayDigital" field.
  int? _dayDigital;
  int get dayDigital => _dayDigital ?? 0;
  bool hasDayDigital() => _dayDigital != null;

  // "dayClothes" field.
  int? _dayClothes;
  int get dayClothes => _dayClothes ?? 0;
  bool hasDayClothes() => _dayClothes != null;

  // "dayAppliance" field.
  int? _dayAppliance;
  int get dayAppliance => _dayAppliance ?? 0;
  bool hasDayAppliance() => _dayAppliance != null;

  // "days" field.
  List<int>? _days;
  List<int> get days => _days ?? const [];
  bool hasDays() => _days != null;

  // "graphTotal" field.
  List<double>? _graphTotal;
  List<double> get graphTotal => _graphTotal ?? const [];
  bool hasGraphTotal() => _graphTotal != null;

  // "connectionStreak" field.
  int? _connectionStreak;
  int get connectionStreak => _connectionStreak ?? 0;
  bool hasConnectionStreak() => _connectionStreak != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _sponsorshipCount = castToType<int>(snapshotData['sponsorshipCount']);
    _actionsCountTotal = castToType<int>(snapshotData['actionsCountTotal']);
    _actionsCountTransport =
        castToType<int>(snapshotData['actionsCountTransport']);
    _actionsCountServices =
        castToType<int>(snapshotData['actionsCountServices']);
    _actionsCountObjects = castToType<int>(snapshotData['actionsCountObjects']);
    _actionsCountLodging = castToType<int>(snapshotData['actionsCountLodging']);
    _actionsCountFurniture =
        castToType<int>(snapshotData['actionsCountFurniture']);
    _actionsCountFood = castToType<int>(snapshotData['actionsCountFood']);
    _actionsCountDigital = castToType<int>(snapshotData['actionsCountDigital']);
    _actionsCountClothes = castToType<int>(snapshotData['actionsCountClothes']);
    _actionsCountAppliance =
        castToType<int>(snapshotData['actionsCountAppliance']);
    _eventActionAddCount = castToType<int>(snapshotData['eventActionAddCount']);
    _eventActionUpdateCount =
        castToType<int>(snapshotData['eventActionUpdateCount']);
    _eventActionDeleteCount =
        castToType<int>(snapshotData['eventActionDeleteCount']);
    _eventUpdateTargetCount =
        castToType<int>(snapshotData['eventUpdateTargetCount']);
    _eventUpdateTeamCount =
        castToType<int>(snapshotData['eventUpdateTeamCount']);
    _weekTotalPerDay = getDataList(snapshotData['weekTotalPerDay']);
    _weekTotal = castToType<int>(snapshotData['weekTotal']);
    _weekTransport = castToType<int>(snapshotData['weekTransport']);
    _weekServices = castToType<int>(snapshotData['weekServices']);
    _weekObjects = castToType<int>(snapshotData['weekObjects']);
    _weekLodging = castToType<int>(snapshotData['weekLodging']);
    _weekFurniture = castToType<int>(snapshotData['weekFurniture']);
    _weekFood = castToType<int>(snapshotData['weekFood']);
    _weekDigital = castToType<int>(snapshotData['weekDigital']);
    _weekClothes = castToType<int>(snapshotData['weekClothes']);
    _weekAppliance = castToType<int>(snapshotData['weekAppliance']);
    _monthTotalPerDay = getDataList(snapshotData['monthTotalPerDay']);
    _monthTotal = castToType<int>(snapshotData['monthTotal']);
    _monthTransport = castToType<int>(snapshotData['monthTransport']);
    _monthServices = castToType<int>(snapshotData['monthServices']);
    _monthObjects = castToType<int>(snapshotData['monthObjects']);
    _monthLodging = castToType<int>(snapshotData['monthLodging']);
    _monthFurniture = castToType<int>(snapshotData['monthFurniture']);
    _monthFood = castToType<int>(snapshotData['monthFood']);
    _monthDigital = castToType<int>(snapshotData['monthDigital']);
    _monthClothes = castToType<int>(snapshotData['monthClothes']);
    _monthAppliance = castToType<int>(snapshotData['monthAppliance']);
    _yearTotalPerDay = getDataList(snapshotData['yearTotalPerDay']);
    _yearTotal = castToType<int>(snapshotData['yearTotal']);
    _yearTransport = castToType<int>(snapshotData['yearTransport']);
    _yearServices = castToType<int>(snapshotData['yearServices']);
    _yearObjects = castToType<int>(snapshotData['yearObjects']);
    _yearLodging = castToType<int>(snapshotData['yearLodging']);
    _yearFurniture = castToType<int>(snapshotData['yearFurniture']);
    _yearFood = castToType<int>(snapshotData['yearFood']);
    _yearDigital = castToType<int>(snapshotData['yearDigital']);
    _yearClothes = castToType<int>(snapshotData['yearClothes']);
    _yearAppliance = castToType<int>(snapshotData['yearAppliance']);
    _dayTotal = castToType<int>(snapshotData['dayTotal']);
    _dayTransport = castToType<int>(snapshotData['dayTransport']);
    _dayServices = castToType<int>(snapshotData['dayServices']);
    _dayObjects = castToType<int>(snapshotData['dayObjects']);
    _dayLodging = castToType<int>(snapshotData['dayLodging']);
    _dayFurniture = castToType<int>(snapshotData['dayFurniture']);
    _dayFood = castToType<int>(snapshotData['dayFood']);
    _dayDigital = castToType<int>(snapshotData['dayDigital']);
    _dayClothes = castToType<int>(snapshotData['dayClothes']);
    _dayAppliance = castToType<int>(snapshotData['dayAppliance']);
    _days = getDataList(snapshotData['days']);
    _graphTotal = getDataList(snapshotData['graphTotal']);
    _connectionStreak = castToType<int>(snapshotData['connectionStreak']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stats');

  static Stream<StatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatsRecord.fromSnapshot(s));

  static Future<StatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatsRecord.fromSnapshot(s));

  static StatsRecord fromSnapshot(DocumentSnapshot snapshot) => StatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatsRecordData({
  String? uid,
  int? score,
  int? sponsorshipCount,
  int? actionsCountTotal,
  int? actionsCountTransport,
  int? actionsCountServices,
  int? actionsCountObjects,
  int? actionsCountLodging,
  int? actionsCountFurniture,
  int? actionsCountFood,
  int? actionsCountDigital,
  int? actionsCountClothes,
  int? actionsCountAppliance,
  int? eventActionAddCount,
  int? eventActionUpdateCount,
  int? eventActionDeleteCount,
  int? eventUpdateTargetCount,
  int? eventUpdateTeamCount,
  int? weekTotal,
  int? weekTransport,
  int? weekServices,
  int? weekObjects,
  int? weekLodging,
  int? weekFurniture,
  int? weekFood,
  int? weekDigital,
  int? weekClothes,
  int? weekAppliance,
  int? monthTotal,
  int? monthTransport,
  int? monthServices,
  int? monthObjects,
  int? monthLodging,
  int? monthFurniture,
  int? monthFood,
  int? monthDigital,
  int? monthClothes,
  int? monthAppliance,
  int? yearTotal,
  int? yearTransport,
  int? yearServices,
  int? yearObjects,
  int? yearLodging,
  int? yearFurniture,
  int? yearFood,
  int? yearDigital,
  int? yearClothes,
  int? yearAppliance,
  int? dayTotal,
  int? dayTransport,
  int? dayServices,
  int? dayObjects,
  int? dayLodging,
  int? dayFurniture,
  int? dayFood,
  int? dayDigital,
  int? dayClothes,
  int? dayAppliance,
  int? connectionStreak,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'score': score,
      'sponsorshipCount': sponsorshipCount,
      'actionsCountTotal': actionsCountTotal,
      'actionsCountTransport': actionsCountTransport,
      'actionsCountServices': actionsCountServices,
      'actionsCountObjects': actionsCountObjects,
      'actionsCountLodging': actionsCountLodging,
      'actionsCountFurniture': actionsCountFurniture,
      'actionsCountFood': actionsCountFood,
      'actionsCountDigital': actionsCountDigital,
      'actionsCountClothes': actionsCountClothes,
      'actionsCountAppliance': actionsCountAppliance,
      'eventActionAddCount': eventActionAddCount,
      'eventActionUpdateCount': eventActionUpdateCount,
      'eventActionDeleteCount': eventActionDeleteCount,
      'eventUpdateTargetCount': eventUpdateTargetCount,
      'eventUpdateTeamCount': eventUpdateTeamCount,
      'weekTotal': weekTotal,
      'weekTransport': weekTransport,
      'weekServices': weekServices,
      'weekObjects': weekObjects,
      'weekLodging': weekLodging,
      'weekFurniture': weekFurniture,
      'weekFood': weekFood,
      'weekDigital': weekDigital,
      'weekClothes': weekClothes,
      'weekAppliance': weekAppliance,
      'monthTotal': monthTotal,
      'monthTransport': monthTransport,
      'monthServices': monthServices,
      'monthObjects': monthObjects,
      'monthLodging': monthLodging,
      'monthFurniture': monthFurniture,
      'monthFood': monthFood,
      'monthDigital': monthDigital,
      'monthClothes': monthClothes,
      'monthAppliance': monthAppliance,
      'yearTotal': yearTotal,
      'yearTransport': yearTransport,
      'yearServices': yearServices,
      'yearObjects': yearObjects,
      'yearLodging': yearLodging,
      'yearFurniture': yearFurniture,
      'yearFood': yearFood,
      'yearDigital': yearDigital,
      'yearClothes': yearClothes,
      'yearAppliance': yearAppliance,
      'dayTotal': dayTotal,
      'dayTransport': dayTransport,
      'dayServices': dayServices,
      'dayObjects': dayObjects,
      'dayLodging': dayLodging,
      'dayFurniture': dayFurniture,
      'dayFood': dayFood,
      'dayDigital': dayDigital,
      'dayClothes': dayClothes,
      'dayAppliance': dayAppliance,
      'connectionStreak': connectionStreak,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatsRecordDocumentEquality implements Equality<StatsRecord> {
  const StatsRecordDocumentEquality();

  @override
  bool equals(StatsRecord? e1, StatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.score == e2?.score &&
        e1?.sponsorshipCount == e2?.sponsorshipCount &&
        e1?.actionsCountTotal == e2?.actionsCountTotal &&
        e1?.actionsCountTransport == e2?.actionsCountTransport &&
        e1?.actionsCountServices == e2?.actionsCountServices &&
        e1?.actionsCountObjects == e2?.actionsCountObjects &&
        e1?.actionsCountLodging == e2?.actionsCountLodging &&
        e1?.actionsCountFurniture == e2?.actionsCountFurniture &&
        e1?.actionsCountFood == e2?.actionsCountFood &&
        e1?.actionsCountDigital == e2?.actionsCountDigital &&
        e1?.actionsCountClothes == e2?.actionsCountClothes &&
        e1?.actionsCountAppliance == e2?.actionsCountAppliance &&
        e1?.eventActionAddCount == e2?.eventActionAddCount &&
        e1?.eventActionUpdateCount == e2?.eventActionUpdateCount &&
        e1?.eventActionDeleteCount == e2?.eventActionDeleteCount &&
        e1?.eventUpdateTargetCount == e2?.eventUpdateTargetCount &&
        e1?.eventUpdateTeamCount == e2?.eventUpdateTeamCount &&
        listEquality.equals(e1?.weekTotalPerDay, e2?.weekTotalPerDay) &&
        e1?.weekTotal == e2?.weekTotal &&
        e1?.weekTransport == e2?.weekTransport &&
        e1?.weekServices == e2?.weekServices &&
        e1?.weekObjects == e2?.weekObjects &&
        e1?.weekLodging == e2?.weekLodging &&
        e1?.weekFurniture == e2?.weekFurniture &&
        e1?.weekFood == e2?.weekFood &&
        e1?.weekDigital == e2?.weekDigital &&
        e1?.weekClothes == e2?.weekClothes &&
        e1?.weekAppliance == e2?.weekAppliance &&
        listEquality.equals(e1?.monthTotalPerDay, e2?.monthTotalPerDay) &&
        e1?.monthTotal == e2?.monthTotal &&
        e1?.monthTransport == e2?.monthTransport &&
        e1?.monthServices == e2?.monthServices &&
        e1?.monthObjects == e2?.monthObjects &&
        e1?.monthLodging == e2?.monthLodging &&
        e1?.monthFurniture == e2?.monthFurniture &&
        e1?.monthFood == e2?.monthFood &&
        e1?.monthDigital == e2?.monthDigital &&
        e1?.monthClothes == e2?.monthClothes &&
        e1?.monthAppliance == e2?.monthAppliance &&
        listEquality.equals(e1?.yearTotalPerDay, e2?.yearTotalPerDay) &&
        e1?.yearTotal == e2?.yearTotal &&
        e1?.yearTransport == e2?.yearTransport &&
        e1?.yearServices == e2?.yearServices &&
        e1?.yearObjects == e2?.yearObjects &&
        e1?.yearLodging == e2?.yearLodging &&
        e1?.yearFurniture == e2?.yearFurniture &&
        e1?.yearFood == e2?.yearFood &&
        e1?.yearDigital == e2?.yearDigital &&
        e1?.yearClothes == e2?.yearClothes &&
        e1?.yearAppliance == e2?.yearAppliance &&
        e1?.dayTotal == e2?.dayTotal &&
        e1?.dayTransport == e2?.dayTransport &&
        e1?.dayServices == e2?.dayServices &&
        e1?.dayObjects == e2?.dayObjects &&
        e1?.dayLodging == e2?.dayLodging &&
        e1?.dayFurniture == e2?.dayFurniture &&
        e1?.dayFood == e2?.dayFood &&
        e1?.dayDigital == e2?.dayDigital &&
        e1?.dayClothes == e2?.dayClothes &&
        e1?.dayAppliance == e2?.dayAppliance &&
        listEquality.equals(e1?.days, e2?.days) &&
        listEquality.equals(e1?.graphTotal, e2?.graphTotal) &&
        e1?.connectionStreak == e2?.connectionStreak;
  }

  @override
  int hash(StatsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.score,
        e?.sponsorshipCount,
        e?.actionsCountTotal,
        e?.actionsCountTransport,
        e?.actionsCountServices,
        e?.actionsCountObjects,
        e?.actionsCountLodging,
        e?.actionsCountFurniture,
        e?.actionsCountFood,
        e?.actionsCountDigital,
        e?.actionsCountClothes,
        e?.actionsCountAppliance,
        e?.eventActionAddCount,
        e?.eventActionUpdateCount,
        e?.eventActionDeleteCount,
        e?.eventUpdateTargetCount,
        e?.eventUpdateTeamCount,
        e?.weekTotalPerDay,
        e?.weekTotal,
        e?.weekTransport,
        e?.weekServices,
        e?.weekObjects,
        e?.weekLodging,
        e?.weekFurniture,
        e?.weekFood,
        e?.weekDigital,
        e?.weekClothes,
        e?.weekAppliance,
        e?.monthTotalPerDay,
        e?.monthTotal,
        e?.monthTransport,
        e?.monthServices,
        e?.monthObjects,
        e?.monthLodging,
        e?.monthFurniture,
        e?.monthFood,
        e?.monthDigital,
        e?.monthClothes,
        e?.monthAppliance,
        e?.yearTotalPerDay,
        e?.yearTotal,
        e?.yearTransport,
        e?.yearServices,
        e?.yearObjects,
        e?.yearLodging,
        e?.yearFurniture,
        e?.yearFood,
        e?.yearDigital,
        e?.yearClothes,
        e?.yearAppliance,
        e?.dayTotal,
        e?.dayTransport,
        e?.dayServices,
        e?.dayObjects,
        e?.dayLodging,
        e?.dayFurniture,
        e?.dayFood,
        e?.dayDigital,
        e?.dayClothes,
        e?.dayAppliance,
        e?.days,
        e?.graphTotal,
        e?.connectionStreak
      ]);

  @override
  bool isValidKey(Object? o) => o is StatsRecord;
}
