import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'food_actions_record.g.dart';

abstract class FoodActionsRecord
    implements Built<FoodActionsRecord, FoodActionsRecordBuilder> {
  static Serializer<FoodActionsRecord> get serializer =>
      _$foodActionsRecordSerializer;

  int? get co2e;

  String? get food;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get userId;

  String? get day;

  BuiltList<String>? get periodicity;

  bool? get isPeriodic;

  bool? get isFavorite;

  BuiltList<String>? get sideComponent;

  String? get mainComponent;

  int? get portions;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FoodActionsRecordBuilder builder) => builder
    ..co2e = 0
    ..food = ''
    ..userId = ''
    ..day = ''
    ..periodicity = ListBuilder()
    ..isPeriodic = false
    ..isFavorite = false
    ..sideComponent = ListBuilder()
    ..mainComponent = ''
    ..portions = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodActions');

  static Stream<FoodActionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FoodActionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FoodActionsRecord._();
  factory FoodActionsRecord([void Function(FoodActionsRecordBuilder) updates]) =
      _$FoodActionsRecord;

  static FoodActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    FoodActionsRecord.serializer,
    FoodActionsRecord(
      (f) => f
        ..co2e = co2e
        ..food = food
        ..createdTime = createdTime
        ..userId = userId
        ..day = day
        ..periodicity = null
        ..isPeriodic = isPeriodic
        ..isFavorite = isFavorite
        ..sideComponent = null
        ..mainComponent = mainComponent
        ..portions = portions,
    ),
  );

  return firestoreData;
}
