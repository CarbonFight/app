import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widget.dart';
import '/components/head_widget.dart';
import '/components/title_return_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      child: HeadWidget(
                        displayName: currentUserDisplayName,
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.titleReturnModel,
                    updateCallback: () => setState(() {}),
                    child: const TitleReturnWidget(
                      title: 'Mon journal',
                      subtitle: 'L\'intégralité de vos actions',
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: StreamBuilder<List<ActionsRecord>>(
                            stream: queryActionsRecord(
                              queryBuilder: (actionsRecord) => actionsRecord
                                  .where(
                                    'uid',
                                    isEqualTo: currentUserUid,
                                  )
                                  .orderBy('created_time'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).secondary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ActionsRecord> listViewActionsRecordList =
                                  snapshot.data!;
                              if (listViewActionsRecordList.isEmpty) {
                                return const EmptyListWidget();
                              }
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                reverse: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewActionsRecordList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 5.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewActionsRecord =
                                      listViewActionsRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'declare',
                                        queryParameters: {
                                          'actionRef': serializeParam(
                                            listViewActionsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'category': serializeParam(
                                            listViewActionsRecord.category,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                        listViewActionsRecord.action,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                      subtitle: Text(
                                        'Emission : ${listViewActionsRecord.co2e.toString()} - ${listViewActionsRecord.option}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 20.0,
                                      ),
                                      tileColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: true,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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
