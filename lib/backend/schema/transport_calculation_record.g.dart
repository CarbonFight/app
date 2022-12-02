// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_calculation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransportCalculationRecord> _$transportCalculationRecordSerializer =
    new _$TransportCalculationRecordSerializer();

class _$TransportCalculationRecordSerializer
    implements StructuredSerializer<TransportCalculationRecord> {
  @override
  final Iterable<Type> types = const [
    TransportCalculationRecord,
    _$TransportCalculationRecord
  ];
  @override
  final String wireName = 'TransportCalculationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TransportCalculationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.country;
    if (value != null) {
      result
        ..add('country')
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
    value = object.transport;
    if (value != null) {
      result
        ..add('transport')
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
  TransportCalculationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransportCalculationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'powertype':
          result.powertype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transport':
          result.transport = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'co2':
          result.co2 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$TransportCalculationRecord extends TransportCalculationRecord {
  @override
  final String? country;
  @override
  final String? powertype;
  @override
  final String? transport;
  @override
  final double? co2;
  @override
  final bool? defaultValue;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TransportCalculationRecord(
          [void Function(TransportCalculationRecordBuilder)? updates]) =>
      (new TransportCalculationRecordBuilder()..update(updates))._build();

  _$TransportCalculationRecord._(
      {this.country,
      this.powertype,
      this.transport,
      this.co2,
      this.defaultValue,
      this.ffRef})
      : super._();

  @override
  TransportCalculationRecord rebuild(
          void Function(TransportCalculationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransportCalculationRecordBuilder toBuilder() =>
      new TransportCalculationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransportCalculationRecord &&
        country == other.country &&
        powertype == other.powertype &&
        transport == other.transport &&
        co2 == other.co2 &&
        defaultValue == other.defaultValue &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, country.hashCode), powertype.hashCode),
                    transport.hashCode),
                co2.hashCode),
            defaultValue.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransportCalculationRecord')
          ..add('country', country)
          ..add('powertype', powertype)
          ..add('transport', transport)
          ..add('co2', co2)
          ..add('defaultValue', defaultValue)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TransportCalculationRecordBuilder
    implements
        Builder<TransportCalculationRecord, TransportCalculationRecordBuilder> {
  _$TransportCalculationRecord? _$v;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _powertype;
  String? get powertype => _$this._powertype;
  set powertype(String? powertype) => _$this._powertype = powertype;

  String? _transport;
  String? get transport => _$this._transport;
  set transport(String? transport) => _$this._transport = transport;

  double? _co2;
  double? get co2 => _$this._co2;
  set co2(double? co2) => _$this._co2 = co2;

  bool? _defaultValue;
  bool? get defaultValue => _$this._defaultValue;
  set defaultValue(bool? defaultValue) => _$this._defaultValue = defaultValue;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TransportCalculationRecordBuilder() {
    TransportCalculationRecord._initializeBuilder(this);
  }

  TransportCalculationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _country = $v.country;
      _powertype = $v.powertype;
      _transport = $v.transport;
      _co2 = $v.co2;
      _defaultValue = $v.defaultValue;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransportCalculationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransportCalculationRecord;
  }

  @override
  void update(void Function(TransportCalculationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransportCalculationRecord build() => _build();

  _$TransportCalculationRecord _build() {
    final _$result = _$v ??
        new _$TransportCalculationRecord._(
            country: country,
            powertype: powertype,
            transport: transport,
            co2: co2,
            defaultValue: defaultValue,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
