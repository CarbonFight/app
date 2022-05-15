// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_actions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransportActionsRecord> _$transportActionsRecordSerializer =
    new _$TransportActionsRecordSerializer();

class _$TransportActionsRecordSerializer
    implements StructuredSerializer<TransportActionsRecord> {
  @override
  final Iterable<Type> types = const [
    TransportActionsRecord,
    _$TransportActionsRecord
  ];
  @override
  final String wireName = 'TransportActionsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TransportActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.transport;
    if (value != null) {
      result
        ..add('transport')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.distance;
    if (value != null) {
      result
        ..add('distance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.powertype;
    if (value != null) {
      result
        ..add('powertype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownership;
    if (value != null) {
      result
        ..add('ownership')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.co2e;
    if (value != null) {
      result
        ..add('co2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.passengers;
    if (value != null) {
      result
        ..add('passengers')
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
  TransportActionsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransportActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'transport':
          result.transport = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'distance':
          result.distance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'powertype':
          result.powertype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownership':
          result.ownership = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'co2e':
          result.co2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'passengers':
          result.passengers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$TransportActionsRecord extends TransportActionsRecord {
  @override
  final String transport;
  @override
  final int distance;
  @override
  final String powertype;
  @override
  final String ownership;
  @override
  final String userId;
  @override
  final int co2e;
  @override
  final DateTime createdTime;
  @override
  final String passengers;
  @override
  final String day;
  @override
  final DocumentReference<Object> reference;

  factory _$TransportActionsRecord(
          [void Function(TransportActionsRecordBuilder) updates]) =>
      (new TransportActionsRecordBuilder()..update(updates)).build();

  _$TransportActionsRecord._(
      {this.transport,
      this.distance,
      this.powertype,
      this.ownership,
      this.userId,
      this.co2e,
      this.createdTime,
      this.passengers,
      this.day,
      this.reference})
      : super._();

  @override
  TransportActionsRecord rebuild(
          void Function(TransportActionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransportActionsRecordBuilder toBuilder() =>
      new TransportActionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransportActionsRecord &&
        transport == other.transport &&
        distance == other.distance &&
        powertype == other.powertype &&
        ownership == other.ownership &&
        userId == other.userId &&
        co2e == other.co2e &&
        createdTime == other.createdTime &&
        passengers == other.passengers &&
        day == other.day &&
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
                                    $jc($jc(0, transport.hashCode),
                                        distance.hashCode),
                                    powertype.hashCode),
                                ownership.hashCode),
                            userId.hashCode),
                        co2e.hashCode),
                    createdTime.hashCode),
                passengers.hashCode),
            day.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransportActionsRecord')
          ..add('transport', transport)
          ..add('distance', distance)
          ..add('powertype', powertype)
          ..add('ownership', ownership)
          ..add('userId', userId)
          ..add('co2e', co2e)
          ..add('createdTime', createdTime)
          ..add('passengers', passengers)
          ..add('day', day)
          ..add('reference', reference))
        .toString();
  }
}

class TransportActionsRecordBuilder
    implements Builder<TransportActionsRecord, TransportActionsRecordBuilder> {
  _$TransportActionsRecord _$v;

  String _transport;
  String get transport => _$this._transport;
  set transport(String transport) => _$this._transport = transport;

  int _distance;
  int get distance => _$this._distance;
  set distance(int distance) => _$this._distance = distance;

  String _powertype;
  String get powertype => _$this._powertype;
  set powertype(String powertype) => _$this._powertype = powertype;

  String _ownership;
  String get ownership => _$this._ownership;
  set ownership(String ownership) => _$this._ownership = ownership;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  int _co2e;
  int get co2e => _$this._co2e;
  set co2e(int co2e) => _$this._co2e = co2e;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _passengers;
  String get passengers => _$this._passengers;
  set passengers(String passengers) => _$this._passengers = passengers;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TransportActionsRecordBuilder() {
    TransportActionsRecord._initializeBuilder(this);
  }

  TransportActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transport = $v.transport;
      _distance = $v.distance;
      _powertype = $v.powertype;
      _ownership = $v.ownership;
      _userId = $v.userId;
      _co2e = $v.co2e;
      _createdTime = $v.createdTime;
      _passengers = $v.passengers;
      _day = $v.day;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransportActionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransportActionsRecord;
  }

  @override
  void update(void Function(TransportActionsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransportActionsRecord build() {
    final _$result = _$v ??
        new _$TransportActionsRecord._(
            transport: transport,
            distance: distance,
            powertype: powertype,
            ownership: ownership,
            userId: userId,
            co2e: co2e,
            createdTime: createdTime,
            passengers: passengers,
            day: day,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
