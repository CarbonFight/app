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
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'journal_model.dart';
export 'journal_model.dart';

class JournalWidget extends StatefulWidget {
  const JournalWidget({super.key});

  @override
  _JournalWidgetState createState() => _JournalWidgetState();
}

class _JournalWidgetState extends State<JournalWidget> {
  late JournalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalModel());

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
        List<StatsRecord> journalStatsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final journalStatsRecord = journalStatsRecordList.isNotEmpty
            ? journalStatsRecordList.first
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
                    child: const TitleBackWidget(
                      title: 'Mon journal',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: FlutterFlowChoiceChips(
                      options: const [
                        ChipData('Ponctuelles', FFIcons.kadd),
                        ChipData('Récurrentes', FFIcons.kcalendar2)
                      ],
                      onChanged: (val) =>
                          setState(() => _model.actionTypeValue = val?.first),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        iconSize: 18.0,
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
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
                  Container(
                    width: 360.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Container(
                      width: 360.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.actionTypeValue == 'Ponctuelles')
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 30.0, 0.0),
                                child: PagedListView<DocumentSnapshot<Object?>?,
                                    ActionsRecord>.separated(
                                  pagingController: _model.setActionController(
                                    ActionsRecord.collection
                                        .where(
                                          'uid',
                                          isEqualTo: currentUserUid,
                                        )
                                        .where(
                                          'isPeriodic',
                                          isEqualTo: false,
                                        ),
                                  ),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  reverse: true,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10.0),
                                  builderDelegate:
                                      PagedChildBuilderDelegate<ActionsRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
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
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
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
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) =>
                                        const EmptyListActionsWidget(),
                                    itemBuilder: (context, _, actionIndex) {
                                      final actionActionsRecord = _model
                                          .actionPagingController!
                                          .itemList![actionIndex];
                                      return ActionDescriptionWidget(
                                        key: Key(
                                            'Key8l4_${actionIndex}_of_${_model.actionPagingController!.itemList!.length}'),
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
                                  ),
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
                                    queryBuilder: (actionsRecord) =>
                                        actionsRecord
                                            .where(
                                              'uid',
                                              isEqualTo: currentUserUid,
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
                                              'Keyosc_${periodicsIndex}_of_${periodicsActionsRecordList.length}'),
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
                        ].divide(const SizedBox(height: 10.0)),
                      ),
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
