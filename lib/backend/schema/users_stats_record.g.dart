// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_stats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersStatsRecord> _$usersStatsRecordSerializer =
    new _$UsersStatsRecordSerializer();

class _$UsersStatsRecordSerializer
    implements StructuredSerializer<UsersStatsRecord> {
  @override
  final Iterable<Type> types = const [UsersStatsRecord, _$UsersStatsRecord];
  @override
  final String wireName = 'UsersStatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersStatsRecord object,
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
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.weeks;
    if (value != null) {
      result
        ..add('weeks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.months;
    if (value != null) {
      result
        ..add('months')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.daysChart;
    if (value != null) {
      result
        ..add('daysChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.weeksChart;
    if (value != null) {
      result
        ..add('weeksChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.monthsChart;
    if (value != null) {
      result
        ..add('monthsChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.co2target;
    if (value != null) {
      result
        ..add('co2target')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.daysStreak;
    if (value != null) {
      result
        ..add('daysStreak')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.trophy50Actions;
    if (value != null) {
      result
        ..add('trophy50Actions')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.trophy50Actions3Periodics;
    if (value != null) {
      result
        ..add('trophy50Actions3Periodics')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.trophy50ActionsStart;
    if (value != null) {
      result
        ..add('trophy50ActionsStart')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.trophy50ActionsGoals;
    if (value != null) {
      result
        ..add('trophy50ActionsGoals')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.trophy50Actions7DaysStreak;
    if (value != null) {
      result
        ..add('trophy50Actions7DaysStreak')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.trophiesPoints;
    if (value != null) {
      result
        ..add('trophiesPoints')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.allActionsCount;
    if (value != null) {
      result
        ..add('allActionsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.allPeriodicsCO2e;
    if (value != null) {
      result
        ..add('allPeriodicsCO2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.allPeriodicsCount;
    if (value != null) {
      result
        ..add('allPeriodicsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodActionsDayCO2e;
    if (value != null) {
      result
        ..add('foodActionsDayCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.foodActionsWeekCO2e;
    if (value != null) {
      result
        ..add('foodActionsWeekCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.foodActionsMonthCO2e;
    if (value != null) {
      result
        ..add('foodActionsMonthCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.foodActionsCount;
    if (value != null) {
      result
        ..add('foodActionsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodPeriodicsCO2e;
    if (value != null) {
      result
        ..add('foodPeriodicsCO2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodPeriodicsCount;
    if (value != null) {
      result
        ..add('foodPeriodicsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.energyActionsDayCO2e;
    if (value != null) {
      result
        ..add('energyActionsDayCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.energyActionsWeekCO2e;
    if (value != null) {
      result
        ..add('energyActionsWeekCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.energyActionsMonthCO2e;
    if (value != null) {
      result
        ..add('energyActionsMonthCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.energyActionsCount;
    if (value != null) {
      result
        ..add('energyActionsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.energyPeriodicsCO2e;
    if (value != null) {
      result
        ..add('energyPeriodicsCO2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.energyPeriodicsCount;
    if (value != null) {
      result
        ..add('energyPeriodicsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transportActionsDayCO2e;
    if (value != null) {
      result
        ..add('transportActionsDayCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.transportActionsWeekCO2e;
    if (value != null) {
      result
        ..add('transportActionsWeekCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.transportActionsMonthCO2e;
    if (value != null) {
      result
        ..add('transportActionsMonthCO2e')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.transportActionsCount;
    if (value != null) {
      result
        ..add('transportActionsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transportPeriodicsCO2e;
    if (value != null) {
      result
        ..add('transportPeriodicsCO2e')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transportPeriodicsCount;
    if (value != null) {
      result
        ..add('transportPeriodicsCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodActionsDayCO2eChart;
    if (value != null) {
      result
        ..add('foodActionsDayCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.foodActionsWeekCO2eChart;
    if (value != null) {
      result
        ..add('foodActionsWeekCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.foodActionsMonthCO2eChart;
    if (value != null) {
      result
        ..add('foodActionsMonthCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.energyActionsDayCO2eChart;
    if (value != null) {
      result
        ..add('energyActionsDayCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.energyActionsWeekCO2eChart;
    if (value != null) {
      result
        ..add('energyActionsWeekCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.energyActionsMonthCO2eChart;
    if (value != null) {
      result
        ..add('energyActionsMonthCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.transportActionsDayCO2eChart;
    if (value != null) {
      result
        ..add('transportActionsDayCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.transportActionsWeekCO2eChart;
    if (value != null) {
      result
        ..add('transportActionsWeekCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.transportActionsMonthCO2eChart;
    if (value != null) {
      result
        ..add('transportActionsMonthCO2eChart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
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
  UsersStatsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersStatsRecordBuilder();

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
        case 'days':
          result.days.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'weeks':
          result.weeks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'months':
          result.months.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'daysChart':
          result.daysChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'weeksChart':
          result.weeksChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'monthsChart':
          result.monthsChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'co2target':
          result.co2target = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'daysStreak':
          result.daysStreak = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'trophy50Actions':
          result.trophy50Actions = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'trophy50Actions3Periodics':
          result.trophy50Actions3Periodics = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'trophy50ActionsStart':
          result.trophy50ActionsStart = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'trophy50ActionsGoals':
          result.trophy50ActionsGoals = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'trophy50Actions7DaysStreak':
          result.trophy50Actions7DaysStreak = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'globalScore':
          result.globalScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'globalProjection':
          result.globalProjection = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'trophiesPoints':
          result.trophiesPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'allActionsCount':
          result.allActionsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'allPeriodicsCO2e':
          result.allPeriodicsCO2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'allPeriodicsCount':
          result.allPeriodicsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'foodActionsDayCO2e':
          result.foodActionsDayCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'foodActionsWeekCO2e':
          result.foodActionsWeekCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'foodActionsMonthCO2e':
          result.foodActionsMonthCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'foodActionsCount':
          result.foodActionsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'foodPeriodicsCO2e':
          result.foodPeriodicsCO2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'foodPeriodicsCount':
          result.foodPeriodicsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'energyActionsDayCO2e':
          result.energyActionsDayCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'energyActionsWeekCO2e':
          result.energyActionsWeekCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'energyActionsMonthCO2e':
          result.energyActionsMonthCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'energyActionsCount':
          result.energyActionsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'energyPeriodicsCO2e':
          result.energyPeriodicsCO2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'energyPeriodicsCount':
          result.energyPeriodicsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'transportActionsDayCO2e':
          result.transportActionsDayCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'transportActionsWeekCO2e':
          result.transportActionsWeekCO2e.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'transportActionsMonthCO2e':
          result.transportActionsMonthCO2e.replace(serializers.deserialize(
                  value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'transportActionsCount':
          result.transportActionsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'transportPeriodicsCO2e':
          result.transportPeriodicsCO2e = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'transportPeriodicsCount':
          result.transportPeriodicsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'foodActionsDayCO2eChart':
          result.foodActionsDayCO2eChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'foodActionsWeekCO2eChart':
          result.foodActionsWeekCO2eChart.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'foodActionsMonthCO2eChart':
          result.foodActionsMonthCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'energyActionsDayCO2eChart':
          result.energyActionsDayCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'energyActionsWeekCO2eChart':
          result.energyActionsWeekCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'energyActionsMonthCO2eChart':
          result.energyActionsMonthCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'transportActionsDayCO2eChart':
          result.transportActionsDayCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'transportActionsWeekCO2eChart':
          result.transportActionsWeekCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'transportActionsMonthCO2eChart':
          result.transportActionsMonthCO2eChart.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
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

class _$UsersStatsRecord extends UsersStatsRecord {
  @override
  final String? uid;
  @override
  final BuiltList<int>? days;
  @override
  final BuiltList<int>? weeks;
  @override
  final BuiltList<int>? months;
  @override
  final BuiltList<double>? daysChart;
  @override
  final BuiltList<double>? weeksChart;
  @override
  final BuiltList<double>? monthsChart;
  @override
  final int? co2target;
  @override
  final int? daysStreak;
  @override
  final bool? trophy50Actions;
  @override
  final bool? trophy50Actions3Periodics;
  @override
  final bool? trophy50ActionsStart;
  @override
  final bool? trophy50ActionsGoals;
  @override
  final bool? trophy50Actions7DaysStreak;
  @override
  final int? globalScore;
  @override
  final int? globalProjection;
  @override
  final int? trophiesPoints;
  @override
  final int? allActionsCount;
  @override
  final int? allPeriodicsCO2e;
  @override
  final int? allPeriodicsCount;
  @override
  final BuiltList<int>? foodActionsDayCO2e;
  @override
  final BuiltList<int>? foodActionsWeekCO2e;
  @override
  final BuiltList<int>? foodActionsMonthCO2e;
  @override
  final int? foodActionsCount;
  @override
  final int? foodPeriodicsCO2e;
  @override
  final int? foodPeriodicsCount;
  @override
  final BuiltList<int>? energyActionsDayCO2e;
  @override
  final BuiltList<int>? energyActionsWeekCO2e;
  @override
  final BuiltList<int>? energyActionsMonthCO2e;
  @override
  final int? energyActionsCount;
  @override
  final int? energyPeriodicsCO2e;
  @override
  final int? energyPeriodicsCount;
  @override
  final BuiltList<int>? transportActionsDayCO2e;
  @override
  final BuiltList<int>? transportActionsWeekCO2e;
  @override
  final BuiltList<int>? transportActionsMonthCO2e;
  @override
  final int? transportActionsCount;
  @override
  final int? transportPeriodicsCO2e;
  @override
  final int? transportPeriodicsCount;
  @override
  final BuiltList<double>? foodActionsDayCO2eChart;
  @override
  final BuiltList<double>? foodActionsWeekCO2eChart;
  @override
  final BuiltList<double>? foodActionsMonthCO2eChart;
  @override
  final BuiltList<double>? energyActionsDayCO2eChart;
  @override
  final BuiltList<double>? energyActionsWeekCO2eChart;
  @override
  final BuiltList<double>? energyActionsMonthCO2eChart;
  @override
  final BuiltList<double>? transportActionsDayCO2eChart;
  @override
  final BuiltList<double>? transportActionsWeekCO2eChart;
  @override
  final BuiltList<double>? transportActionsMonthCO2eChart;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersStatsRecord(
          [void Function(UsersStatsRecordBuilder)? updates]) =>
      (new UsersStatsRecordBuilder()..update(updates))._build();

  _$UsersStatsRecord._(
      {this.uid,
      this.days,
      this.weeks,
      this.months,
      this.daysChart,
      this.weeksChart,
      this.monthsChart,
      this.co2target,
      this.daysStreak,
      this.trophy50Actions,
      this.trophy50Actions3Periodics,
      this.trophy50ActionsStart,
      this.trophy50ActionsGoals,
      this.trophy50Actions7DaysStreak,
      this.globalScore,
      this.globalProjection,
      this.trophiesPoints,
      this.allActionsCount,
      this.allPeriodicsCO2e,
      this.allPeriodicsCount,
      this.foodActionsDayCO2e,
      this.foodActionsWeekCO2e,
      this.foodActionsMonthCO2e,
      this.foodActionsCount,
      this.foodPeriodicsCO2e,
      this.foodPeriodicsCount,
      this.energyActionsDayCO2e,
      this.energyActionsWeekCO2e,
      this.energyActionsMonthCO2e,
      this.energyActionsCount,
      this.energyPeriodicsCO2e,
      this.energyPeriodicsCount,
      this.transportActionsDayCO2e,
      this.transportActionsWeekCO2e,
      this.transportActionsMonthCO2e,
      this.transportActionsCount,
      this.transportPeriodicsCO2e,
      this.transportPeriodicsCount,
      this.foodActionsDayCO2eChart,
      this.foodActionsWeekCO2eChart,
      this.foodActionsMonthCO2eChart,
      this.energyActionsDayCO2eChart,
      this.energyActionsWeekCO2eChart,
      this.energyActionsMonthCO2eChart,
      this.transportActionsDayCO2eChart,
      this.transportActionsWeekCO2eChart,
      this.transportActionsMonthCO2eChart,
      this.ffRef})
      : super._();

  @override
  UsersStatsRecord rebuild(void Function(UsersStatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersStatsRecordBuilder toBuilder() =>
      new UsersStatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersStatsRecord &&
        uid == other.uid &&
        days == other.days &&
        weeks == other.weeks &&
        months == other.months &&
        daysChart == other.daysChart &&
        weeksChart == other.weeksChart &&
        monthsChart == other.monthsChart &&
        co2target == other.co2target &&
        daysStreak == other.daysStreak &&
        trophy50Actions == other.trophy50Actions &&
        trophy50Actions3Periodics == other.trophy50Actions3Periodics &&
        trophy50ActionsStart == other.trophy50ActionsStart &&
        trophy50ActionsGoals == other.trophy50ActionsGoals &&
        trophy50Actions7DaysStreak == other.trophy50Actions7DaysStreak &&
        globalScore == other.globalScore &&
        globalProjection == other.globalProjection &&
        trophiesPoints == other.trophiesPoints &&
        allActionsCount == other.allActionsCount &&
        allPeriodicsCO2e == other.allPeriodicsCO2e &&
        allPeriodicsCount == other.allPeriodicsCount &&
        foodActionsDayCO2e == other.foodActionsDayCO2e &&
        foodActionsWeekCO2e == other.foodActionsWeekCO2e &&
        foodActionsMonthCO2e == other.foodActionsMonthCO2e &&
        foodActionsCount == other.foodActionsCount &&
        foodPeriodicsCO2e == other.foodPeriodicsCO2e &&
        foodPeriodicsCount == other.foodPeriodicsCount &&
        energyActionsDayCO2e == other.energyActionsDayCO2e &&
        energyActionsWeekCO2e == other.energyActionsWeekCO2e &&
        energyActionsMonthCO2e == other.energyActionsMonthCO2e &&
        energyActionsCount == other.energyActionsCount &&
        energyPeriodicsCO2e == other.energyPeriodicsCO2e &&
        energyPeriodicsCount == other.energyPeriodicsCount &&
        transportActionsDayCO2e == other.transportActionsDayCO2e &&
        transportActionsWeekCO2e == other.transportActionsWeekCO2e &&
        transportActionsMonthCO2e == other.transportActionsMonthCO2e &&
        transportActionsCount == other.transportActionsCount &&
        transportPeriodicsCO2e == other.transportPeriodicsCO2e &&
        transportPeriodicsCount == other.transportPeriodicsCount &&
        foodActionsDayCO2eChart == other.foodActionsDayCO2eChart &&
        foodActionsWeekCO2eChart == other.foodActionsWeekCO2eChart &&
        foodActionsMonthCO2eChart == other.foodActionsMonthCO2eChart &&
        energyActionsDayCO2eChart == other.energyActionsDayCO2eChart &&
        energyActionsWeekCO2eChart == other.energyActionsWeekCO2eChart &&
        energyActionsMonthCO2eChart == other.energyActionsMonthCO2eChart &&
        transportActionsDayCO2eChart == other.transportActionsDayCO2eChart &&
        transportActionsWeekCO2eChart == other.transportActionsWeekCO2eChart &&
        transportActionsMonthCO2eChart ==
            other.transportActionsMonthCO2eChart &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, uid.hashCode), days.hashCode), weeks.hashCode), months.hashCode), daysChart.hashCode), weeksChart.hashCode), monthsChart.hashCode), co2target.hashCode), daysStreak.hashCode), trophy50Actions.hashCode), trophy50Actions3Periodics.hashCode), trophy50ActionsStart.hashCode), trophy50ActionsGoals.hashCode), trophy50Actions7DaysStreak.hashCode), globalScore.hashCode), globalProjection.hashCode), trophiesPoints.hashCode), allActionsCount.hashCode), allPeriodicsCO2e.hashCode), allPeriodicsCount.hashCode), foodActionsDayCO2e.hashCode), foodActionsWeekCO2e.hashCode), foodActionsMonthCO2e.hashCode), foodActionsCount.hashCode), foodPeriodicsCO2e.hashCode), foodPeriodicsCount.hashCode), energyActionsDayCO2e.hashCode), energyActionsWeekCO2e.hashCode), energyActionsMonthCO2e.hashCode),
                                                                                energyActionsCount.hashCode),
                                                                            energyPeriodicsCO2e.hashCode),
                                                                        energyPeriodicsCount.hashCode),
                                                                    transportActionsDayCO2e.hashCode),
                                                                transportActionsWeekCO2e.hashCode),
                                                            transportActionsMonthCO2e.hashCode),
                                                        transportActionsCount.hashCode),
                                                    transportPeriodicsCO2e.hashCode),
                                                transportPeriodicsCount.hashCode),
                                            foodActionsDayCO2eChart.hashCode),
                                        foodActionsWeekCO2eChart.hashCode),
                                    foodActionsMonthCO2eChart.hashCode),
                                energyActionsDayCO2eChart.hashCode),
                            energyActionsWeekCO2eChart.hashCode),
                        energyActionsMonthCO2eChart.hashCode),
                    transportActionsDayCO2eChart.hashCode),
                transportActionsWeekCO2eChart.hashCode),
            transportActionsMonthCO2eChart.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersStatsRecord')
          ..add('uid', uid)
          ..add('days', days)
          ..add('weeks', weeks)
          ..add('months', months)
          ..add('daysChart', daysChart)
          ..add('weeksChart', weeksChart)
          ..add('monthsChart', monthsChart)
          ..add('co2target', co2target)
          ..add('daysStreak', daysStreak)
          ..add('trophy50Actions', trophy50Actions)
          ..add('trophy50Actions3Periodics', trophy50Actions3Periodics)
          ..add('trophy50ActionsStart', trophy50ActionsStart)
          ..add('trophy50ActionsGoals', trophy50ActionsGoals)
          ..add('trophy50Actions7DaysStreak', trophy50Actions7DaysStreak)
          ..add('globalScore', globalScore)
          ..add('globalProjection', globalProjection)
          ..add('trophiesPoints', trophiesPoints)
          ..add('allActionsCount', allActionsCount)
          ..add('allPeriodicsCO2e', allPeriodicsCO2e)
          ..add('allPeriodicsCount', allPeriodicsCount)
          ..add('foodActionsDayCO2e', foodActionsDayCO2e)
          ..add('foodActionsWeekCO2e', foodActionsWeekCO2e)
          ..add('foodActionsMonthCO2e', foodActionsMonthCO2e)
          ..add('foodActionsCount', foodActionsCount)
          ..add('foodPeriodicsCO2e', foodPeriodicsCO2e)
          ..add('foodPeriodicsCount', foodPeriodicsCount)
          ..add('energyActionsDayCO2e', energyActionsDayCO2e)
          ..add('energyActionsWeekCO2e', energyActionsWeekCO2e)
          ..add('energyActionsMonthCO2e', energyActionsMonthCO2e)
          ..add('energyActionsCount', energyActionsCount)
          ..add('energyPeriodicsCO2e', energyPeriodicsCO2e)
          ..add('energyPeriodicsCount', energyPeriodicsCount)
          ..add('transportActionsDayCO2e', transportActionsDayCO2e)
          ..add('transportActionsWeekCO2e', transportActionsWeekCO2e)
          ..add('transportActionsMonthCO2e', transportActionsMonthCO2e)
          ..add('transportActionsCount', transportActionsCount)
          ..add('transportPeriodicsCO2e', transportPeriodicsCO2e)
          ..add('transportPeriodicsCount', transportPeriodicsCount)
          ..add('foodActionsDayCO2eChart', foodActionsDayCO2eChart)
          ..add('foodActionsWeekCO2eChart', foodActionsWeekCO2eChart)
          ..add('foodActionsMonthCO2eChart', foodActionsMonthCO2eChart)
          ..add('energyActionsDayCO2eChart', energyActionsDayCO2eChart)
          ..add('energyActionsWeekCO2eChart', energyActionsWeekCO2eChart)
          ..add('energyActionsMonthCO2eChart', energyActionsMonthCO2eChart)
          ..add('transportActionsDayCO2eChart', transportActionsDayCO2eChart)
          ..add('transportActionsWeekCO2eChart', transportActionsWeekCO2eChart)
          ..add(
              'transportActionsMonthCO2eChart', transportActionsMonthCO2eChart)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersStatsRecordBuilder
    implements Builder<UsersStatsRecord, UsersStatsRecordBuilder> {
  _$UsersStatsRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  ListBuilder<int>? _days;
  ListBuilder<int> get days => _$this._days ??= new ListBuilder<int>();
  set days(ListBuilder<int>? days) => _$this._days = days;

  ListBuilder<int>? _weeks;
  ListBuilder<int> get weeks => _$this._weeks ??= new ListBuilder<int>();
  set weeks(ListBuilder<int>? weeks) => _$this._weeks = weeks;

  ListBuilder<int>? _months;
  ListBuilder<int> get months => _$this._months ??= new ListBuilder<int>();
  set months(ListBuilder<int>? months) => _$this._months = months;

  ListBuilder<double>? _daysChart;
  ListBuilder<double> get daysChart =>
      _$this._daysChart ??= new ListBuilder<double>();
  set daysChart(ListBuilder<double>? daysChart) =>
      _$this._daysChart = daysChart;

  ListBuilder<double>? _weeksChart;
  ListBuilder<double> get weeksChart =>
      _$this._weeksChart ??= new ListBuilder<double>();
  set weeksChart(ListBuilder<double>? weeksChart) =>
      _$this._weeksChart = weeksChart;

  ListBuilder<double>? _monthsChart;
  ListBuilder<double> get monthsChart =>
      _$this._monthsChart ??= new ListBuilder<double>();
  set monthsChart(ListBuilder<double>? monthsChart) =>
      _$this._monthsChart = monthsChart;

  int? _co2target;
  int? get co2target => _$this._co2target;
  set co2target(int? co2target) => _$this._co2target = co2target;

  int? _daysStreak;
  int? get daysStreak => _$this._daysStreak;
  set daysStreak(int? daysStreak) => _$this._daysStreak = daysStreak;

  bool? _trophy50Actions;
  bool? get trophy50Actions => _$this._trophy50Actions;
  set trophy50Actions(bool? trophy50Actions) =>
      _$this._trophy50Actions = trophy50Actions;

  bool? _trophy50Actions3Periodics;
  bool? get trophy50Actions3Periodics => _$this._trophy50Actions3Periodics;
  set trophy50Actions3Periodics(bool? trophy50Actions3Periodics) =>
      _$this._trophy50Actions3Periodics = trophy50Actions3Periodics;

  bool? _trophy50ActionsStart;
  bool? get trophy50ActionsStart => _$this._trophy50ActionsStart;
  set trophy50ActionsStart(bool? trophy50ActionsStart) =>
      _$this._trophy50ActionsStart = trophy50ActionsStart;

  bool? _trophy50ActionsGoals;
  bool? get trophy50ActionsGoals => _$this._trophy50ActionsGoals;
  set trophy50ActionsGoals(bool? trophy50ActionsGoals) =>
      _$this._trophy50ActionsGoals = trophy50ActionsGoals;

  bool? _trophy50Actions7DaysStreak;
  bool? get trophy50Actions7DaysStreak => _$this._trophy50Actions7DaysStreak;
  set trophy50Actions7DaysStreak(bool? trophy50Actions7DaysStreak) =>
      _$this._trophy50Actions7DaysStreak = trophy50Actions7DaysStreak;

  int? _globalScore;
  int? get globalScore => _$this._globalScore;
  set globalScore(int? globalScore) => _$this._globalScore = globalScore;

  int? _globalProjection;
  int? get globalProjection => _$this._globalProjection;
  set globalProjection(int? globalProjection) =>
      _$this._globalProjection = globalProjection;

  int? _trophiesPoints;
  int? get trophiesPoints => _$this._trophiesPoints;
  set trophiesPoints(int? trophiesPoints) =>
      _$this._trophiesPoints = trophiesPoints;

  int? _allActionsCount;
  int? get allActionsCount => _$this._allActionsCount;
  set allActionsCount(int? allActionsCount) =>
      _$this._allActionsCount = allActionsCount;

  int? _allPeriodicsCO2e;
  int? get allPeriodicsCO2e => _$this._allPeriodicsCO2e;
  set allPeriodicsCO2e(int? allPeriodicsCO2e) =>
      _$this._allPeriodicsCO2e = allPeriodicsCO2e;

  int? _allPeriodicsCount;
  int? get allPeriodicsCount => _$this._allPeriodicsCount;
  set allPeriodicsCount(int? allPeriodicsCount) =>
      _$this._allPeriodicsCount = allPeriodicsCount;

  ListBuilder<int>? _foodActionsDayCO2e;
  ListBuilder<int> get foodActionsDayCO2e =>
      _$this._foodActionsDayCO2e ??= new ListBuilder<int>();
  set foodActionsDayCO2e(ListBuilder<int>? foodActionsDayCO2e) =>
      _$this._foodActionsDayCO2e = foodActionsDayCO2e;

  ListBuilder<int>? _foodActionsWeekCO2e;
  ListBuilder<int> get foodActionsWeekCO2e =>
      _$this._foodActionsWeekCO2e ??= new ListBuilder<int>();
  set foodActionsWeekCO2e(ListBuilder<int>? foodActionsWeekCO2e) =>
      _$this._foodActionsWeekCO2e = foodActionsWeekCO2e;

  ListBuilder<int>? _foodActionsMonthCO2e;
  ListBuilder<int> get foodActionsMonthCO2e =>
      _$this._foodActionsMonthCO2e ??= new ListBuilder<int>();
  set foodActionsMonthCO2e(ListBuilder<int>? foodActionsMonthCO2e) =>
      _$this._foodActionsMonthCO2e = foodActionsMonthCO2e;

  int? _foodActionsCount;
  int? get foodActionsCount => _$this._foodActionsCount;
  set foodActionsCount(int? foodActionsCount) =>
      _$this._foodActionsCount = foodActionsCount;

  int? _foodPeriodicsCO2e;
  int? get foodPeriodicsCO2e => _$this._foodPeriodicsCO2e;
  set foodPeriodicsCO2e(int? foodPeriodicsCO2e) =>
      _$this._foodPeriodicsCO2e = foodPeriodicsCO2e;

  int? _foodPeriodicsCount;
  int? get foodPeriodicsCount => _$this._foodPeriodicsCount;
  set foodPeriodicsCount(int? foodPeriodicsCount) =>
      _$this._foodPeriodicsCount = foodPeriodicsCount;

  ListBuilder<int>? _energyActionsDayCO2e;
  ListBuilder<int> get energyActionsDayCO2e =>
      _$this._energyActionsDayCO2e ??= new ListBuilder<int>();
  set energyActionsDayCO2e(ListBuilder<int>? energyActionsDayCO2e) =>
      _$this._energyActionsDayCO2e = energyActionsDayCO2e;

  ListBuilder<int>? _energyActionsWeekCO2e;
  ListBuilder<int> get energyActionsWeekCO2e =>
      _$this._energyActionsWeekCO2e ??= new ListBuilder<int>();
  set energyActionsWeekCO2e(ListBuilder<int>? energyActionsWeekCO2e) =>
      _$this._energyActionsWeekCO2e = energyActionsWeekCO2e;

  ListBuilder<int>? _energyActionsMonthCO2e;
  ListBuilder<int> get energyActionsMonthCO2e =>
      _$this._energyActionsMonthCO2e ??= new ListBuilder<int>();
  set energyActionsMonthCO2e(ListBuilder<int>? energyActionsMonthCO2e) =>
      _$this._energyActionsMonthCO2e = energyActionsMonthCO2e;

  int? _energyActionsCount;
  int? get energyActionsCount => _$this._energyActionsCount;
  set energyActionsCount(int? energyActionsCount) =>
      _$this._energyActionsCount = energyActionsCount;

  int? _energyPeriodicsCO2e;
  int? get energyPeriodicsCO2e => _$this._energyPeriodicsCO2e;
  set energyPeriodicsCO2e(int? energyPeriodicsCO2e) =>
      _$this._energyPeriodicsCO2e = energyPeriodicsCO2e;

  int? _energyPeriodicsCount;
  int? get energyPeriodicsCount => _$this._energyPeriodicsCount;
  set energyPeriodicsCount(int? energyPeriodicsCount) =>
      _$this._energyPeriodicsCount = energyPeriodicsCount;

  ListBuilder<int>? _transportActionsDayCO2e;
  ListBuilder<int> get transportActionsDayCO2e =>
      _$this._transportActionsDayCO2e ??= new ListBuilder<int>();
  set transportActionsDayCO2e(ListBuilder<int>? transportActionsDayCO2e) =>
      _$this._transportActionsDayCO2e = transportActionsDayCO2e;

  ListBuilder<int>? _transportActionsWeekCO2e;
  ListBuilder<int> get transportActionsWeekCO2e =>
      _$this._transportActionsWeekCO2e ??= new ListBuilder<int>();
  set transportActionsWeekCO2e(ListBuilder<int>? transportActionsWeekCO2e) =>
      _$this._transportActionsWeekCO2e = transportActionsWeekCO2e;

  ListBuilder<int>? _transportActionsMonthCO2e;
  ListBuilder<int> get transportActionsMonthCO2e =>
      _$this._transportActionsMonthCO2e ??= new ListBuilder<int>();
  set transportActionsMonthCO2e(ListBuilder<int>? transportActionsMonthCO2e) =>
      _$this._transportActionsMonthCO2e = transportActionsMonthCO2e;

  int? _transportActionsCount;
  int? get transportActionsCount => _$this._transportActionsCount;
  set transportActionsCount(int? transportActionsCount) =>
      _$this._transportActionsCount = transportActionsCount;

  int? _transportPeriodicsCO2e;
  int? get transportPeriodicsCO2e => _$this._transportPeriodicsCO2e;
  set transportPeriodicsCO2e(int? transportPeriodicsCO2e) =>
      _$this._transportPeriodicsCO2e = transportPeriodicsCO2e;

  int? _transportPeriodicsCount;
  int? get transportPeriodicsCount => _$this._transportPeriodicsCount;
  set transportPeriodicsCount(int? transportPeriodicsCount) =>
      _$this._transportPeriodicsCount = transportPeriodicsCount;

  ListBuilder<double>? _foodActionsDayCO2eChart;
  ListBuilder<double> get foodActionsDayCO2eChart =>
      _$this._foodActionsDayCO2eChart ??= new ListBuilder<double>();
  set foodActionsDayCO2eChart(ListBuilder<double>? foodActionsDayCO2eChart) =>
      _$this._foodActionsDayCO2eChart = foodActionsDayCO2eChart;

  ListBuilder<double>? _foodActionsWeekCO2eChart;
  ListBuilder<double> get foodActionsWeekCO2eChart =>
      _$this._foodActionsWeekCO2eChart ??= new ListBuilder<double>();
  set foodActionsWeekCO2eChart(ListBuilder<double>? foodActionsWeekCO2eChart) =>
      _$this._foodActionsWeekCO2eChart = foodActionsWeekCO2eChart;

  ListBuilder<double>? _foodActionsMonthCO2eChart;
  ListBuilder<double> get foodActionsMonthCO2eChart =>
      _$this._foodActionsMonthCO2eChart ??= new ListBuilder<double>();
  set foodActionsMonthCO2eChart(
          ListBuilder<double>? foodActionsMonthCO2eChart) =>
      _$this._foodActionsMonthCO2eChart = foodActionsMonthCO2eChart;

  ListBuilder<double>? _energyActionsDayCO2eChart;
  ListBuilder<double> get energyActionsDayCO2eChart =>
      _$this._energyActionsDayCO2eChart ??= new ListBuilder<double>();
  set energyActionsDayCO2eChart(
          ListBuilder<double>? energyActionsDayCO2eChart) =>
      _$this._energyActionsDayCO2eChart = energyActionsDayCO2eChart;

  ListBuilder<double>? _energyActionsWeekCO2eChart;
  ListBuilder<double> get energyActionsWeekCO2eChart =>
      _$this._energyActionsWeekCO2eChart ??= new ListBuilder<double>();
  set energyActionsWeekCO2eChart(
          ListBuilder<double>? energyActionsWeekCO2eChart) =>
      _$this._energyActionsWeekCO2eChart = energyActionsWeekCO2eChart;

  ListBuilder<double>? _energyActionsMonthCO2eChart;
  ListBuilder<double> get energyActionsMonthCO2eChart =>
      _$this._energyActionsMonthCO2eChart ??= new ListBuilder<double>();
  set energyActionsMonthCO2eChart(
          ListBuilder<double>? energyActionsMonthCO2eChart) =>
      _$this._energyActionsMonthCO2eChart = energyActionsMonthCO2eChart;

  ListBuilder<double>? _transportActionsDayCO2eChart;
  ListBuilder<double> get transportActionsDayCO2eChart =>
      _$this._transportActionsDayCO2eChart ??= new ListBuilder<double>();
  set transportActionsDayCO2eChart(
          ListBuilder<double>? transportActionsDayCO2eChart) =>
      _$this._transportActionsDayCO2eChart = transportActionsDayCO2eChart;

  ListBuilder<double>? _transportActionsWeekCO2eChart;
  ListBuilder<double> get transportActionsWeekCO2eChart =>
      _$this._transportActionsWeekCO2eChart ??= new ListBuilder<double>();
  set transportActionsWeekCO2eChart(
          ListBuilder<double>? transportActionsWeekCO2eChart) =>
      _$this._transportActionsWeekCO2eChart = transportActionsWeekCO2eChart;

  ListBuilder<double>? _transportActionsMonthCO2eChart;
  ListBuilder<double> get transportActionsMonthCO2eChart =>
      _$this._transportActionsMonthCO2eChart ??= new ListBuilder<double>();
  set transportActionsMonthCO2eChart(
          ListBuilder<double>? transportActionsMonthCO2eChart) =>
      _$this._transportActionsMonthCO2eChart = transportActionsMonthCO2eChart;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersStatsRecordBuilder() {
    UsersStatsRecord._initializeBuilder(this);
  }

  UsersStatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _days = $v.days?.toBuilder();
      _weeks = $v.weeks?.toBuilder();
      _months = $v.months?.toBuilder();
      _daysChart = $v.daysChart?.toBuilder();
      _weeksChart = $v.weeksChart?.toBuilder();
      _monthsChart = $v.monthsChart?.toBuilder();
      _co2target = $v.co2target;
      _daysStreak = $v.daysStreak;
      _trophy50Actions = $v.trophy50Actions;
      _trophy50Actions3Periodics = $v.trophy50Actions3Periodics;
      _trophy50ActionsStart = $v.trophy50ActionsStart;
      _trophy50ActionsGoals = $v.trophy50ActionsGoals;
      _trophy50Actions7DaysStreak = $v.trophy50Actions7DaysStreak;
      _globalScore = $v.globalScore;
      _globalProjection = $v.globalProjection;
      _trophiesPoints = $v.trophiesPoints;
      _allActionsCount = $v.allActionsCount;
      _allPeriodicsCO2e = $v.allPeriodicsCO2e;
      _allPeriodicsCount = $v.allPeriodicsCount;
      _foodActionsDayCO2e = $v.foodActionsDayCO2e?.toBuilder();
      _foodActionsWeekCO2e = $v.foodActionsWeekCO2e?.toBuilder();
      _foodActionsMonthCO2e = $v.foodActionsMonthCO2e?.toBuilder();
      _foodActionsCount = $v.foodActionsCount;
      _foodPeriodicsCO2e = $v.foodPeriodicsCO2e;
      _foodPeriodicsCount = $v.foodPeriodicsCount;
      _energyActionsDayCO2e = $v.energyActionsDayCO2e?.toBuilder();
      _energyActionsWeekCO2e = $v.energyActionsWeekCO2e?.toBuilder();
      _energyActionsMonthCO2e = $v.energyActionsMonthCO2e?.toBuilder();
      _energyActionsCount = $v.energyActionsCount;
      _energyPeriodicsCO2e = $v.energyPeriodicsCO2e;
      _energyPeriodicsCount = $v.energyPeriodicsCount;
      _transportActionsDayCO2e = $v.transportActionsDayCO2e?.toBuilder();
      _transportActionsWeekCO2e = $v.transportActionsWeekCO2e?.toBuilder();
      _transportActionsMonthCO2e = $v.transportActionsMonthCO2e?.toBuilder();
      _transportActionsCount = $v.transportActionsCount;
      _transportPeriodicsCO2e = $v.transportPeriodicsCO2e;
      _transportPeriodicsCount = $v.transportPeriodicsCount;
      _foodActionsDayCO2eChart = $v.foodActionsDayCO2eChart?.toBuilder();
      _foodActionsWeekCO2eChart = $v.foodActionsWeekCO2eChart?.toBuilder();
      _foodActionsMonthCO2eChart = $v.foodActionsMonthCO2eChart?.toBuilder();
      _energyActionsDayCO2eChart = $v.energyActionsDayCO2eChart?.toBuilder();
      _energyActionsWeekCO2eChart = $v.energyActionsWeekCO2eChart?.toBuilder();
      _energyActionsMonthCO2eChart =
          $v.energyActionsMonthCO2eChart?.toBuilder();
      _transportActionsDayCO2eChart =
          $v.transportActionsDayCO2eChart?.toBuilder();
      _transportActionsWeekCO2eChart =
          $v.transportActionsWeekCO2eChart?.toBuilder();
      _transportActionsMonthCO2eChart =
          $v.transportActionsMonthCO2eChart?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersStatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersStatsRecord;
  }

  @override
  void update(void Function(UsersStatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersStatsRecord build() => _build();

  _$UsersStatsRecord _build() {
    _$UsersStatsRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersStatsRecord._(
              uid: uid,
              days: _days?.build(),
              weeks: _weeks?.build(),
              months: _months?.build(),
              daysChart: _daysChart?.build(),
              weeksChart: _weeksChart?.build(),
              monthsChart: _monthsChart?.build(),
              co2target: co2target,
              daysStreak: daysStreak,
              trophy50Actions: trophy50Actions,
              trophy50Actions3Periodics: trophy50Actions3Periodics,
              trophy50ActionsStart: trophy50ActionsStart,
              trophy50ActionsGoals: trophy50ActionsGoals,
              trophy50Actions7DaysStreak: trophy50Actions7DaysStreak,
              globalScore: globalScore,
              globalProjection: globalProjection,
              trophiesPoints: trophiesPoints,
              allActionsCount: allActionsCount,
              allPeriodicsCO2e: allPeriodicsCO2e,
              allPeriodicsCount: allPeriodicsCount,
              foodActionsDayCO2e: _foodActionsDayCO2e?.build(),
              foodActionsWeekCO2e: _foodActionsWeekCO2e?.build(),
              foodActionsMonthCO2e: _foodActionsMonthCO2e?.build(),
              foodActionsCount: foodActionsCount,
              foodPeriodicsCO2e: foodPeriodicsCO2e,
              foodPeriodicsCount: foodPeriodicsCount,
              energyActionsDayCO2e: _energyActionsDayCO2e?.build(),
              energyActionsWeekCO2e: _energyActionsWeekCO2e?.build(),
              energyActionsMonthCO2e: _energyActionsMonthCO2e?.build(),
              energyActionsCount: energyActionsCount,
              energyPeriodicsCO2e: energyPeriodicsCO2e,
              energyPeriodicsCount: energyPeriodicsCount,
              transportActionsDayCO2e: _transportActionsDayCO2e?.build(),
              transportActionsWeekCO2e: _transportActionsWeekCO2e?.build(),
              transportActionsMonthCO2e: _transportActionsMonthCO2e?.build(),
              transportActionsCount: transportActionsCount,
              transportPeriodicsCO2e: transportPeriodicsCO2e,
              transportPeriodicsCount: transportPeriodicsCount,
              foodActionsDayCO2eChart: _foodActionsDayCO2eChart?.build(),
              foodActionsWeekCO2eChart: _foodActionsWeekCO2eChart?.build(),
              foodActionsMonthCO2eChart: _foodActionsMonthCO2eChart?.build(),
              energyActionsDayCO2eChart: _energyActionsDayCO2eChart?.build(),
              energyActionsWeekCO2eChart: _energyActionsWeekCO2eChart?.build(),
              energyActionsMonthCO2eChart:
                  _energyActionsMonthCO2eChart?.build(),
              transportActionsDayCO2eChart:
                  _transportActionsDayCO2eChart?.build(),
              transportActionsWeekCO2eChart:
                  _transportActionsWeekCO2eChart?.build(),
              transportActionsMonthCO2eChart:
                  _transportActionsMonthCO2eChart?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'days';
        _days?.build();
        _$failedField = 'weeks';
        _weeks?.build();
        _$failedField = 'months';
        _months?.build();
        _$failedField = 'daysChart';
        _daysChart?.build();
        _$failedField = 'weeksChart';
        _weeksChart?.build();
        _$failedField = 'monthsChart';
        _monthsChart?.build();

        _$failedField = 'foodActionsDayCO2e';
        _foodActionsDayCO2e?.build();
        _$failedField = 'foodActionsWeekCO2e';
        _foodActionsWeekCO2e?.build();
        _$failedField = 'foodActionsMonthCO2e';
        _foodActionsMonthCO2e?.build();

        _$failedField = 'energyActionsDayCO2e';
        _energyActionsDayCO2e?.build();
        _$failedField = 'energyActionsWeekCO2e';
        _energyActionsWeekCO2e?.build();
        _$failedField = 'energyActionsMonthCO2e';
        _energyActionsMonthCO2e?.build();

        _$failedField = 'transportActionsDayCO2e';
        _transportActionsDayCO2e?.build();
        _$failedField = 'transportActionsWeekCO2e';
        _transportActionsWeekCO2e?.build();
        _$failedField = 'transportActionsMonthCO2e';
        _transportActionsMonthCO2e?.build();

        _$failedField = 'foodActionsDayCO2eChart';
        _foodActionsDayCO2eChart?.build();
        _$failedField = 'foodActionsWeekCO2eChart';
        _foodActionsWeekCO2eChart?.build();
        _$failedField = 'foodActionsMonthCO2eChart';
        _foodActionsMonthCO2eChart?.build();
        _$failedField = 'energyActionsDayCO2eChart';
        _energyActionsDayCO2eChart?.build();
        _$failedField = 'energyActionsWeekCO2eChart';
        _energyActionsWeekCO2eChart?.build();
        _$failedField = 'energyActionsMonthCO2eChart';
        _energyActionsMonthCO2eChart?.build();
        _$failedField = 'transportActionsDayCO2eChart';
        _transportActionsDayCO2eChart?.build();
        _$failedField = 'transportActionsWeekCO2eChart';
        _transportActionsWeekCO2eChart?.build();
        _$failedField = 'transportActionsMonthCO2eChart';
        _transportActionsMonthCO2eChart?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersStatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
