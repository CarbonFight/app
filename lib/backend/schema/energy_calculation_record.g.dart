// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_calculation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnergyCalculationRecord> _$energyCalculationRecordSerializer =
    new _$EnergyCalculationRecordSerializer();

class _$EnergyCalculationRecordSerializer
    implements StructuredSerializer<EnergyCalculationRecord> {
  @override
  final Iterable<Type> types = const [
    EnergyCalculationRecord,
    _$EnergyCalculationRecord
  ];
  @override
  final String wireName = 'EnergyCalculationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EnergyCalculationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.powertype;
    if (value != null) {
      result
        ..add('powertype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
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
    value = object.energy;
    if (value != null) {
      result
        ..add('energy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.defaultValue;
    if (value != null) {
      result
        ..add('defaultValue')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  EnergyCalculationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnergyCalculationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'powertype':
          result.powertype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'co2':
          result.co2 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'energy':
          result.energy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'defaultValue':
          result.defaultValue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$EnergyCalculationRecord extends EnergyCalculationRecord {
  @override
  final String? powertype;
  @override
  final String? country;
  @override
  final double? co2;
  @override
  final String? energy;
  @override
  final bool? defaultValue;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EnergyCalculationRecord(
          [void Function(EnergyCalculationRecordBuilder)? updates]) =>
      (new EnergyCalculationRecordBuilder()..update(updates))._build();

  _$EnergyCalculationRecord._(
      {this.powertype,
      this.country,
      this.co2,
      this.energy,
      this.defaultValue,
      this.ffRef})
      : super._();

  @override
  EnergyCalculationRecord rebuild(
          void Function(EnergyCalculationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnergyCalculationRecordBuilder toBuilder() =>
      new EnergyCalculationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnergyCalculationRecord &&
        powertype == other.powertype &&
        country == other.country &&
        co2 == other.co2 &&
        energy == other.energy &&
        defaultValue == other.defaultValue &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, powertype.hashCode), country.hashCode),
                    co2.hashCode),
                energy.hashCode),
            defaultValue.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnergyCalculationRecord')
          ..add('powertype', powertype)
          ..add('country', country)
          ..add('co2', co2)
          ..add('energy', energy)
          ..add('defaultValue', defaultValue)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EnergyCalculationRecordBuilder
    implements
        Builder<EnergyCalculationRecord, EnergyCalculationRecordBuilder> {
  _$EnergyCalculationRecord? _$v;

  String? _powertype;
  String? get powertype => _$this._powertype;
  set powertype(String? powertype) => _$this._powertype = powertype;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  double? _co2;
  double? get co2 => _$this._co2;
  set co2(double? co2) => _$this._co2 = co2;

  String? _energy;
  String? get energy => _$this._energy;
  set energy(String? energy) => _$this._energy = energy;

  bool? _defaultValue;
  bool? get defaultValue => _$this._defaultValue;
  set defaultValue(bool? defaultValue) => _$this._defaultValue = defaultValue;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EnergyCalculationRecordBuilder() {
    EnergyCalculationRecord._initializeBuilder(this);
  }

  EnergyCalculationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _powertype = $v.powertype;
      _country = $v.country;
      _co2 = $v.co2;
      _energy = $v.energy;
      _defaultValue = $v.defaultValue;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnergyCalculationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnergyCalculationRecord;
  }

  @override
  void update(void Function(EnergyCalculationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnergyCalculationRecord build() => _build();

  _$EnergyCalculationRecord _build() {
    final _$result = _$v ??
        new _$EnergyCalculationRecord._(
            powertype: powertype,
            country: country,
            co2: co2,
            energy: energy,
            defaultValue: defaultValue,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
