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
  String get mainComponent;

  @nullable
  String get sideComponent;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get userId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FoodActionsRecordBuilder builder) => builder
    ..co2e = 0
    ..food = ''
    ..mainComponent = ''
    ..sideComponent = ''
    ..userId = '';

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
  String mainComponent,
  String sideComponent,
  DateTime createdTime,
  String userId,
}) =>
    serializers.toFirestore(
        FoodActionsRecord.serializer,
        FoodActionsRecord((f) => f
          ..co2e = co2e
          ..food = food
          ..mainComponent = mainComponent
          ..sideComponent = sideComponent
          ..createdTime = createdTime
          ..userId = userId));
