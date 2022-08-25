// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_stats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersStatsRecord> _$usersStatsRecordSerializer =
    new _$UsersStatsRecordSerializer();

class _$UsersStatsRecordSerializer
    implements StructuredSerializer<UsersStatsRecord> {
  @override
  final Iterable<Type> types = const [UsersStatsRecord, _$UsersStatsRecord];
  @override
  final String wireName = 'UsersStatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersStatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.periodics;
    if (value != null) {
      result
        ..add('periodics')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.weeks;
    if (value != null) {
      result
        ..add('weeks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.months;
    if (value != null) {
      result
        ..add('months')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.transports;
    if (value != null) {
      result
        ..add('transports')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.energies;
    if (value != null) {
      result
        ..add('energies')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.foods;
    if (value != null) {
      result
        ..add('foods')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.energyPeriodics;
    if (value != null) {
      result
        ..add('energyPeriodics')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodPeriodics;
    if (value != null) {
      result
        ..add('foodPeriodics')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transportPeriodics;
    if (value != null) {
      result
        ..add('transportPeriodics')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.daysChart;
    if (value != null) {
      result
        ..add('daysChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.weeksChart;
    if (value != null) {
      result
        ..add('weeksChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.monthsChart;
    if (value != null) {
      result
        ..add('monthsChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
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
  UsersStatsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersStatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'periodics':
          result.periodics = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'days':
          result.days.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'weeks':
          result.weeks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'months':
          result.months.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'transports':
          result.transports.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'energies':
          result.energies.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'foods':
          result.foods.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'energyPeriodics':
          result.energyPeriodics = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'foodPeriodics':
          result.foodPeriodics = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'transportPeriodics':
          result.transportPeriodics = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'daysChart':
          result.daysChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'weeksChart':
          result.weeksChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'monthsChart':
          result.monthsChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
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

class _$UsersStatsRecord extends UsersStatsRecord {
  @override
  final String? uid;
  @override
  final int? periodics;
  @override
  final BuiltList<int>? days;
  @override
  final BuiltList<int>? weeks;
  @override
  final BuiltList<int>? months;
  @override
  final BuiltList<int>? transports;
  @override
  final BuiltList<int>? energies;
  @override
  final BuiltList<int>? foods;
  @override
  final int? energyPeriodics;
  @override
  final int? foodPeriodics;
  @override
  final int? transportPeriodics;
  @override
  final BuiltList<double>? daysChart;
  @override
  final BuiltList<double>? weeksChart;
  @override
  final BuiltList<double>? monthsChart;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersStatsRecord(
          [void Function(UsersStatsRecordBuilder)? updates]) =>
      (new UsersStatsRecordBuilder()..update(updates))._build();

  _$UsersStatsRecord._(
      {this.uid,
      this.periodics,
      this.days,
      this.weeks,
      this.months,
      this.transports,
      this.energies,
      this.foods,
      this.energyPeriodics,
      this.foodPeriodics,
      this.transportPeriodics,
      this.daysChart,
      this.weeksChart,
      this.monthsChart,
      this.ffRef})
      : super._();

  @override
  UsersStatsRecord rebuild(void Function(UsersStatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersStatsRecordBuilder toBuilder() =>
      new UsersStatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersStatsRecord &&
        uid == other.uid &&
        periodics == other.periodics &&
        days == other.days &&
        weeks == other.weeks &&
        months == other.months &&
        transports == other.transports &&
        energies == other.energies &&
        foods == other.foods &&
        energyPeriodics == other.energyPeriodics &&
        foodPeriodics == other.foodPeriodics &&
        transportPeriodics == other.transportPeriodics &&
        daysChart == other.daysChart &&
        weeksChart == other.weeksChart &&
        monthsChart == other.monthsChart &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(0,
                                                                uid.hashCode),
                                                            periodics.hashCode),
                                                        days.hashCode),
                                                    weeks.hashCode),
                                                months.hashCode),
                                            transports.hashCode),
                                        energies.hashCode),
                                    foods.hashCode),
                                energyPeriodics.hashCode),
                            foodPeriodics.hashCode),
                        transportPeriodics.hashCode),
                    daysChart.hashCode),
                weeksChart.hashCode),
            monthsChart.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersStatsRecord')
          ..add('uid', uid)
          ..add('periodics', periodics)
          ..add('days', days)
          ..add('weeks', weeks)
          ..add('months', months)
          ..add('transports', transports)
          ..add('energies', energies)
          ..add('foods', foods)
          ..add('energyPeriodics', energyPeriodics)
          ..add('foodPeriodics', foodPeriodics)
          ..add('transportPeriodics', transportPeriodics)
          ..add('daysChart', daysChart)
          ..add('weeksChart', weeksChart)
          ..add('monthsChart', monthsChart)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersStatsRecordBuilder
    implements Builder<UsersStatsRecord, UsersStatsRecordBuilder> {
  _$UsersStatsRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  int? _periodics;
  int? get periodics => _$this._periodics;
  set periodics(int? periodics) => _$this._periodics = periodics;

  ListBuilder<int>? _days;
  ListBuilder<int> get days => _$this._days ??= new ListBuilder<int>();
  set days(ListBuilder<int>? days) => _$this._days = days;

  ListBuilder<int>? _weeks;
  ListBuilder<int> get weeks => _$this._weeks ??= new ListBuilder<int>();
  set weeks(ListBuilder<int>? weeks) => _$this._weeks = weeks;

  ListBuilder<int>? _months;
  ListBuilder<int> get months => _$this._months ??= new ListBuilder<int>();
  set months(ListBuilder<int>? months) => _$this._months = months;

  ListBuilder<int>? _transports;
  ListBuilder<int> get transports =>
      _$this._transports ??= new ListBuilder<int>();
  set transports(ListBuilder<int>? transports) =>
      _$this._transports = transports;

  ListBuilder<int>? _energies;
  ListBuilder<int> get energies => _$this._energies ??= new ListBuilder<int>();
  set energies(ListBuilder<int>? energies) => _$this._energies = energies;

  ListBuilder<int>? _foods;
  ListBuilder<int> get foods => _$this._foods ??= new ListBuilder<int>();
  set foods(ListBuilder<int>? foods) => _$this._foods = foods;

  int? _energyPeriodics;
  int? get energyPeriodics => _$this._energyPeriodics;
  set energyPeriodics(int? energyPeriodics) =>
      _$this._energyPeriodics = energyPeriodics;

  int? _foodPeriodics;
  int? get foodPeriodics => _$this._foodPeriodics;
  set foodPeriodics(int? foodPeriodics) =>
      _$this._foodPeriodics = foodPeriodics;

  int? _transportPeriodics;
  int? get transportPeriodics => _$this._transportPeriodics;
  set transportPeriodics(int? transportPeriodics) =>
      _$this._transportPeriodics = transportPeriodics;

  ListBuilder<double>? _daysChart;
  ListBuilder<double> get daysChart =>
      _$this._daysChart ??= new ListBuilder<double>();
  set daysChart(ListBuilder<double>? daysChart) =>
      _$this._daysChart = daysChart;

  ListBuilder<double>? _weeksChart;
  ListBuilder<double> get weeksChart =>
      _$this._weeksChart ??= new ListBuilder<double>();
  set weeksChart(ListBuilder<double>? weeksChart) =>
      _$this._weeksChart = weeksChart;

  ListBuilder<double>? _monthsChart;
  ListBuilder<double> get monthsChart =>
      _$this._monthsChart ??= new ListBuilder<double>();
  set monthsChart(ListBuilder<double>? monthsChart) =>
      _$this._monthsChart = monthsChart;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersStatsRecordBuilder() {
    UsersStatsRecord._initializeBuilder(this);
  }

  UsersStatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _periodics = $v.periodics;
      _days = $v.days?.toBuilder();
      _weeks = $v.weeks?.toBuilder();
      _months = $v.months?.toBuilder();
      _transports = $v.transports?.toBuilder();
      _energies = $v.energies?.toBuilder();
      _foods = $v.foods?.toBuilder();
      _energyPeriodics = $v.energyPeriodics;
      _foodPeriodics = $v.foodPeriodics;
      _transportPeriodics = $v.transportPeriodics;
      _daysChart = $v.daysChart?.toBuilder();
      _weeksChart = $v.weeksChart?.toBuilder();
      _monthsChart = $v.monthsChart?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersStatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersStatsRecord;
  }

  @override
  void update(void Function(UsersStatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersStatsRecord build() => _build();

  _$UsersStatsRecord _build() {
    _$UsersStatsRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersStatsRecord._(
              uid: uid,
              periodics: periodics,
              days: _days?.build(),
              weeks: _weeks?.build(),
              months: _months?.build(),
              transports: _transports?.build(),
              energies: _energies?.build(),
              foods: _foods?.build(),
              energyPeriodics: energyPeriodics,
              foodPeriodics: foodPeriodics,
              transportPeriodics: transportPeriodics,
              daysChart: _daysChart?.build(),
              weeksChart: _weeksChart?.build(),
              monthsChart: _monthsChart?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'days';
        _days?.build();
        _$failedField = 'weeks';
        _weeks?.build();
        _$failedField = 'months';
        _months?.build();
        _$failedField = 'transports';
        _transports?.build();
        _$failedField = 'energies';
        _energies?.build();
        _$failedField = 'foods';
        _foods?.build();

        _$failedField = 'daysChart';
        _daysChart?.build();
        _$failedField = 'weeksChart';
        _weeksChart?.build();
        _$failedField = 'monthsChart';
        _monthsChart?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersStatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
