import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/title_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'challenges_model.dart';
export 'challenges_model.dart';

class ChallengesWidget extends StatefulWidget {
  const ChallengesWidget({super.key});

  @override
  _ChallengesWidgetState createState() => _ChallengesWidgetState();
}

class _ChallengesWidgetState extends State<ChallengesWidget> {
  late ChallengesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChallengesModel());

    _model.onboardingController = ExpandableController(initialExpanded: false);
    _model.fidelisationController =
        ExpandableController(initialExpanded: false);
    _model.trajetsController = ExpandableController(initialExpanded: false);
    _model.repasController = ExpandableController(initialExpanded: false);
    _model.communautController = ExpandableController(initialExpanded: false);
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

    return StreamBuilder<List<ChallengesRecord>>(
      stream: queryChallengesRecord(
        queryBuilder: (challengesRecord) => challengesRecord.where(
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
        List<ChallengesRecord> challengesChallengesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final challengesChallengesRecord =
            challengesChallengesRecordList.isNotEmpty
                ? challengesChallengesRecordList.first
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
                    model: _model.titleModel,
                    updateCallback: () => setState(() {}),
                    child: const TitleWidget(
                      title: 'Défis',
                    ),
                  ),
                  StreamBuilder<List<StatsRecord>>(
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
                      List<StatsRecord> bodyStatsRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final bodyStatsRecord = bodyStatsRecordList.isNotEmpty
                          ? bodyStatsRecordList.first
                          : null;
                      return Container(
                        width: 360.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Container(
                                width: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        FFIcons.kleaf,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 40.0,
                                      ),
                                      Container(
                                        width: 180.0,
                                        decoration: const BoxDecoration(),
                                        child: RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4jru0nxj' /* Score 
 */
                                                  ,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                              ),
                                              TextSpan(
                                                text: functions
                                                    .challengesStats(
                                                        challengesChallengesRecord!)[0]
                                                    .toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ud4x7r30' /*  /  */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                              ),
                                              TextSpan(
                                                text: functions
                                                    .challengesStats(
                                                        challengesChallengesRecord)[1]
                                                    .toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: const BoxDecoration(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                          'kb73nmdc' /* Validés */,
                                        ),
                                        Icons.shield_sharp),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                          'ftocvnf8' /* Tous */,
                                        ),
                                        FontAwesomeIcons.shieldAlt),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                          'rhnew14v' /* Non validés */,
                                        ),
                                        Icons.shield_outlined)
                                  ],
                                  onChanged: (val) => setState(() =>
                                      _model.choiceChipsValue = val?.first),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle:
                                        FlutterFlowTheme.of(context).labelSmall,
                                    iconColor:
                                        FlutterFlowTheme.of(context).success,
                                    iconSize: 18.0,
                                    elevation: 4.0,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle:
                                        FlutterFlowTheme.of(context).labelSmall,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  chipSpacing: 10.0,
                                  rowSpacing: 5.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    [
                                      FFLocalizations.of(context).getText(
                                        'n6bbpw7n' /* Tous */,
                                      )
                                    ],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      color: const Color(0x00000000),
                                      child: ExpandableNotifier(
                                        controller: _model.onboardingController,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.rocket_launch_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Container(
                                                  width: 220.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: RichText(
                                                    textScaleFactor:
                                                        MediaQuery.of(context)
                                                            .textScaleFactor,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'o75pt1cq' /* Prise en main  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[2]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'f2vzsfr2' /*  /  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[3]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingTransport) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingTransport))
                                                Container(
                                                  width: 300.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ggmbgj8r' /* Tut tut !  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'kfriy1o1' /* 
Ajouter votre première action... */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .car,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountTransport,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingTransport
                                                                ? 'Validé !'
                                                                : 'Trajets : ${bodyStatsRecord?.actionsCountTransport.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingClothes) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingClothes))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'tyf5bf8g' /* Et mes chausettes...
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'olcmrjx9' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .tshirt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingClothes
                                                                ? 'Validé !'
                                                                : 'Habits : ${bodyStatsRecord?.actionsCountClothes.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingDigital) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingDigital))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'f69642yh' /* 0100110101010111 !
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'dnocnwvb' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Icon(
                                                                Icons.tv,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingDigital
                                                                ? 'Validé !'
                                                                : 'Appareils : ${bodyStatsRecord?.actionsCountDigital.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingAppliance) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingAppliance))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'd8g7rris' /* Le "four" tout
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'h0i9x50s' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Icon(
                                                                Icons
                                                                    .kitchen_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingAppliance
                                                                ? 'Validé !'
                                                                : 'Electroménager : ${bodyStatsRecord?.actionsCountAppliance.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingFurniture) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingFurniture))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8w82szb3' /* Fond de canap
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1jyocymq' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .couch,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingFurniture
                                                                ? 'Validé !'
                                                                : 'Mobilier : ${bodyStatsRecord?.actionsCountFurniture.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingObjects) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingObjects))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1kr6jt0o' /* Je possède des trucs
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'gucmastk' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .tag,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingObjects
                                                                ? 'Validé !'
                                                                : 'Objets : ${bodyStatsRecord?.actionsCountObjects.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingLodging) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingLodging))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ipw1lv26' /* Home sweet home
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '257yhjra' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Icon(
                                                                Icons
                                                                    .home_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingLodging
                                                                ? 'Validé !'
                                                                : 'Actions : ${bodyStatsRecord?.actionsCountLodging.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              if ((_model.choiceChipsValue ==
                                                      'Tous') ||
                                                  ((_model.choiceChipsValue ==
                                                          'Validés') &&
                                                      challengesChallengesRecord.onboardingFood) ||
                                                  ((_model.choiceChipsValue ==
                                                          'Non validés') &&
                                                      !challengesChallengesRecord.onboardingFood))
                                                Container(
                                                  width: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 220.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'lnh6lvom' /* La crèpe au sucre
 */
                                                                        ,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ebetsoj3' /* Ajouter votre première action ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Icon(
                                                                Icons
                                                                    .fastfood_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        LinearPercentIndicator(
                                                          percent: functions
                                                              .pRatioChallenges(
                                                                  bodyStatsRecord
                                                                      ?.actionsCountFood,
                                                                  1)!,
                                                          width: 280.0,
                                                          lineHeight: 20.0,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          backgroundColor:
                                                              const Color(0x5157636C),
                                                          center: Text(
                                                            challengesChallengesRecord.onboardingFood
                                                                ? 'Validé !'
                                                                : 'Repas : ${bodyStatsRecord?.actionsCountFood.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            expandIcon:
                                                FontAwesomeIcons.angleDown,
                                            collapseIcon:
                                                FontAwesomeIcons.angleUp,
                                            iconSize: 25.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      color: const Color(0x00000000),
                                      child: ExpandableNotifier(
                                        controller:
                                            _model.fidelisationController,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.favorite_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Container(
                                                  width: 220.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: RichText(
                                                    textScaleFactor:
                                                        MediaQuery.of(context)
                                                            .textScaleFactor,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '5ulxwrhf' /* Fidélisation  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[4]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'mtxzwn2j' /*  /  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[5]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 2.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 220.0,
                                                            height: 50.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: RichText(
                                                              textScaleFactor:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6sc3zdis' /* Travaux en cours
 */
                                                                      ,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1ivcmeux' /* Les succes seront bientôt impl... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 50.0,
                                                            height: 30.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .wrench,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            expandIcon:
                                                FontAwesomeIcons.angleDown,
                                            collapseIcon:
                                                FontAwesomeIcons.angleUp,
                                            iconSize: 25.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      color: const Color(0x00000000),
                                      child: ExpandableNotifier(
                                        controller: _model.trajetsController,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.car,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Container(
                                                  width: 220.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: RichText(
                                                    textScaleFactor:
                                                        MediaQuery.of(context)
                                                            .textScaleFactor,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'g9pj9rrb' /* Trajets  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[6]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'nc0yehjw' /*  /  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[7]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 2.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 220.0,
                                                            height: 50.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: RichText(
                                                              textScaleFactor:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd7i2n8lq' /* Travaux en cours
 */
                                                                      ,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '8ff4os7p' /* Les succes seront bientôt impl... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 50.0,
                                                            height: 30.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .wrench,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            expandIcon:
                                                FontAwesomeIcons.angleDown,
                                            collapseIcon:
                                                FontAwesomeIcons.angleUp,
                                            iconSize: 25.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      color: const Color(0x00000000),
                                      child: ExpandableNotifier(
                                        controller: _model.repasController,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.fastfood_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Container(
                                                  width: 220.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: RichText(
                                                    textScaleFactor:
                                                        MediaQuery.of(context)
                                                            .textScaleFactor,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'u95m8j09' /* Repas  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[8]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'b95ic137' /*  /  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[9]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 2.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 220.0,
                                                            height: 50.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: RichText(
                                                              textScaleFactor:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pcg0vh04' /* Travaux en cours
 */
                                                                      ,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4d1ok44r' /* Les succes seront bientôt impl... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 50.0,
                                                            height: 30.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .wrench,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            expandIcon:
                                                FontAwesomeIcons.angleDown,
                                            collapseIcon:
                                                FontAwesomeIcons.angleUp,
                                            iconSize: 25.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      color: const Color(0x00000000),
                                      child: ExpandableNotifier(
                                        controller: _model.communautController,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.userFriends,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Container(
                                                  width: 220.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: RichText(
                                                    textScaleFactor:
                                                        MediaQuery.of(context)
                                                            .textScaleFactor,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'u6azu41v' /* Communauté  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[10]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'nk9vd2sg' /*  /  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        TextSpan(
                                                          text: functions
                                                              .challengesStats(
                                                                  challengesChallengesRecord)[11]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 2.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 220.0,
                                                            height: 50.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: RichText(
                                                              textScaleFactor:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cckfy06h' /* Travaux en cours
 */
                                                                      ,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'etb5acw6' /* Les succes seront bientôt impl... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 50.0,
                                                            height: 30.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .wrench,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            expandIcon:
                                                FontAwesomeIcons.angleDown,
                                            collapseIcon:
                                                FontAwesomeIcons.angleUp,
                                            iconSize: 25.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
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
      },
    );
  }
}
