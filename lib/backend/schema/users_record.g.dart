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
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
    value = object.globalScore;
    if (value != null) {
      result
        ..add('global_score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.activity;
    if (value != null) {
      result
        ..add('activity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rank;
    if (value != null) {
      result
        ..add('rank')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rankSize;
    if (value != null) {
      result
        ..add('rank_size')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.co2target;
    if (value != null) {
      result
        ..add('co2target')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'global_score':
          result.globalScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activity':
          result.activity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rank':
          result.rank = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rank_size':
          result.rankSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'co2target':
          result.co2target = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$UsersRecord extends UsersRecord {
  @override
  final DateTime createdTime;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final int globalScore;
  @override
  final int level;
  @override
  final String phoneNumber;
  @override
  final String uid;
  @override
  final String photoUrl;
  @override
  final int activity;
  @override
  final int rank;
  @override
  final int rankSize;
  @override
  final int co2target;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.createdTime,
      this.displayName,
      this.email,
      this.globalScore,
      this.level,
      this.phoneNumber,
      this.uid,
      this.photoUrl,
      this.activity,
      this.rank,
      this.rankSize,
      this.co2target,
      this.reference})
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
        globalScore == other.globalScore &&
        level == other.level &&
        phoneNumber == other.phoneNumber &&
        uid == other.uid &&
        photoUrl == other.photoUrl &&
        activity == other.activity &&
        rank == other.rank &&
        rankSize == other.rankSize &&
        co2target == other.co2target &&
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(0,
                                                        createdTime.hashCode),
                                                    displayName.hashCode),
                                                email.hashCode),
                                            globalScore.hashCode),
                                        level.hashCode),
                                    phoneNumber.hashCode),
                                uid.hashCode),
                            photoUrl.hashCode),
                        activity.hashCode),
                    rank.hashCode),
                rankSize.hashCode),
            co2target.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('createdTime', createdTime)
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('globalScore', globalScore)
          ..add('level', level)
          ..add('phoneNumber', phoneNumber)
          ..add('uid', uid)
          ..add('photoUrl', photoUrl)
          ..add('activity', activity)
          ..add('rank', rank)
          ..add('rankSize', rankSize)
          ..add('co2target', co2target)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  int _globalScore;
  int get globalScore => _$this._globalScore;
  set globalScore(int globalScore) => _$this._globalScore = globalScore;

  int _level;
  int get level => _$this._level;
  set level(int level) => _$this._level = level;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  int _activity;
  int get activity => _$this._activity;
  set activity(int activity) => _$this._activity = activity;

  int _rank;
  int get rank => _$this._rank;
  set rank(int rank) => _$this._rank = rank;

  int _rankSize;
  int get rankSize => _$this._rankSize;
  set rankSize(int rankSize) => _$this._rankSize = rankSize;

  int _co2target;
  int get co2target => _$this._co2target;
  set co2target(int co2target) => _$this._co2target = co2target;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _displayName = $v.displayName;
      _email = $v.email;
      _globalScore = $v.globalScore;
      _level = $v.level;
      _phoneNumber = $v.phoneNumber;
      _uid = $v.uid;
      _photoUrl = $v.photoUrl;
      _activity = $v.activity;
      _rank = $v.rank;
      _rankSize = $v.rankSize;
      _co2target = $v.co2target;
      _reference = $v.reference;
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
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            createdTime: createdTime,
            displayName: displayName,
            email: email,
            globalScore: globalScore,
            level: level,
            phoneNumber: phoneNumber,
            uid: uid,
            photoUrl: photoUrl,
            activity: activity,
            rank: rank,
            rankSize: rankSize,
            co2target: co2target,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
