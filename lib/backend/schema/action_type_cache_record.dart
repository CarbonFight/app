import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'action_type_cache_record.g.dart';

abstract class ActionTypeCacheRecord
    implements Built<ActionTypeCacheRecord, ActionTypeCacheRecordBuilder> {
  static Serializer<ActionTypeCacheRecord> get serializer =>
      _$actionTypeCacheRecordSerializer;

  @nullable
  DocumentReference get actionCache;

  @nullable
  String get actionType;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ActionTypeCacheRecordBuilder builder) =>
      builder..actionType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actionTypeCache');

  static Stream<ActionTypeCacheRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ActionTypeCacheRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ActionTypeCacheRecord._();
  factory ActionTypeCacheRecord(
          [void Function(ActionTypeCacheRecordBuilder) updates]) =
      _$ActionTypeCacheRecord;

  static ActionTypeCacheRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createActionTypeCacheRecordData({
  DocumentReference actionCache,
  String actionType,
  DateTime date,
}) =>
    serializers.toFirestore(
        ActionTypeCacheRecord.serializer,
        ActionTypeCacheRecord((a) => a
          ..actionCache = actionCache
          ..actionType = actionType
          ..date = date));
