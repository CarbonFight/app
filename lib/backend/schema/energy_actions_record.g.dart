// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_actions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnergyActionsRecord> _$energyActionsRecordSerializer =
    new _$EnergyActionsRecordSerializer();

class _$EnergyActionsRecordSerializer
    implements StructuredSerializer<EnergyActionsRecord> {
  @override
  final Iterable<Type> types = const [
    EnergyActionsRecord,
    _$EnergyActionsRecord
  ];
  @override
  final String wireName = 'EnergyActionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EnergyActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.peopleSharing;
    if (value != null) {
      result
        ..add('peopleSharing')
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
    value = object.isPeriodic;
    if (value != null) {
      result
        ..add('isPeriodic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.volume;
    if (value != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isNew;
    if (value != null) {
      result
        ..add('isNew')
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
  EnergyActionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnergyActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'energy':
          result.energy = serializers.deserialize(value,
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
        case 'peopleSharing':
          result.peopleSharing = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isPeriodic':
          result.isPeriodic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isNew':
          result.isNew = serializers.deserialize(value,
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

class _$EnergyActionsRecord extends EnergyActionsRecord {
  @override
  final String? energy;
  @override
  final String? powertype;
  @override
  final String? userId;
  @override
  final int? co2e;
  @override
  final DateTime? createdTime;
  @override
  final String? peopleSharing;
  @override
  final String? day;
  @override
  final bool? isPeriodic;
  @override
  final String? volume;
  @override
  final bool? isNew;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EnergyActionsRecord(
          [void Function(EnergyActionsRecordBuilder)? updates]) =>
      (new EnergyActionsRecordBuilder()..update(updates))._build();

  _$EnergyActionsRecord._(
      {this.energy,
      this.powertype,
      this.userId,
      this.co2e,
      this.createdTime,
      this.peopleSharing,
      this.day,
      this.isPeriodic,
      this.volume,
      this.isNew,
      this.ffRef})
      : super._();

  @override
  EnergyActionsRecord rebuild(
          void Function(EnergyActionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnergyActionsRecordBuilder toBuilder() =>
      new EnergyActionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnergyActionsRecord &&
        energy == other.energy &&
        powertype == other.powertype &&
        userId == other.userId &&
        co2e == other.co2e &&
        createdTime == other.createdTime &&
        peopleSharing == other.peopleSharing &&
        day == other.day &&
        isPeriodic == other.isPeriodic &&
        volume == other.volume &&
        isNew == other.isNew &&
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
                                        $jc($jc(0, energy.hashCode),
                                            powertype.hashCode),
                                        userId.hashCode),
                                    co2e.hashCode),
                                createdTime.hashCode),
                            peopleSharing.hashCode),
                        day.hashCode),
                    isPeriodic.hashCode),
                volume.hashCode),
            isNew.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnergyActionsRecord')
          ..add('energy', energy)
          ..add('powertype', powertype)
          ..add('userId', userId)
          ..add('co2e', co2e)
          ..add('createdTime', createdTime)
          ..add('peopleSharing', peopleSharing)
          ..add('day', day)
          ..add('isPeriodic', isPeriodic)
          ..add('volume', volume)
          ..add('isNew', isNew)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EnergyActionsRecordBuilder
    implements Builder<EnergyActionsRecord, EnergyActionsRecordBuilder> {
  _$EnergyActionsRecord? _$v;

  String? _energy;
  String? get energy => _$this._energy;
  set energy(String? energy) => _$this._energy = energy;

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

  String? _peopleSharing;
  String? get peopleSharing => _$this._peopleSharing;
  set peopleSharing(String? peopleSharing) =>
      _$this._peopleSharing = peopleSharing;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  bool? _isPeriodic;
  bool? get isPeriodic => _$this._isPeriodic;
  set isPeriodic(bool? isPeriodic) => _$this._isPeriodic = isPeriodic;

  String? _volume;
  String? get volume => _$this._volume;
  set volume(String? volume) => _$this._volume = volume;

  bool? _isNew;
  bool? get isNew => _$this._isNew;
  set isNew(bool? isNew) => _$this._isNew = isNew;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EnergyActionsRecordBuilder() {
    EnergyActionsRecord._initializeBuilder(this);
  }

  EnergyActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _energy = $v.energy;
      _powertype = $v.powertype;
      _userId = $v.userId;
      _co2e = $v.co2e;
      _createdTime = $v.createdTime;
      _peopleSharing = $v.peopleSharing;
      _day = $v.day;
      _isPeriodic = $v.isPeriodic;
      _volume = $v.volume;
      _isNew = $v.isNew;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnergyActionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnergyActionsRecord;
  }

  @override
  void update(void Function(EnergyActionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnergyActionsRecord build() => _build();

  _$EnergyActionsRecord _build() {
    final _$result = _$v ??
        new _$EnergyActionsRecord._(
            energy: energy,
            powertype: powertype,
            userId: userId,
            co2e: co2e,
            createdTime: createdTime,
            peopleSharing: peopleSharing,
            day: day,
            isPeriodic: isPeriodic,
            volume: volume,
            isNew: isNew,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
