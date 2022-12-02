import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'food_calculation_record.g.dart';

abstract class FoodCalculationRecord
    implements Built<FoodCalculationRecord, FoodCalculationRecordBuilder> {
  static Serializer<FoodCalculationRecord> get serializer =>
      _$foodCalculationRecordSerializer;

  String? get country;

  String? get food;

  double? get co2;

  String? get foodtype;

  String? get hint;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FoodCalculationRecordBuilder builder) =>
      builder
        ..country = ''
        ..food = ''
        ..co2 = 0.0
        ..foodtype = ''
        ..hint = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodCalculation');

  static Stream<FoodCalculationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FoodCalculationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FoodCalculationRecord._();
  factory FoodCalculationRecord(
          [void Function(FoodCalculationRecordBuilder) updates]) =
      _$FoodCalculationRecord;

  static FoodCalculationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFoodCalculationRecordData({
  String? country,
  String? food,
  double? co2,
  String? foodtype,
  String? hint,
}) {
  final firestoreData = serializers.toFirestore(
    FoodCalculationRecord.serializer,
    FoodCalculationRecord(
      (f) => f
        ..country = country
        ..food = food
        ..co2 = co2
        ..foodtype = foodtype
        ..hint = hint,
    ),
  );

  return firestoreData;
}
