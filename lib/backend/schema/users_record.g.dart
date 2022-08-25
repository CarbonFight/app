// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.co2target;
    if (value != null) {
      result
        ..add('co2target')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPoints;
    if (value != null) {
      result
        ..add('totalPoints')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.globalScore;
    if (value != null) {
      result
        ..add('globalScore')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.globalProjection;
    if (value != null) {
      result
        ..add('globalProjection')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'co2target':
          result.co2target = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'totalPoints':
          result.totalPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'globalScore':
          result.globalScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'globalProjection':
          result.globalProjection = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UsersRecord extends UsersRecord {
  @override
  final DateTime? createdTime;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? uid;
  @override
  final String? photoUrl;
  @override
  final int? co2target;
  @override
  final int? totalPoints;
  @override
  final int? globalScore;
  @override
  final int? globalProjection;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.createdTime,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.uid,
      this.photoUrl,
      this.co2target,
      this.totalPoints,
      this.globalScore,
      this.globalProjection,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        createdTime == other.createdTime &&
        displayName == other.displayName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        uid == other.uid &&
        photoUrl == other.photoUrl &&
        co2target == other.co2target &&
        totalPoints == other.totalPoints &&
        globalScore == other.globalScore &&
        globalProjection == other.globalProjection &&
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
                                        $jc($jc(0, createdTime.hashCode),
                                            displayName.hashCode),
                                        email.hashCode),
                                    phoneNumber.hashCode),
                                uid.hashCode),
                            photoUrl.hashCode),
                        co2target.hashCode),
                    totalPoints.hashCode),
                globalScore.hashCode),
            globalProjection.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('createdTime', createdTime)
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('uid', uid)
          ..add('photoUrl', photoUrl)
          ..add('co2target', co2target)
          ..add('totalPoints', totalPoints)
          ..add('globalScore', globalScore)
          ..add('globalProjection', globalProjection)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  int? _co2target;
  int? get co2target => _$this._co2target;
  set co2target(int? co2target) => _$this._co2target = co2target;

  int? _totalPoints;
  int? get totalPoints => _$this._totalPoints;
  set totalPoints(int? totalPoints) => _$this._totalPoints = totalPoints;

  int? _globalScore;
  int? get globalScore => _$this._globalScore;
  set globalScore(int? globalScore) => _$this._globalScore = globalScore;

  int? _globalProjection;
  int? get globalProjection => _$this._globalProjection;
  set globalProjection(int? globalProjection) =>
      _$this._globalProjection = globalProjection;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _displayName = $v.displayName;
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _uid = $v.uid;
      _photoUrl = $v.photoUrl;
      _co2target = $v.co2target;
      _totalPoints = $v.totalPoints;
      _globalScore = $v.globalScore;
      _globalProjection = $v.globalProjection;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            createdTime: createdTime,
            displayName: displayName,
            email: email,
            phoneNumber: phoneNumber,
            uid: uid,
            photoUrl: photoUrl,
            co2target: co2target,
            totalPoints: totalPoints,
            globalScore: globalScore,
            globalProjection: globalProjection,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
