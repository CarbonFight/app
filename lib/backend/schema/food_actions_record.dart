import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'food_actions_record.g.dart';

abstract class FoodActionsRecord
    implements Built<FoodActionsRecord, FoodActionsRecordBuilder> {
  static Serializer<FoodActionsRecord> get serializer =>
      _$foodActionsRecordSerializer;

  @nullable
  int get co2e;

  @nullable
  String get food;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get userId;

  @nullable
  String get day;

  @nullable
  int get portions;

  @nullable
  BuiltList<String> get periodicity;

  @nullable
  bool get isPeriodic;

  @nullable
  bool get isFavorite;

  @nullable
  BuiltList<String> get sideComponent;

  @nullable
  String get mainComponent;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FoodActionsRecordBuilder builder) => builder
    ..co2e = 0
    ..food = ''
    ..userId = ''
    ..day = ''
    ..portions = 0
    ..periodicity = ListBuilder()
    ..isPeriodic = false
    ..isFavorite = false
    ..sideComponent = ListBuilder()
    ..mainComponent = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodActions');

  static Stream<FoodActionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FoodActionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FoodActionsRecord._();
  factory FoodActionsRecord([void Function(FoodActionsRecordBuilder) updates]) =
      _$FoodActionsRecord;

  static FoodActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFoodActionsRecordData({
  int co2e,
  String food,
  DateTime createdTime,
  String userId,
  String day,
  int portions,
  bool isPeriodic,
  bool isFavorite,
  String mainComponent,
}) =>
    serializers.toFirestore(
        FoodActionsRecord.serializer,
        FoodActionsRecord((f) => f
          ..co2e = co2e
          ..food = food
          ..createdTime = createdTime
          ..userId = userId
          ..day = day
          ..portions = portions
          ..periodicity = null
          ..isPeriodic = isPeriodic
          ..isFavorite = isFavorite
          ..sideComponent = null
          ..mainComponent = mainComponent));
