// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_cache_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActionCacheRecord> _$actionCacheRecordSerializer =
    new _$ActionCacheRecordSerializer();

class _$ActionCacheRecordSerializer
    implements StructuredSerializer<ActionCacheRecord> {
  @override
  final Iterable<Type> types = const [ActionCacheRecord, _$ActionCacheRecord];
  @override
  final String wireName = 'ActionCacheRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ActionCacheRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.co2e;
    if (value != null) {
      result
        ..add('co2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ActionCacheRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActionCacheRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'co2e':
          result.co2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$ActionCacheRecord extends ActionCacheRecord {
  @override
  final DocumentReference<Object> user;
  @override
  final DateTime date;
  @override
  final int co2e;
  @override
  final String day;
  @override
  final DocumentReference<Object> reference;

  factory _$ActionCacheRecord(
          [void Function(ActionCacheRecordBuilder) updates]) =>
      (new ActionCacheRecordBuilder()..update(updates)).build();

  _$ActionCacheRecord._(
      {this.user, this.date, this.co2e, this.day, this.reference})
      : super._();

  @override
  ActionCacheRecord rebuild(void Function(ActionCacheRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActionCacheRecordBuilder toBuilder() =>
      new ActionCacheRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActionCacheRecord &&
        user == other.user &&
        date == other.date &&
        co2e == other.co2e &&
        day == other.day &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, user.hashCode), date.hashCode), co2e.hashCode),
            day.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActionCacheRecord')
          ..add('user', user)
          ..add('date', date)
          ..add('co2e', co2e)
          ..add('day', day)
          ..add('reference', reference))
        .toString();
  }
}

class ActionCacheRecordBuilder
    implements Builder<ActionCacheRecord, ActionCacheRecordBuilder> {
  _$ActionCacheRecord _$v;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  int _co2e;
  int get co2e => _$this._co2e;
  set co2e(int co2e) => _$this._co2e = co2e;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ActionCacheRecordBuilder() {
    ActionCacheRecord._initializeBuilder(this);
  }

  ActionCacheRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _date = $v.date;
      _co2e = $v.co2e;
      _day = $v.day;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActionCacheRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActionCacheRecord;
  }

  @override
  void update(void Function(ActionCacheRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActionCacheRecord build() {
    final _$result = _$v ??
        new _$ActionCacheRecord._(
            user: user, date: date, co2e: co2e, day: day, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
