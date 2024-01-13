import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/action_description_widget.dart';
import '/components/empty_list_actions_widget.dart';
import '/components/empty_list_periodics_widget.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'actions_model.dart';
export 'actions_model.dart';

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({
    super.key,
    required this.category,
  });

  final String? category;

  @override
  _ActionsWidgetState createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {
  late ActionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<StatsRecord>>(
      stream: queryStatsRecord(
        queryBuilder: (statsRecord) => statsRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
            ),
          );
        }
        List<StatsRecord> actionsStatsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final actionsStatsRecord = actionsStatsRecordList.isNotEmpty
            ? actionsStatsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.headModel,
                      updateCallback: () => setState(() {}),
                      child: const HeadWidget(),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.titleBackModel,
                    updateCallback: () => setState(() {}),
                    child: TitleBackWidget(
                      title: widget.category!,
                    ),
                  ),
                  Container(
                    width: 360.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FlutterFlowChoiceChips(
                            options: const [
                              ChipData('Ponctuelles', FFIcons.kadd),
                              ChipData('Récurrentes', FFIcons.kcalendar2)
                            ],
                            onChanged: (val) => setState(
                                () => _model.actionTypeValue = val?.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18.0,
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            chipSpacing: 12.0,
                            rowSpacing: 12.0,
                            multiselect: false,
                            initialized: _model.actionTypeValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model.actionTypeValueController ??=
                                FormFieldController<List<String>>(
                              ['Ponctuelles'],
                            ),
                            wrapped: true,
                          ),
                        ),
                        if (_model.actionTypeValue == 'Ponctuelles')
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: StreamBuilder<List<ActionsRecord>>(
                                stream: queryActionsRecord(
                                  queryBuilder: (actionsRecord) => actionsRecord
                                      .where(
                                        'uid',
                                        isEqualTo: currentUserUid,
                                      )
                                      .where(
                                        'created_time',
                                        isGreaterThanOrEqualTo:
                                            functions.lastMidnight(),
                                      )
                                      .where(
                                        'category',
                                        isEqualTo: widget.category,
                                      )
                                      .where(
                                        'isPeriodic',
                                        isEqualTo: false,
                                      ),
                                  limit: 10,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ActionsRecord> actionActionsRecordList =
                                      snapshot.data!;
                                  if (actionActionsRecordList.isEmpty) {
                                    return const EmptyListActionsWidget();
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    reverse: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actionActionsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 10.0),
                                    itemBuilder: (context, actionIndex) {
                                      final actionActionsRecord =
                                          actionActionsRecordList[actionIndex];
                                      return ActionDescriptionWidget(
                                        key: Key(
                                            'Key5vj_${actionIndex}_of_${actionActionsRecordList.length}'),
                                        date: dateTimeFormat(
                                          'd/M/y',
                                          actionActionsRecord.createdTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        action: actionActionsRecord.action,
                                        option: actionActionsRecord.option,
                                        co2e: actionActionsRecord.co2e,
                                        category: actionActionsRecord.category,
                                        ref: actionActionsRecord.reference,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        if (_model.actionTypeValue == 'Récurrentes')
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: StreamBuilder<List<ActionsRecord>>(
                                stream: queryActionsRecord(
                                  queryBuilder: (actionsRecord) => actionsRecord
                                      .where(
                                        'uid',
                                        isEqualTo: currentUserUid,
                                      )
                                      .where(
                                        'category',
                                        isEqualTo: widget.category,
                                      )
                                      .where(
                                        'isPeriodic',
                                        isEqualTo: true,
                                      ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ActionsRecord>
                                      periodicsActionsRecordList =
                                      snapshot.data!;
                                  if (periodicsActionsRecordList.isEmpty) {
                                    return const EmptyListPeriodicsWidget();
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    reverse: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        periodicsActionsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 10.0),
                                    itemBuilder: (context, periodicsIndex) {
                                      final periodicsActionsRecord =
                                          periodicsActionsRecordList[
                                              periodicsIndex];
                                      return ActionDescriptionWidget(
                                        key: Key(
                                            'Keyoaj_${periodicsIndex}_of_${periodicsActionsRecordList.length}'),
                                        date: dateTimeFormat(
                                          'd/M/y',
                                          periodicsActionsRecord.createdTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        action: periodicsActionsRecord.action,
                                        option: periodicsActionsRecord.option,
                                        co2e: periodicsActionsRecord.co2e,
                                        category:
                                            periodicsActionsRecord.category,
                                        ref: periodicsActionsRecord.reference,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'declare',
                                queryParameters: {
                                  'category': serializeParam(
                                    widget.category,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Ajouter',
                            icon: const Icon(
                              Icons.add_circle_outline,
                              size: 25.0,
                            ),
                            options: FFButtonOptions(
                              width: 290.0,
                              height: 40.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleSmall,
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    height: 70.0,
                    decoration: const BoxDecoration(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
