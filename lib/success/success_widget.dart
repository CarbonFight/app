import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/title_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'success_model.dart';
export 'success_model.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({super.key});

  @override
  _SuccessWidgetState createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  late SuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessModel());

    _model.lodgingController = ExpandableController(initialExpanded: false);
    _model.clothesController = ExpandableController(initialExpanded: false);
    _model.applianceController = ExpandableController(initialExpanded: false);
    _model.furnitureController = ExpandableController(initialExpanded: false);
    _model.digitalController1 = ExpandableController(initialExpanded: false);
    _model.digitalController2 = ExpandableController(initialExpanded: false);
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
                  child: HeadWidget(
                    displayName: currentUserDisplayName,
                  ),
                ),
              ),
              StreamBuilder<List<SuccessRecord>>(
                stream: querySuccessRecord(
                  queryBuilder: (successRecord) => successRecord.where(
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
                  List<SuccessRecord> bodySuccessRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final bodySuccessRecord = bodySuccessRecordList.isNotEmpty
                      ? bodySuccessRecordList.first
                      : null;
                  return Container(
                    width: 360.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.titleModel,
                            updateCallback: () => setState(() {}),
                            child: const TitleWidget(
                              title: 'Mes succès',
                            ),
                          ),
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
                                  color: FlutterFlowTheme.of(context).tertiary,
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 40.0,
                                    ),
                                    Container(
                                      width: 180.0,
                                      decoration: const BoxDecoration(),
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '6pql7wtd' /* Score 
 */
                                                ,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                functions
                                                    .successStats(
                                                        bodySuccessRecord!)[0]
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'kgei9jen' /*  /  */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: functions
                                                  .successStats(
                                                      bodySuccessRecord)[1]
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                color: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.check,
                                  color: FlutterFlowTheme.of(context).success,
                                  size: 18.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '54jjnnlo' /* Validé */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Icon(
                                  Icons.close_sharp,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ks8w1o9m' /* Pas encore */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Icon(
                                  Icons.not_interested_sharp,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    's4ikgs7s' /* Non applicable */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                              ],
                            ),
                          ),
                          ListView(
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
                                    controller: _model.lodgingController,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.home_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3qcb0plf' /* Logement  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[2]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'l6gs89ed' /*  /  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[3]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
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
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                        height: 70.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            RichText(
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
                                                                      'kqus3mem' /* Led the sunshine
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
                                                                      'y7fkbvpp' /* J’utilise uniquement des lampe... */,
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
                                                            RatingBarIndicator(
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      Icon(
                                                                FFIcons.kleaf,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                              direction: Axis
                                                                  .horizontal,
                                                              rating: 3.0,
                                                              unratedColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              itemCount: 5,
                                                              itemSize: 15.0,
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.light,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 40.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              bodySuccessRecord
                                                                          .led ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .success
                                                                  : Colors
                                                                      .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .led ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              led: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .led ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .led ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              led: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              bodySuccessRecord
                                                                          .led ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning
                                                                  : Colors
                                                                      .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .led ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              led: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'idif43kc' /* Non merci !
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'o4uj1wmj' /* J’ai indiqué sur ma boîte au l... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                              .handSparkles,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              bodySuccessRecord
                                                                          .pub ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .success
                                                                  : Colors
                                                                      .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .pub ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              pub: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .pub ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .pub ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              pub: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              bodySuccessRecord
                                                                          .pub ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning
                                                                  : Colors
                                                                      .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .pub ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              pub: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  '8tyijt6a' /* Je choisis la solution offensi... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '31x51lvh' /* J’ai choisi ca y est. J’activé... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        child: Icon(
                                                          Icons
                                                              .electric_bolt_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .greenEnergy ==
                                                                  1
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .success
                                                              : Colors
                                                                  .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .greenEnergy ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              greenEnergy: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .greenEnergy ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .greenEnergy ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              greenEnergy: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .greenEnergy ==
                                                                  3
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .warning
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .greenEnergy ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              greenEnergy: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'v0p6pl0i' /* Bain voyons
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ipf6tpnd' /* Je ne prends plus de bain, du ... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        child: Icon(
                                                          Icons
                                                              .bathroom_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .bath ==
                                                                  1
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .success
                                                              : Colors
                                                                  .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .bath ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              bath: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .bath ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .bath ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              bath: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .bath ==
                                                                  3
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .warning
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .bath ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              bath: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'b90i6mp1' /* L’été sera chaud
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '6xg11k2i' /* Mon logement est équipe d'un t... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                              .temperatureLow,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .thermostat ==
                                                                  1
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .success
                                                              : Colors
                                                                  .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .thermostat ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              thermostat: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .thermostat ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .thermostat ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              thermostat: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .thermostat ==
                                                                  3
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .warning
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .thermostat ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              thermostat: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'fewzltem' /* 20h plus 7h… hhumm
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'br3eale2' /* Je démarre mes équipements pil... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                              .clock,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .night ==
                                                                  1
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .success
                                                              : Colors
                                                                  .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .night ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              night: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .night ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .night ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              night: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .night ==
                                                                  3
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .warning
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .night ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              night: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'v7nug5il' /* C’est pas Versailles ici !
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2bv6eish' /* Je veille à bien éteindre tout... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        child: Icon(
                                                          Icons.light_mode,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .lights ==
                                                                  1
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .success
                                                              : Colors
                                                                  .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .lights ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              lights: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .lights ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .lights ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              lights: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .lights ==
                                                                  3
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .warning
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .lights ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              lights: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
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
                                        expandIcon: FontAwesomeIcons.angleDown,
                                        collapseIcon: FontAwesomeIcons.angleUp,
                                        iconSize: 25.0,
                                        iconColor: FlutterFlowTheme.of(context)
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
                                    controller: _model.clothesController,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.tshirt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xhn5t0q9' /* Habits  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[4]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0j9k9sr6' /*  /  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[5]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
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
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'mtkfixhz' /* Elle est belle ta déco
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'sbw2ve56' /* Je sèche en majorité mes vêtem... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        child: Icon(
                                                          Icons.dry_cleaning,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              bodySuccessRecord
                                                                          .dry ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .success
                                                                  : Colors
                                                                      .transparent,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .check,
                                                            color: bodySuccessRecord
                                                                        .dry ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              dry: 1,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: bodySuccessRecord
                                                                      .dry ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : Colors
                                                                  .transparent,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: bodySuccessRecord
                                                                        .dry ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              dry: 2,
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              bodySuccessRecord
                                                                          .dry ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning
                                                                  : Colors
                                                                      .transparent,
                                                          icon: Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: bodySuccessRecord
                                                                        .dry ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await bodySuccessRecord.reference
                                                                .update(
                                                                    createSuccessRecordData(
                                                              dry: 3,
                                                            ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 2.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      CrossAxisAlignment.center,
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
                                                                    'zcjbhgzc' /* C’est une tâche de propre
 */
                                                                    ,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ixevomm9' /* Je lave uniquement mes vêtemen... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                .tachometerAlt,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord.cold ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .success
                                                                : Colors
                                                                    .transparent,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .check,
                                                              color: bodySuccessRecord
                                                                          .cold ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                cold: 1,
                                                              ));
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord
                                                                        .cold ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Colors
                                                                    .transparent,
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: bodySuccessRecord
                                                                          .cold ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                cold: 2,
                                                              ));
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord.cold ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning
                                                                : Colors
                                                                    .transparent,
                                                            icon: Icon(
                                                              Icons
                                                                  .not_interested,
                                                              color: bodySuccessRecord
                                                                          .cold ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                cold: 3,
                                                              ));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 2.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      CrossAxisAlignment.center,
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
                                                                    't470aret' /* “Etat presque quasiment neuf”
 */
                                                                    ,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'z3e6qkbi' /* J’achète majoritairement des v... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          child: Icon(
                                                            Icons.sell_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord.sell ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .success
                                                                : Colors
                                                                    .transparent,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .check,
                                                              color: bodySuccessRecord
                                                                          .sell ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                sell: 1,
                                                              ));
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord
                                                                        .sell ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Colors
                                                                    .transparent,
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: bodySuccessRecord
                                                                          .sell ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                sell: 2,
                                                              ));
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord.sell ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning
                                                                : Colors
                                                                    .transparent,
                                                            icon: Icon(
                                                              Icons
                                                                  .not_interested,
                                                              color: bodySuccessRecord
                                                                          .sell ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                sell: 3,
                                                              ));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 2.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      CrossAxisAlignment.center,
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
                                                                    't3yr2ili' /* Neuf d'occasion
 */
                                                                    ,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'mogtoxc5' /* Je dépose mes vêtements inutil... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          child: Icon(
                                                            Icons.light_mode,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord.second ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .success
                                                                : Colors
                                                                    .transparent,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .check,
                                                              color: bodySuccessRecord
                                                                          .second ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                second: 1,
                                                              ));
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord
                                                                        .second ==
                                                                    2
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Colors
                                                                    .transparent,
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: bodySuccessRecord
                                                                          .second ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                second: 2,
                                                              ));
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: bodySuccessRecord.second ==
                                                                    3
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning
                                                                : Colors
                                                                    .transparent,
                                                            icon: Icon(
                                                              Icons
                                                                  .not_interested,
                                                              color: bodySuccessRecord
                                                                          .second ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await bodySuccessRecord.reference
                                                                  .update(
                                                                      createSuccessRecordData(
                                                                second: 3,
                                                              ));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
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
                                        expandIcon: FontAwesomeIcons.angleDown,
                                        collapseIcon: FontAwesomeIcons.angleUp,
                                        iconSize: 25.0,
                                        iconColor: FlutterFlowTheme.of(context)
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
                                    controller: _model.applianceController,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.kitchen_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'teiwpcq7' /* Electroménager  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[6]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'bo36e2uo' /*  /  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[7]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'arlu92wq' /* Travaux en cours
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'iuyrbklh' /* Les succes seront bientôt impl... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                ].divide(const SizedBox(height: 5.0)),
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
                                        expandIcon: FontAwesomeIcons.angleDown,
                                        collapseIcon: FontAwesomeIcons.angleUp,
                                        iconSize: 25.0,
                                        iconColor: FlutterFlowTheme.of(context)
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
                                    controller: _model.furnitureController,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.couch,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3h0ygbh1' /* Mobilier  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[8]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zdqgp09w' /*  /  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[9]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  '5re7cxe5' /* Travaux en cours
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0nskongh' /* Les succes seront bientôt impl... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                ].divide(const SizedBox(height: 5.0)),
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
                                        expandIcon: FontAwesomeIcons.angleDown,
                                        collapseIcon: FontAwesomeIcons.angleUp,
                                        iconSize: 25.0,
                                        iconColor: FlutterFlowTheme.of(context)
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
                                    controller: _model.digitalController1,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.tv,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'klzvcvym' /* Numérique  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[10]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '152boczw' /*  /  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[11]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  'ty1hcxvx' /* Travaux en cours
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3ghhlf77' /* Les succes seront bientôt impl... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                ].divide(const SizedBox(height: 5.0)),
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
                                        expandIcon: FontAwesomeIcons.angleDown,
                                        collapseIcon: FontAwesomeIcons.angleUp,
                                        iconSize: 25.0,
                                        iconColor: FlutterFlowTheme.of(context)
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
                                    controller: _model.digitalController2,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.label,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1p6kory6' /* Objets  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[12]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'cfhqpfe9' /*  /  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        functions
                                                            .successStats(
                                                                bodySuccessRecord)[13]
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                                  '75gdby7w' /* Travaux en cours
 */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'y1dbmsy8' /* Les succes seront bientôt impl... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                ].divide(const SizedBox(height: 5.0)),
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
                                        expandIcon: FontAwesomeIcons.angleDown,
                                        collapseIcon: FontAwesomeIcons.angleUp,
                                        iconSize: 25.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
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
