import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/transport_actions_record.dart';
import 'schema/energy_actions_record.dart';
import 'schema/users_record.dart';
import 'schema/energy_periodics_record.dart';
import 'schema/food_actions_record.dart';
import 'schema/action_cache_record.dart';
import 'schema/action_type_cache_record.dart';
import 'schema/users_stats_record.dart';
import 'schema/serializers.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/transport_actions_record.dart';
export 'schema/energy_actions_record.dart';
export 'schema/users_record.dart';
export 'schema/energy_periodics_record.dart';
export 'schema/food_actions_record.dart';
export 'schema/action_cache_record.dart';
export 'schema/action_type_cache_record.dart';
export 'schema/users_stats_record.dart';

/// Functions to query TransportActionsRecords (as a Stream and as a Future).
Stream<List<TransportActionsRecord>> queryTransportActionsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        TransportActionsRecord.collection, TransportActionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TransportActionsRecord>> queryTransportActionsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        TransportActionsRecord.collection, TransportActionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<TransportActionsRecord>>
    queryTransportActionsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
        queryCollectionPage(TransportActionsRecord.collection,
            TransportActionsRecord.serializer,
            queryBuilder: queryBuilder,
            nextPageMarker: nextPageMarker,
            pageSize: pageSize);

/// Functions to query EnergyActionsRecords (as a Stream and as a Future).
Stream<List<EnergyActionsRecord>> queryEnergyActionsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EnergyActionsRecord.collection, EnergyActionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EnergyActionsRecord>> queryEnergyActionsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EnergyActionsRecord.collection, EnergyActionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<EnergyActionsRecord>> queryEnergyActionsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        EnergyActionsRecord.collection, EnergyActionsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersRecord>> queryUsersRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query EnergyPeriodicsRecords (as a Stream and as a Future).
Stream<List<EnergyPeriodicsRecord>> queryEnergyPeriodicsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EnergyPeriodicsRecord.collection, EnergyPeriodicsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EnergyPeriodicsRecord>> queryEnergyPeriodicsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EnergyPeriodicsRecord.collection, EnergyPeriodicsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<EnergyPeriodicsRecord>> queryEnergyPeriodicsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        EnergyPeriodicsRecord.collection, EnergyPeriodicsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query FoodActionsRecords (as a Stream and as a Future).
Stream<List<FoodActionsRecord>> queryFoodActionsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(FoodActionsRecord.collection, FoodActionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<FoodActionsRecord>> queryFoodActionsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        FoodActionsRecord.collection, FoodActionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<FoodActionsRecord>> queryFoodActionsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        FoodActionsRecord.collection, FoodActionsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query ActionCacheRecords (as a Stream and as a Future).
Stream<List<ActionCacheRecord>> queryActionCacheRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ActionCacheRecord.collection, ActionCacheRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ActionCacheRecord>> queryActionCacheRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ActionCacheRecord.collection, ActionCacheRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<ActionCacheRecord>> queryActionCacheRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        ActionCacheRecord.collection, ActionCacheRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query ActionTypeCacheRecords (as a Stream and as a Future).
Stream<List<ActionTypeCacheRecord>> queryActionTypeCacheRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        ActionTypeCacheRecord.collection, ActionTypeCacheRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ActionTypeCacheRecord>> queryActionTypeCacheRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ActionTypeCacheRecord.collection, ActionTypeCacheRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<ActionTypeCacheRecord>> queryActionTypeCacheRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        ActionTypeCacheRecord.collection, ActionTypeCacheRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query UsersStatsRecords (as a Stream and as a Future).
Stream<List<UsersStatsRecord>> queryUsersStatsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersStatsRecord.collection, UsersStatsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersStatsRecord>> queryUsersStatsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        UsersStatsRecord.collection, UsersStatsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<UsersStatsRecord>> queryUsersStatsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        UsersStatsRecord.collection, UsersStatsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

class FFFirestorePage<T> {
  final List<T> data;
  final QueryDocumentSnapshot nextPageMarker;

  FFFirestorePage(this.data, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  CollectionReference collection,
  Serializer<T> serializer, {
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  final docSnapshots = await query.get();
  final data = docSnapshots.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList();
  final nextPageToken =
      docSnapshots.docs.isEmpty ? null : docSnapshots.docs.last;
  return FFFirestorePage(data, nextPageToken);
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
