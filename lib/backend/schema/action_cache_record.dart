import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'action_cache_record.g.dart';

abstract class ActionCacheRecord
    implements Built<ActionCacheRecord, ActionCacheRecordBuilder> {
  static Serializer<ActionCacheRecord> get serializer =>
      _$actionCacheRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  DateTime get date;

  @nullable
  int get co2e;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ActionCacheRecordBuilder builder) =>
      builder..co2e = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actionCache');

  static Stream<ActionCacheRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ActionCacheRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ActionCacheRecord._();
  factory ActionCacheRecord([void Function(ActionCacheRecordBuilder) updates]) =
      _$ActionCacheRecord;

  static ActionCacheRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createActionCacheRecordData({
  DocumentReference user,
  DateTime date,
  int co2e,
}) =>
    serializers.toFirestore(
        ActionCacheRecord.serializer,
        ActionCacheRecord((a) => a
          ..user = user
          ..date = date
          ..co2e = co2e));
