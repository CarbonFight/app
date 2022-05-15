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
  Iterable<Object> serialize(Serializers serializers, UsersStatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.day0;
    if (value != null) {
      result
        ..add('day0')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day1;
    if (value != null) {
      result
        ..add('day1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day2;
    if (value != null) {
      result
        ..add('day2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day3;
    if (value != null) {
      result
        ..add('day3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day4;
    if (value != null) {
      result
        ..add('day4')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day5;
    if (value != null) {
      result
        ..add('day5')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day6;
    if (value != null) {
      result
        ..add('day6')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month0;
    if (value != null) {
      result
        ..add('month0')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month1;
    if (value != null) {
      result
        ..add('month1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month2;
    if (value != null) {
      result
        ..add('month2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month3;
    if (value != null) {
      result
        ..add('month3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.week0;
    if (value != null) {
      result
        ..add('week0')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.week1;
    if (value != null) {
      result
        ..add('week1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.week2;
    if (value != null) {
      result
        ..add('week2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.week3;
    if (value != null) {
      result
        ..add('week3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.periodics;
    if (value != null) {
      result
        ..add('periodics')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transportDay0;
    if (value != null) {
      result
        ..add('transportDay0')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.energyDay0;
    if (value != null) {
      result
        ..add('energyDay0')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodDay0;
    if (value != null) {
      result
        ..add('foodDay0')
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
  UsersStatsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersStatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'day0':
          result.day0 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day1':
          result.day1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day2':
          result.day2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day3':
          result.day3 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day4':
          result.day4 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day5':
          result.day5 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day6':
          result.day6 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'month0':
          result.month0 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'month1':
          result.month1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'month2':
          result.month2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'month3':
          result.month3 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'week0':
          result.week0 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'week1':
          result.week1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'week2':
          result.week2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'week3':
          result.week3 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'periodics':
          result.periodics = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transportDay0':
          result.transportDay0 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'energyDay0':
          result.energyDay0 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'foodDay0':
          result.foodDay0 = serializers.deserialize(value,
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

class _$UsersStatsRecord extends UsersStatsRecord {
  @override
  final int day0;
  @override
  final int day1;
  @override
  final int day2;
  @override
  final int day3;
  @override
  final int day4;
  @override
  final int day5;
  @override
  final int day6;
  @override
  final int month0;
  @override
  final int month1;
  @override
  final int month2;
  @override
  final int month3;
  @override
  final String uid;
  @override
  final int week0;
  @override
  final int week1;
  @override
  final int week2;
  @override
  final int week3;
  @override
  final int periodics;
  @override
  final int transportDay0;
  @override
  final int energyDay0;
  @override
  final int foodDay0;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersStatsRecord(
          [void Function(UsersStatsRecordBuilder) updates]) =>
      (new UsersStatsRecordBuilder()..update(updates)).build();

  _$UsersStatsRecord._(
      {this.day0,
      this.day1,
      this.day2,
      this.day3,
      this.day4,
      this.day5,
      this.day6,
      this.month0,
      this.month1,
      this.month2,
      this.month3,
      this.uid,
      this.week0,
      this.week1,
      this.week2,
      this.week3,
      this.periodics,
      this.transportDay0,
      this.energyDay0,
      this.foodDay0,
      this.reference})
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
        day0 == other.day0 &&
        day1 == other.day1 &&
        day2 == other.day2 &&
        day3 == other.day3 &&
        day4 == other.day4 &&
        day5 == other.day5 &&
        day6 == other.day6 &&
        month0 == other.month0 &&
        month1 == other.month1 &&
        month2 == other.month2 &&
        month3 == other.month3 &&
        uid == other.uid &&
        week0 == other.week0 &&
        week1 == other.week1 &&
        week2 == other.week2 &&
        week3 == other.week3 &&
        periodics == other.periodics &&
        transportDay0 == other.transportDay0 &&
        energyDay0 == other.energyDay0 &&
        foodDay0 == other.foodDay0 &&
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
                                                                            $jc($jc($jc(0, day0.hashCode), day1.hashCode),
                                                                                day2.hashCode),
                                                                            day3.hashCode),
                                                                        day4.hashCode),
                                                                    day5.hashCode),
                                                                day6.hashCode),
                                                            month0.hashCode),
                                                        month1.hashCode),
                                                    month2.hashCode),
                                                month3.hashCode),
                                            uid.hashCode),
                                        week0.hashCode),
                                    week1.hashCode),
                                week2.hashCode),
                            week3.hashCode),
                        periodics.hashCode),
                    transportDay0.hashCode),
                energyDay0.hashCode),
            foodDay0.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersStatsRecord')
          ..add('day0', day0)
          ..add('day1', day1)
          ..add('day2', day2)
          ..add('day3', day3)
          ..add('day4', day4)
          ..add('day5', day5)
          ..add('day6', day6)
          ..add('month0', month0)
          ..add('month1', month1)
          ..add('month2', month2)
          ..add('month3', month3)
          ..add('uid', uid)
          ..add('week0', week0)
          ..add('week1', week1)
          ..add('week2', week2)
          ..add('week3', week3)
          ..add('periodics', periodics)
          ..add('transportDay0', transportDay0)
          ..add('energyDay0', energyDay0)
          ..add('foodDay0', foodDay0)
          ..add('reference', reference))
        .toString();
  }
}

class UsersStatsRecordBuilder
    implements Builder<UsersStatsRecord, UsersStatsRecordBuilder> {
  _$UsersStatsRecord _$v;

  int _day0;
  int get day0 => _$this._day0;
  set day0(int day0) => _$this._day0 = day0;

  int _day1;
  int get day1 => _$this._day1;
  set day1(int day1) => _$this._day1 = day1;

  int _day2;
  int get day2 => _$this._day2;
  set day2(int day2) => _$this._day2 = day2;

  int _day3;
  int get day3 => _$this._day3;
  set day3(int day3) => _$this._day3 = day3;

  int _day4;
  int get day4 => _$this._day4;
  set day4(int day4) => _$this._day4 = day4;

  int _day5;
  int get day5 => _$this._day5;
  set day5(int day5) => _$this._day5 = day5;

  int _day6;
  int get day6 => _$this._day6;
  set day6(int day6) => _$this._day6 = day6;

  int _month0;
  int get month0 => _$this._month0;
  set month0(int month0) => _$this._month0 = month0;

  int _month1;
  int get month1 => _$this._month1;
  set month1(int month1) => _$this._month1 = month1;

  int _month2;
  int get month2 => _$this._month2;
  set month2(int month2) => _$this._month2 = month2;

  int _month3;
  int get month3 => _$this._month3;
  set month3(int month3) => _$this._month3 = month3;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  int _week0;
  int get week0 => _$this._week0;
  set week0(int week0) => _$this._week0 = week0;

  int _week1;
  int get week1 => _$this._week1;
  set week1(int week1) => _$this._week1 = week1;

  int _week2;
  int get week2 => _$this._week2;
  set week2(int week2) => _$this._week2 = week2;

  int _week3;
  int get week3 => _$this._week3;
  set week3(int week3) => _$this._week3 = week3;

  int _periodics;
  int get periodics => _$this._periodics;
  set periodics(int periodics) => _$this._periodics = periodics;

  int _transportDay0;
  int get transportDay0 => _$this._transportDay0;
  set transportDay0(int transportDay0) => _$this._transportDay0 = transportDay0;

  int _energyDay0;
  int get energyDay0 => _$this._energyDay0;
  set energyDay0(int energyDay0) => _$this._energyDay0 = energyDay0;

  int _foodDay0;
  int get foodDay0 => _$this._foodDay0;
  set foodDay0(int foodDay0) => _$this._foodDay0 = foodDay0;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersStatsRecordBuilder() {
    UsersStatsRecord._initializeBuilder(this);
  }

  UsersStatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _day0 = $v.day0;
      _day1 = $v.day1;
      _day2 = $v.day2;
      _day3 = $v.day3;
      _day4 = $v.day4;
      _day5 = $v.day5;
      _day6 = $v.day6;
      _month0 = $v.month0;
      _month1 = $v.month1;
      _month2 = $v.month2;
      _month3 = $v.month3;
      _uid = $v.uid;
      _week0 = $v.week0;
      _week1 = $v.week1;
      _week2 = $v.week2;
      _week3 = $v.week3;
      _periodics = $v.periodics;
      _transportDay0 = $v.transportDay0;
      _energyDay0 = $v.energyDay0;
      _foodDay0 = $v.foodDay0;
      _reference = $v.reference;
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
  void update(void Function(UsersStatsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersStatsRecord build() {
    final _$result = _$v ??
        new _$UsersStatsRecord._(
            day0: day0,
            day1: day1,
            day2: day2,
            day3: day3,
            day4: day4,
            day5: day5,
            day6: day6,
            month0: month0,
            month1: month1,
            month2: month2,
            month3: month3,
            uid: uid,
            week0: week0,
            week1: week1,
            week2: week2,
            week3: week3,
            periodics: periodics,
            transportDay0: transportDay0,
            energyDay0: energyDay0,
            foodDay0: foodDay0,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
