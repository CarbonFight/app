// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_actions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodActionsRecord> _$foodActionsRecordSerializer =
    new _$FoodActionsRecordSerializer();

class _$FoodActionsRecordSerializer
    implements StructuredSerializer<FoodActionsRecord> {
  @override
  final Iterable<Type> types = const [FoodActionsRecord, _$FoodActionsRecord];
  @override
  final String wireName = 'FoodActionsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.co2e;
    if (value != null) {
      result
        ..add('co2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.food;
    if (value != null) {
      result
        ..add('food')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainComponent;
    if (value != null) {
      result
        ..add('mainComponent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sideComponent;
    if (value != null) {
      result
        ..add('sideComponent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.portions;
    if (value != null) {
      result
        ..add('portions')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  FoodActionsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'co2e':
          result.co2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'food':
          result.food = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mainComponent':
          result.mainComponent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sideComponent':
          result.sideComponent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'portions':
          result.portions = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodActionsRecord extends FoodActionsRecord {
  @override
  final int co2e;
  @override
  final String food;
  @override
  final String mainComponent;
  @override
  final String sideComponent;
  @override
  final DateTime createdTime;
  @override
  final String userId;
  @override
  final String day;
  @override
  final int portions;
  @override
  final DocumentReference<Object> reference;

  factory _$FoodActionsRecord(
          [void Function(FoodActionsRecordBuilder) updates]) =>
      (new FoodActionsRecordBuilder()..update(updates)).build();

  _$FoodActionsRecord._(
      {this.co2e,
      this.food,
      this.mainComponent,
      this.sideComponent,
      this.createdTime,
      this.userId,
      this.day,
      this.portions,
      this.reference})
      : super._();

  @override
  FoodActionsRecord rebuild(void Function(FoodActionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodActionsRecordBuilder toBuilder() =>
      new FoodActionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodActionsRecord &&
        co2e == other.co2e &&
        food == other.food &&
        mainComponent == other.mainComponent &&
        sideComponent == other.sideComponent &&
        createdTime == other.createdTime &&
        userId == other.userId &&
        day == other.day &&
        portions == other.portions &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, co2e.hashCode), food.hashCode),
                                mainComponent.hashCode),
                            sideComponent.hashCode),
                        createdTime.hashCode),
                    userId.hashCode),
                day.hashCode),
            portions.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodActionsRecord')
          ..add('co2e', co2e)
          ..add('food', food)
          ..add('mainComponent', mainComponent)
          ..add('sideComponent', sideComponent)
          ..add('createdTime', createdTime)
          ..add('userId', userId)
          ..add('day', day)
          ..add('portions', portions)
          ..add('reference', reference))
        .toString();
  }
}

class FoodActionsRecordBuilder
    implements Builder<FoodActionsRecord, FoodActionsRecordBuilder> {
  _$FoodActionsRecord _$v;

  int _co2e;
  int get co2e => _$this._co2e;
  set co2e(int co2e) => _$this._co2e = co2e;

  String _food;
  String get food => _$this._food;
  set food(String food) => _$this._food = food;

  String _mainComponent;
  String get mainComponent => _$this._mainComponent;
  set mainComponent(String mainComponent) =>
      _$this._mainComponent = mainComponent;

  String _sideComponent;
  String get sideComponent => _$this._sideComponent;
  set sideComponent(String sideComponent) =>
      _$this._sideComponent = sideComponent;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  int _portions;
  int get portions => _$this._portions;
  set portions(int portions) => _$this._portions = portions;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  FoodActionsRecordBuilder() {
    FoodActionsRecord._initializeBuilder(this);
  }

  FoodActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _co2e = $v.co2e;
      _food = $v.food;
      _mainComponent = $v.mainComponent;
      _sideComponent = $v.sideComponent;
      _createdTime = $v.createdTime;
      _userId = $v.userId;
      _day = $v.day;
      _portions = $v.portions;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodActionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodActionsRecord;
  }

  @override
  void update(void Function(FoodActionsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodActionsRecord build() {
    final _$result = _$v ??
        new _$FoodActionsRecord._(
            co2e: co2e,
            food: food,
            mainComponent: mainComponent,
            sideComponent: sideComponent,
            createdTime: createdTime,
            userId: userId,
            day: day,
            portions: portions,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
