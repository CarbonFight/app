// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_calculation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodCalculationRecord> _$foodCalculationRecordSerializer =
    new _$FoodCalculationRecordSerializer();

class _$FoodCalculationRecordSerializer
    implements StructuredSerializer<FoodCalculationRecord> {
  @override
  final Iterable<Type> types = const [
    FoodCalculationRecord,
    _$FoodCalculationRecord
  ];
  @override
  final String wireName = 'FoodCalculationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FoodCalculationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.food;
    if (value != null) {
      result
        ..add('food')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.co2;
    if (value != null) {
      result
        ..add('co2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.foodtype;
    if (value != null) {
      result
        ..add('foodtype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hint;
    if (value != null) {
      result
        ..add('hint')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FoodCalculationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodCalculationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'food':
          result.food = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'co2':
          result.co2 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'foodtype':
          result.foodtype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hint':
          result.hint = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodCalculationRecord extends FoodCalculationRecord {
  @override
  final String? country;
  @override
  final String? food;
  @override
  final double? co2;
  @override
  final String? foodtype;
  @override
  final String? hint;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FoodCalculationRecord(
          [void Function(FoodCalculationRecordBuilder)? updates]) =>
      (new FoodCalculationRecordBuilder()..update(updates))._build();

  _$FoodCalculationRecord._(
      {this.country, this.food, this.co2, this.foodtype, this.hint, this.ffRef})
      : super._();

  @override
  FoodCalculationRecord rebuild(
          void Function(FoodCalculationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodCalculationRecordBuilder toBuilder() =>
      new FoodCalculationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodCalculationRecord &&
        country == other.country &&
        food == other.food &&
        co2 == other.co2 &&
        foodtype == other.foodtype &&
        hint == other.hint &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, country.hashCode), food.hashCode), co2.hashCode),
                foodtype.hashCode),
            hint.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FoodCalculationRecord')
          ..add('country', country)
          ..add('food', food)
          ..add('co2', co2)
          ..add('foodtype', foodtype)
          ..add('hint', hint)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FoodCalculationRecordBuilder
    implements Builder<FoodCalculationRecord, FoodCalculationRecordBuilder> {
  _$FoodCalculationRecord? _$v;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _food;
  String? get food => _$this._food;
  set food(String? food) => _$this._food = food;

  double? _co2;
  double? get co2 => _$this._co2;
  set co2(double? co2) => _$this._co2 = co2;

  String? _foodtype;
  String? get foodtype => _$this._foodtype;
  set foodtype(String? foodtype) => _$this._foodtype = foodtype;

  String? _hint;
  String? get hint => _$this._hint;
  set hint(String? hint) => _$this._hint = hint;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FoodCalculationRecordBuilder() {
    FoodCalculationRecord._initializeBuilder(this);
  }

  FoodCalculationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _country = $v.country;
      _food = $v.food;
      _co2 = $v.co2;
      _foodtype = $v.foodtype;
      _hint = $v.hint;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodCalculationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodCalculationRecord;
  }

  @override
  void update(void Function(FoodCalculationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FoodCalculationRecord build() => _build();

  _$FoodCalculationRecord _build() {
    final _$result = _$v ??
        new _$FoodCalculationRecord._(
            country: country,
            food: food,
            co2: co2,
            foodtype: foodtype,
            hint: hint,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
