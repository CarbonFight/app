// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_type_cache_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActionTypeCacheRecord> _$actionTypeCacheRecordSerializer =
    new _$ActionTypeCacheRecordSerializer();

class _$ActionTypeCacheRecordSerializer
    implements StructuredSerializer<ActionTypeCacheRecord> {
  @override
  final Iterable<Type> types = const [
    ActionTypeCacheRecord,
    _$ActionTypeCacheRecord
  ];
  @override
  final String wireName = 'ActionTypeCacheRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ActionTypeCacheRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.actionCache;
    if (value != null) {
      result
        ..add('actionCache')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.actionType;
    if (value != null) {
      result
        ..add('actionType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ActionTypeCacheRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActionTypeCacheRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'actionCache':
          result.actionCache = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'actionType':
          result.actionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$ActionTypeCacheRecord extends ActionTypeCacheRecord {
  @override
  final DocumentReference<Object> actionCache;
  @override
  final String actionType;
  @override
  final DateTime date;
  @override
  final DocumentReference<Object> reference;

  factory _$ActionTypeCacheRecord(
          [void Function(ActionTypeCacheRecordBuilder) updates]) =>
      (new ActionTypeCacheRecordBuilder()..update(updates)).build();

  _$ActionTypeCacheRecord._(
      {this.actionCache, this.actionType, this.date, this.reference})
      : super._();

  @override
  ActionTypeCacheRecord rebuild(
          void Function(ActionTypeCacheRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActionTypeCacheRecordBuilder toBuilder() =>
      new ActionTypeCacheRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActionTypeCacheRecord &&
        actionCache == other.actionCache &&
        actionType == other.actionType &&
        date == other.date &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, actionCache.hashCode), actionType.hashCode),
            date.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActionTypeCacheRecord')
          ..add('actionCache', actionCache)
          ..add('actionType', actionType)
          ..add('date', date)
          ..add('reference', reference))
        .toString();
  }
}

class ActionTypeCacheRecordBuilder
    implements Builder<ActionTypeCacheRecord, ActionTypeCacheRecordBuilder> {
  _$ActionTypeCacheRecord _$v;

  DocumentReference<Object> _actionCache;
  DocumentReference<Object> get actionCache => _$this._actionCache;
  set actionCache(DocumentReference<Object> actionCache) =>
      _$this._actionCache = actionCache;

  String _actionType;
  String get actionType => _$this._actionType;
  set actionType(String actionType) => _$this._actionType = actionType;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ActionTypeCacheRecordBuilder() {
    ActionTypeCacheRecord._initializeBuilder(this);
  }

  ActionTypeCacheRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actionCache = $v.actionCache;
      _actionType = $v.actionType;
      _date = $v.date;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActionTypeCacheRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActionTypeCacheRecord;
  }

  @override
  void update(void Function(ActionTypeCacheRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActionTypeCacheRecord build() {
    final _$result = _$v ??
        new _$ActionTypeCacheRecord._(
            actionCache: actionCache,
            actionType: actionType,
            date: date,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
