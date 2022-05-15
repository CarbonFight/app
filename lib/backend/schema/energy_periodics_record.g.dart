// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_periodics_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnergyPeriodicsRecord> _$energyPeriodicsRecordSerializer =
    new _$EnergyPeriodicsRecordSerializer();

class _$EnergyPeriodicsRecordSerializer
    implements StructuredSerializer<EnergyPeriodicsRecord> {
  @override
  final Iterable<Type> types = const [
    EnergyPeriodicsRecord,
    _$EnergyPeriodicsRecord
  ];
  @override
  final String wireName = 'EnergyPeriodicsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, EnergyPeriodicsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.co2e;
    if (value != null) {
      result
        ..add('co2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.energy;
    if (value != null) {
      result
        ..add('energy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.powertype;
    if (value != null) {
      result
        ..add('powertype')
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
    value = object.volume;
    if (value != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.peopleSharing;
    if (value != null) {
      result
        ..add('peopleSharing')
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
  EnergyPeriodicsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnergyPeriodicsRecordBuilder();

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
        case 'energy':
          result.energy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'powertype':
          result.powertype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'peopleSharing':
          result.peopleSharing = serializers.deserialize(value,
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

class _$EnergyPeriodicsRecord extends EnergyPeriodicsRecord {
  @override
  final int co2e;
  @override
  final String energy;
  @override
  final String powertype;
  @override
  final String userId;
  @override
  final int volume;
  @override
  final String peopleSharing;
  @override
  final DocumentReference<Object> reference;

  factory _$EnergyPeriodicsRecord(
          [void Function(EnergyPeriodicsRecordBuilder) updates]) =>
      (new EnergyPeriodicsRecordBuilder()..update(updates)).build();

  _$EnergyPeriodicsRecord._(
      {this.co2e,
      this.energy,
      this.powertype,
      this.userId,
      this.volume,
      this.peopleSharing,
      this.reference})
      : super._();

  @override
  EnergyPeriodicsRecord rebuild(
          void Function(EnergyPeriodicsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnergyPeriodicsRecordBuilder toBuilder() =>
      new EnergyPeriodicsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnergyPeriodicsRecord &&
        co2e == other.co2e &&
        energy == other.energy &&
        powertype == other.powertype &&
        userId == other.userId &&
        volume == other.volume &&
        peopleSharing == other.peopleSharing &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, co2e.hashCode), energy.hashCode),
                        powertype.hashCode),
                    userId.hashCode),
                volume.hashCode),
            peopleSharing.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnergyPeriodicsRecord')
          ..add('co2e', co2e)
          ..add('energy', energy)
          ..add('powertype', powertype)
          ..add('userId', userId)
          ..add('volume', volume)
          ..add('peopleSharing', peopleSharing)
          ..add('reference', reference))
        .toString();
  }
}

class EnergyPeriodicsRecordBuilder
    implements Builder<EnergyPeriodicsRecord, EnergyPeriodicsRecordBuilder> {
  _$EnergyPeriodicsRecord _$v;

  int _co2e;
  int get co2e => _$this._co2e;
  set co2e(int co2e) => _$this._co2e = co2e;

  String _energy;
  String get energy => _$this._energy;
  set energy(String energy) => _$this._energy = energy;

  String _powertype;
  String get powertype => _$this._powertype;
  set powertype(String powertype) => _$this._powertype = powertype;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  int _volume;
  int get volume => _$this._volume;
  set volume(int volume) => _$this._volume = volume;

  String _peopleSharing;
  String get peopleSharing => _$this._peopleSharing;
  set peopleSharing(String peopleSharing) =>
      _$this._peopleSharing = peopleSharing;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EnergyPeriodicsRecordBuilder() {
    EnergyPeriodicsRecord._initializeBuilder(this);
  }

  EnergyPeriodicsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _co2e = $v.co2e;
      _energy = $v.energy;
      _powertype = $v.powertype;
      _userId = $v.userId;
      _volume = $v.volume;
      _peopleSharing = $v.peopleSharing;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnergyPeriodicsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnergyPeriodicsRecord;
  }

  @override
  void update(void Function(EnergyPeriodicsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EnergyPeriodicsRecord build() {
    final _$result = _$v ??
        new _$EnergyPeriodicsRecord._(
            co2e: co2e,
            energy: energy,
            powertype: powertype,
            userId: userId,
            volume: volume,
            peopleSharing: peopleSharing,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
