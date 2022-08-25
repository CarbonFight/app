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
  Iterable<Object?> serialize(Serializers serializers, FoodActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.periodicity;
    if (value != null) {
      result
        ..add('periodicity')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isPeriodic;
    if (value != null) {
      result
        ..add('isPeriodic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('isFavorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sideComponent;
    if (value != null) {
      result
        ..add('sideComponent')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.mainComponent;
    if (value != null) {
      result
        ..add('mainComponent')
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
  FoodActionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'co2e':
          result.co2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'food':
          result.food = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'portions':
          result.portions = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'periodicity':
          result.periodicity.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isPeriodic':
          result.isPeriodic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sideComponent':
          result.sideComponent.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'mainComponent':
          result.mainComponent = serializers.deserialize(value,
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

class _$FoodActionsRecord extends FoodActionsRecord {
  @override
  final int? co2e;
  @override
  final String? food;
  @override
  final DateTime? createdTime;
  @override
  final String? userId;
  @override
  final String? day;
  @override
  final int? portions;
  @override
  final BuiltList<String>? periodicity;
  @override
  final bool? isPeriodic;
  @override
  final bool? isFavorite;
  @override
  final BuiltList<String>? sideComponent;
  @override
  final String? mainComponent;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FoodActionsRecord(
          [void Function(FoodActionsRecordBuilder)? updates]) =>
      (new FoodActionsRecordBuilder()..update(updates))._build();

  _$FoodActionsRecord._(
      {this.co2e,
      this.food,
      this.createdTime,
      this.userId,
      this.day,
      this.portions,
      this.periodicity,
      this.isPeriodic,
      this.isFavorite,
      this.sideComponent,
      this.mainComponent,
      this.ffRef})
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
        createdTime == other.createdTime &&
        userId == other.userId &&
        day == other.day &&
        portions == other.portions &&
        periodicity == other.periodicity &&
        isPeriodic == other.isPeriodic &&
        isFavorite == other.isFavorite &&
        sideComponent == other.sideComponent &&
        mainComponent == other.mainComponent &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, co2e.hashCode),
                                                food.hashCode),
                                            createdTime.hashCode),
                                        userId.hashCode),
                                    day.hashCode),
                                portions.hashCode),
                            periodicity.hashCode),
                        isPeriodic.hashCode),
                    isFavorite.hashCode),
                sideComponent.hashCode),
            mainComponent.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FoodActionsRecord')
          ..add('co2e', co2e)
          ..add('food', food)
          ..add('createdTime', createdTime)
          ..add('userId', userId)
          ..add('day', day)
          ..add('portions', portions)
          ..add('periodicity', periodicity)
          ..add('isPeriodic', isPeriodic)
          ..add('isFavorite', isFavorite)
          ..add('sideComponent', sideComponent)
          ..add('mainComponent', mainComponent)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FoodActionsRecordBuilder
    implements Builder<FoodActionsRecord, FoodActionsRecordBuilder> {
  _$FoodActionsRecord? _$v;

  int? _co2e;
  int? get co2e => _$this._co2e;
  set co2e(int? co2e) => _$this._co2e = co2e;

  String? _food;
  String? get food => _$this._food;
  set food(String? food) => _$this._food = food;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  int? _portions;
  int? get portions => _$this._portions;
  set portions(int? portions) => _$this._portions = portions;

  ListBuilder<String>? _periodicity;
  ListBuilder<String> get periodicity =>
      _$this._periodicity ??= new ListBuilder<String>();
  set periodicity(ListBuilder<String>? periodicity) =>
      _$this._periodicity = periodicity;

  bool? _isPeriodic;
  bool? get isPeriodic => _$this._isPeriodic;
  set isPeriodic(bool? isPeriodic) => _$this._isPeriodic = isPeriodic;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  ListBuilder<String>? _sideComponent;
  ListBuilder<String> get sideComponent =>
      _$this._sideComponent ??= new ListBuilder<String>();
  set sideComponent(ListBuilder<String>? sideComponent) =>
      _$this._sideComponent = sideComponent;

  String? _mainComponent;
  String? get mainComponent => _$this._mainComponent;
  set mainComponent(String? mainComponent) =>
      _$this._mainComponent = mainComponent;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FoodActionsRecordBuilder() {
    FoodActionsRecord._initializeBuilder(this);
  }

  FoodActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _co2e = $v.co2e;
      _food = $v.food;
      _createdTime = $v.createdTime;
      _userId = $v.userId;
      _day = $v.day;
      _portions = $v.portions;
      _periodicity = $v.periodicity?.toBuilder();
      _isPeriodic = $v.isPeriodic;
      _isFavorite = $v.isFavorite;
      _sideComponent = $v.sideComponent?.toBuilder();
      _mainComponent = $v.mainComponent;
      _ffRef = $v.ffRef;
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
  void update(void Function(FoodActionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FoodActionsRecord build() => _build();

  _$FoodActionsRecord _build() {
    _$FoodActionsRecord _$result;
    try {
      _$result = _$v ??
          new _$FoodActionsRecord._(
              co2e: co2e,
              food: food,
              createdTime: createdTime,
              userId: userId,
              day: day,
              portions: portions,
              periodicity: _periodicity?.build(),
              isPeriodic: isPeriodic,
              isFavorite: isFavorite,
              sideComponent: _sideComponent?.build(),
              mainComponent: mainComponent,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'periodicity';
        _periodicity?.build();

        _$failedField = 'sideComponent';
        _sideComponent?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FoodActionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
