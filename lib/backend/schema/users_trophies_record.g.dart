// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_trophies_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersTrophiesRecord> _$usersTrophiesRecordSerializer =
    new _$UsersTrophiesRecordSerializer();

class _$UsersTrophiesRecordSerializer
    implements StructuredSerializer<UsersTrophiesRecord> {
  @override
  final Iterable<Type> types = const [
    UsersTrophiesRecord,
    _$UsersTrophiesRecord
  ];
  @override
  final String wireName = 'UsersTrophiesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UsersTrophiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasStart;
    if (value != null) {
      result
        ..add('hasStart')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasParams;
    if (value != null) {
      result
        ..add('hasParams')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasGoals;
    if (value != null) {
      result
        ..add('hasGoals')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has3Periodics;
    if (value != null) {
      result
        ..add('has3Periodics')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has50Actions;
    if (value != null) {
      result
        ..add('has50Actions')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has7DaysStreak;
    if (value != null) {
      result
        ..add('has7DaysStreak')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has2Invites;
    if (value != null) {
      result
        ..add('has2Invites')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has5Likes;
    if (value != null) {
      result
        ..add('has5Likes')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasReviewApp;
    if (value != null) {
      result
        ..add('hasReviewApp')
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
  UsersTrophiesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersTrophiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasStart':
          result.hasStart = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasParams':
          result.hasParams = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasGoals':
          result.hasGoals = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has3Periodics':
          result.has3Periodics = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has50Actions':
          result.has50Actions = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has7DaysStreak':
          result.has7DaysStreak = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has2Invites':
          result.has2Invites = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has5Likes':
          result.has5Likes = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasReviewApp':
          result.hasReviewApp = serializers.deserialize(value,
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

class _$UsersTrophiesRecord extends UsersTrophiesRecord {
  @override
  final String? uid;
  @override
  final bool? hasStart;
  @override
  final bool? hasParams;
  @override
  final bool? hasGoals;
  @override
  final bool? has3Periodics;
  @override
  final bool? has50Actions;
  @override
  final bool? has7DaysStreak;
  @override
  final bool? has2Invites;
  @override
  final bool? has5Likes;
  @override
  final bool? hasReviewApp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersTrophiesRecord(
          [void Function(UsersTrophiesRecordBuilder)? updates]) =>
      (new UsersTrophiesRecordBuilder()..update(updates))._build();

  _$UsersTrophiesRecord._(
      {this.uid,
      this.hasStart,
      this.hasParams,
      this.hasGoals,
      this.has3Periodics,
      this.has50Actions,
      this.has7DaysStreak,
      this.has2Invites,
      this.has5Likes,
      this.hasReviewApp,
      this.ffRef})
      : super._();

  @override
  UsersTrophiesRecord rebuild(
          void Function(UsersTrophiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersTrophiesRecordBuilder toBuilder() =>
      new UsersTrophiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersTrophiesRecord &&
        uid == other.uid &&
        hasStart == other.hasStart &&
        hasParams == other.hasParams &&
        hasGoals == other.hasGoals &&
        has3Periodics == other.has3Periodics &&
        has50Actions == other.has50Actions &&
        has7DaysStreak == other.has7DaysStreak &&
        has2Invites == other.has2Invites &&
        has5Likes == other.has5Likes &&
        hasReviewApp == other.hasReviewApp &&
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
                                        $jc($jc(0, uid.hashCode),
                                            hasStart.hashCode),
                                        hasParams.hashCode),
                                    hasGoals.hashCode),
                                has3Periodics.hashCode),
                            has50Actions.hashCode),
                        has7DaysStreak.hashCode),
                    has2Invites.hashCode),
                has5Likes.hashCode),
            hasReviewApp.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersTrophiesRecord')
          ..add('uid', uid)
          ..add('hasStart', hasStart)
          ..add('hasParams', hasParams)
          ..add('hasGoals', hasGoals)
          ..add('has3Periodics', has3Periodics)
          ..add('has50Actions', has50Actions)
          ..add('has7DaysStreak', has7DaysStreak)
          ..add('has2Invites', has2Invites)
          ..add('has5Likes', has5Likes)
          ..add('hasReviewApp', hasReviewApp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersTrophiesRecordBuilder
    implements Builder<UsersTrophiesRecord, UsersTrophiesRecordBuilder> {
  _$UsersTrophiesRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  bool? _hasStart;
  bool? get hasStart => _$this._hasStart;
  set hasStart(bool? hasStart) => _$this._hasStart = hasStart;

  bool? _hasParams;
  bool? get hasParams => _$this._hasParams;
  set hasParams(bool? hasParams) => _$this._hasParams = hasParams;

  bool? _hasGoals;
  bool? get hasGoals => _$this._hasGoals;
  set hasGoals(bool? hasGoals) => _$this._hasGoals = hasGoals;

  bool? _has3Periodics;
  bool? get has3Periodics => _$this._has3Periodics;
  set has3Periodics(bool? has3Periodics) =>
      _$this._has3Periodics = has3Periodics;

  bool? _has50Actions;
  bool? get has50Actions => _$this._has50Actions;
  set has50Actions(bool? has50Actions) => _$this._has50Actions = has50Actions;

  bool? _has7DaysStreak;
  bool? get has7DaysStreak => _$this._has7DaysStreak;
  set has7DaysStreak(bool? has7DaysStreak) =>
      _$this._has7DaysStreak = has7DaysStreak;

  bool? _has2Invites;
  bool? get has2Invites => _$this._has2Invites;
  set has2Invites(bool? has2Invites) => _$this._has2Invites = has2Invites;

  bool? _has5Likes;
  bool? get has5Likes => _$this._has5Likes;
  set has5Likes(bool? has5Likes) => _$this._has5Likes = has5Likes;

  bool? _hasReviewApp;
  bool? get hasReviewApp => _$this._hasReviewApp;
  set hasReviewApp(bool? hasReviewApp) => _$this._hasReviewApp = hasReviewApp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersTrophiesRecordBuilder() {
    UsersTrophiesRecord._initializeBuilder(this);
  }

  UsersTrophiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _hasStart = $v.hasStart;
      _hasParams = $v.hasParams;
      _hasGoals = $v.hasGoals;
      _has3Periodics = $v.has3Periodics;
      _has50Actions = $v.has50Actions;
      _has7DaysStreak = $v.has7DaysStreak;
      _has2Invites = $v.has2Invites;
      _has5Likes = $v.has5Likes;
      _hasReviewApp = $v.hasReviewApp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersTrophiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersTrophiesRecord;
  }

  @override
  void update(void Function(UsersTrophiesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersTrophiesRecord build() => _build();

  _$UsersTrophiesRecord _build() {
    final _$result = _$v ??
        new _$UsersTrophiesRecord._(
            uid: uid,
            hasStart: hasStart,
            hasParams: hasParams,
            hasGoals: hasGoals,
            has3Periodics: has3Periodics,
            has50Actions: has50Actions,
            has7DaysStreak: has7DaysStreak,
            has2Invites: has2Invites,
            has5Likes: has5Likes,
            hasReviewApp: hasReviewApp,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
