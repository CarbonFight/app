import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/badge_widget.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/components/work_in_progress_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'badges_model.dart';
export 'badges_model.dart';

class BadgesWidget extends StatefulWidget {
  const BadgesWidget({super.key});

  @override
  _BadgesWidgetState createState() => _BadgesWidgetState();
}

class _BadgesWidgetState extends State<BadgesWidget> {
  late BadgesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgesModel());

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
                  title: 'Mes badges',
                ),
              ),
              StreamBuilder<List<BadgesRecord>>(
                stream: queryBadgesRecord(
                  queryBuilder: (badgesRecord) => badgesRecord.where(
                    'uid',
                    isEqualTo: currentUserUid,
                  ),
                  singleRecord: true,
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
                  List<BadgesRecord> bodyBadgesRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final bodyBadgesRecord = bodyBadgesRecordList.isNotEmpty
                      ? bodyBadgesRecordList.first
                      : null;
                  return Container(
                    width: 360.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.workInProgressModel,
                          updateCallback: () => setState(() {}),
                          child: const WorkInProgressWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Acquis',
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                        ),
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.graineModel1,
                                updateCallback: () => setState(() {}),
                                child: BadgeWidget(
                                  icon: FaIcon(
                                    FontAwesomeIcons.seedling,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                  title: 'Graine de Conscience',
                                  desc:
                                      'Vous avez remporté tous les défis de prise en main.',
                                  active:
                                      bodyBadgesRecord!.onboardingAllChallenges,
                                  id: 'onboardingAllChallenges',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.graineModel2,
                                updateCallback: () => setState(() {}),
                                child: BadgeWidget(
                                  icon: FaIcon(
                                    FontAwesomeIcons.medal,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                  title: 'Recrue Prometteuse',
                                  desc: 'Vous avez terminé le tutoriel.',
                                  active:
                                      bodyBadgesRecord.onboardingHowtoFinished,
                                  id: 'onboardingHowtoFinished',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(const SizedBox(height: 5.0)),
                    ),
                  );
                },
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
  }
}
