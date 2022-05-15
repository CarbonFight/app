// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_periodics_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransportPeriodicsRecord> _$transportPeriodicsRecordSerializer =
    new _$TransportPeriodicsRecordSerializer();

class _$TransportPeriodicsRecordSerializer
    implements StructuredSerializer<TransportPeriodicsRecord> {
  @override
  final Iterable<Type> types = const [
    TransportPeriodicsRecord,
    _$TransportPeriodicsRecord
  ];
  @override
  final String wireName = 'TransportPeriodicsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TransportPeriodicsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.periodicity;
    if (value != null) {
      result
        ..add('periodicity')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  TransportPeriodicsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransportPeriodicsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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
        case 'periodicity':
          result.periodicity.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$TransportPeriodicsRecord extends TransportPeriodicsRecord {
  @override
  final String uid;
  @override
  final String transport;
  @override
  final int distance;
  @override
  final String powertype;
  @override
  final String ownership;
  @override
  final int co2e;
  @override
  final DateTime createdTime;
  @override
  final String passengers;
  @override
  final BuiltList<String> periodicity;
  @override
  final DocumentReference<Object> reference;

  factory _$TransportPeriodicsRecord(
          [void Function(TransportPeriodicsRecordBuilder) updates]) =>
      (new TransportPeriodicsRecordBuilder()..update(updates)).build();

  _$TransportPeriodicsRecord._(
      {this.uid,
      this.transport,
      this.distance,
      this.powertype,
      this.ownership,
      this.co2e,
      this.createdTime,
      this.passengers,
      this.periodicity,
      this.reference})
      : super._();

  @override
  TransportPeriodicsRecord rebuild(
          void Function(TransportPeriodicsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransportPeriodicsRecordBuilder toBuilder() =>
      new TransportPeriodicsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransportPeriodicsRecord &&
        uid == other.uid &&
        transport == other.transport &&
        distance == other.distance &&
        powertype == other.powertype &&
        ownership == other.ownership &&
        co2e == other.co2e &&
        createdTime == other.createdTime &&
        passengers == other.passengers &&
        periodicity == other.periodicity &&
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
                                    $jc($jc(0, uid.hashCode),
                                        transport.hashCode),
                                    distance.hashCode),
                                powertype.hashCode),
                            ownership.hashCode),
                        co2e.hashCode),
                    createdTime.hashCode),
                passengers.hashCode),
            periodicity.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransportPeriodicsRecord')
          ..add('uid', uid)
          ..add('transport', transport)
          ..add('distance', distance)
          ..add('powertype', powertype)
          ..add('ownership', ownership)
          ..add('co2e', co2e)
          ..add('createdTime', createdTime)
          ..add('passengers', passengers)
          ..add('periodicity', periodicity)
          ..add('reference', reference))
        .toString();
  }
}

class TransportPeriodicsRecordBuilder
    implements
        Builder<TransportPeriodicsRecord, TransportPeriodicsRecordBuilder> {
  _$TransportPeriodicsRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

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

  int _co2e;
  int get co2e => _$this._co2e;
  set co2e(int co2e) => _$this._co2e = co2e;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _passengers;
  String get passengers => _$this._passengers;
  set passengers(String passengers) => _$this._passengers = passengers;

  ListBuilder<String> _periodicity;
  ListBuilder<String> get periodicity =>
      _$this._periodicity ??= new ListBuilder<String>();
  set periodicity(ListBuilder<String> periodicity) =>
      _$this._periodicity = periodicity;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TransportPeriodicsRecordBuilder() {
    TransportPeriodicsRecord._initializeBuilder(this);
  }

  TransportPeriodicsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _transport = $v.transport;
      _distance = $v.distance;
      _powertype = $v.powertype;
      _ownership = $v.ownership;
      _co2e = $v.co2e;
      _createdTime = $v.createdTime;
      _passengers = $v.passengers;
      _periodicity = $v.periodicity?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransportPeriodicsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransportPeriodicsRecord;
  }

  @override
  void update(void Function(TransportPeriodicsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransportPeriodicsRecord build() {
    _$TransportPeriodicsRecord _$result;
    try {
      _$result = _$v ??
          new _$TransportPeriodicsRecord._(
              uid: uid,
              transport: transport,
              distance: distance,
              powertype: powertype,
              ownership: ownership,
              co2e: co2e,
              createdTime: createdTime,
              passengers: passengers,
              periodicity: _periodicity?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'periodicity';
        _periodicity?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TransportPeriodicsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
