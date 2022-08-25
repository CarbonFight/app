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
  Iterable<Object?> serialize(
      Serializers serializers, TransportActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.transport;
    if (value != null) {
      result
        ..add('transport')
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
    value = object.periodicity;
    if (value != null) {
      result
        ..add('periodicity')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.roundTrip;
    if (value != null) {
      result
        ..add('roundTrip')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.distance;
    if (value != null) {
      result
        ..add('distance')
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
  TransportActionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransportActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'transport':
          result.transport = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'powertype':
          result.powertype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'co2e':
          result.co2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'passengers':
          result.passengers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'periodicity':
          result.periodicity.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'roundTrip':
          result.roundTrip = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isPeriodic':
          result.isPeriodic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'distance':
          result.distance = serializers.deserialize(value,
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

class _$TransportActionsRecord extends TransportActionsRecord {
  @override
  final String? transport;
  @override
  final String? powertype;
  @override
  final String? userId;
  @override
  final int? co2e;
  @override
  final DateTime? createdTime;
  @override
  final String? passengers;
  @override
  final String? day;
  @override
  final BuiltList<String>? periodicity;
  @override
  final bool? roundTrip;
  @override
  final bool? isPeriodic;
  @override
  final bool? isFavorite;
  @override
  final String? distance;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TransportActionsRecord(
          [void Function(TransportActionsRecordBuilder)? updates]) =>
      (new TransportActionsRecordBuilder()..update(updates))._build();

  _$TransportActionsRecord._(
      {this.transport,
      this.powertype,
      this.userId,
      this.co2e,
      this.createdTime,
      this.passengers,
      this.day,
      this.periodicity,
      this.roundTrip,
      this.isPeriodic,
      this.isFavorite,
      this.distance,
      this.ffRef})
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
        powertype == other.powertype &&
        userId == other.userId &&
        co2e == other.co2e &&
        createdTime == other.createdTime &&
        passengers == other.passengers &&
        day == other.day &&
        periodicity == other.periodicity &&
        roundTrip == other.roundTrip &&
        isPeriodic == other.isPeriodic &&
        isFavorite == other.isFavorite &&
        distance == other.distance &&
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
                                                $jc($jc(0, transport.hashCode),
                                                    powertype.hashCode),
                                                userId.hashCode),
                                            co2e.hashCode),
                                        createdTime.hashCode),
                                    passengers.hashCode),
                                day.hashCode),
                            periodicity.hashCode),
                        roundTrip.hashCode),
                    isPeriodic.hashCode),
                isFavorite.hashCode),
            distance.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransportActionsRecord')
          ..add('transport', transport)
          ..add('powertype', powertype)
          ..add('userId', userId)
          ..add('co2e', co2e)
          ..add('createdTime', createdTime)
          ..add('passengers', passengers)
          ..add('day', day)
          ..add('periodicity', periodicity)
          ..add('roundTrip', roundTrip)
          ..add('isPeriodic', isPeriodic)
          ..add('isFavorite', isFavorite)
          ..add('distance', distance)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TransportActionsRecordBuilder
    implements Builder<TransportActionsRecord, TransportActionsRecordBuilder> {
  _$TransportActionsRecord? _$v;

  String? _transport;
  String? get transport => _$this._transport;
  set transport(String? transport) => _$this._transport = transport;

  String? _powertype;
  String? get powertype => _$this._powertype;
  set powertype(String? powertype) => _$this._powertype = powertype;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  int? _co2e;
  int? get co2e => _$this._co2e;
  set co2e(int? co2e) => _$this._co2e = co2e;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _passengers;
  String? get passengers => _$this._passengers;
  set passengers(String? passengers) => _$this._passengers = passengers;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  ListBuilder<String>? _periodicity;
  ListBuilder<String> get periodicity =>
      _$this._periodicity ??= new ListBuilder<String>();
  set periodicity(ListBuilder<String>? periodicity) =>
      _$this._periodicity = periodicity;

  bool? _roundTrip;
  bool? get roundTrip => _$this._roundTrip;
  set roundTrip(bool? roundTrip) => _$this._roundTrip = roundTrip;

  bool? _isPeriodic;
  bool? get isPeriodic => _$this._isPeriodic;
  set isPeriodic(bool? isPeriodic) => _$this._isPeriodic = isPeriodic;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  String? _distance;
  String? get distance => _$this._distance;
  set distance(String? distance) => _$this._distance = distance;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TransportActionsRecordBuilder() {
    TransportActionsRecord._initializeBuilder(this);
  }

  TransportActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transport = $v.transport;
      _powertype = $v.powertype;
      _userId = $v.userId;
      _co2e = $v.co2e;
      _createdTime = $v.createdTime;
      _passengers = $v.passengers;
      _day = $v.day;
      _periodicity = $v.periodicity?.toBuilder();
      _roundTrip = $v.roundTrip;
      _isPeriodic = $v.isPeriodic;
      _isFavorite = $v.isFavorite;
      _distance = $v.distance;
      _ffRef = $v.ffRef;
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
  void update(void Function(TransportActionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransportActionsRecord build() => _build();

  _$TransportActionsRecord _build() {
    _$TransportActionsRecord _$result;
    try {
      _$result = _$v ??
          new _$TransportActionsRecord._(
              transport: transport,
              powertype: powertype,
              userId: userId,
              co2e: co2e,
              createdTime: createdTime,
              passengers: passengers,
              day: day,
              periodicity: _periodicity?.build(),
              roundTrip: roundTrip,
              isPeriodic: isPeriodic,
              isFavorite: isFavorite,
              distance: distance,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'periodicity';
        _periodicity?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TransportActionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
