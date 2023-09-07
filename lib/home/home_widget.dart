import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/energy_list_widget.dart';
import '/components/food_list_widget.dart';
import '/components/transport_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_INIT_STATE');
      logFirebaseEvent('Home_update_app_state');
      FFAppState().update(() {
        FFAppState().activeDate = dateTimeFormat(
          'd/M/y',
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        );
        FFAppState().activeDateRelative = 0;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 2.0,
                height: 2.0,
                child: SpinKitRing(
                  color: Colors.transparent,
                  size: 2.0,
                ),
              ),
            ),
          );
        }
        final homeUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<UsersStatsRecord>>(
                  stream: queryUsersStatsRecord(
                    queryBuilder: (usersStatsRecord) => usersStatsRecord
                        .where('uid', isEqualTo: currentUserUid),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 2.0,
                          height: 2.0,
                          child: SpinKitRing(
                            color: Colors.transparent,
                            size: 2.0,
                          ),
                        ),
                      );
                    }
                    List<UsersStatsRecord> containerUsersStatsRecordList =
                        snapshot.data!;
                    final containerUsersStatsRecord =
                        containerUsersStatsRecordList.isNotEmpty
                            ? containerUsersStatsRecordList.first
                            : null;
                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                        maxHeight: MediaQuery.sizeOf(context).height * 1.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Final_Concept_flou.jpg',
                          ).image,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.00, 1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_Container_605qgwvv_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'Drawer',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: SvgPicture.asset(
                                              'assets/images/menu.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/logo_light.png',
                                          width: 100.0,
                                          height: 40.0,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Actions_ON_TAP');
                                              logFirebaseEvent(
                                                  'Actions_navigate_to');

                                              context.pushNamed('Statistiques');
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x4DFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10.0,
                                                    color: Color(0x2C000000),
                                                    offset: Offset(0.0, 4.0),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_Icon_20s4at3u_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_navigate_to');

                                                  context.pushNamed('Home');
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Stats_ON_TAP');
                                              logFirebaseEvent(
                                                  'Stats_navigate_to');

                                              context.pushNamed('Statistiques');
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x4DFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10.0,
                                                    color: Color(0x2C000000),
                                                    offset: Offset(0.0, 4.0),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.stacked_bar_chart,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Profil_ON_TAP');
                                              logFirebaseEvent(
                                                  'Profil_navigate_to');

                                              context.pushNamed('Profile');
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10.0,
                                                    color: Color(0x2C000000),
                                                    offset: Offset(0.0, 4.0),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    homeUsersRecord.photoUrl,
                                                    'https://storage.googleapis.com/carbonfight-89af6.appspot.com/default_photo_url.png',
                                                  ),
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 800.0,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 180.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 35.0,
                                              color: Color(0x0E000000),
                                              offset: Offset(0.0, 10.0),
                                            )
                                          ],
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            CircularPercentIndicator(
                                              percent: functions.ratioScoreTotal(
                                                  functions.getActiveScore(
                                                      containerUsersStatsRecord
                                                          ?.days
                                                          ?.toList(),
                                                      FFAppState()
                                                          .activeDateRelative),
                                                  containerUsersStatsRecord
                                                      ?.co2target),
                                              radius: 85.0,
                                              lineWidth: 18.0,
                                              animation: true,
                                              progressColor:
                                                  functions.progressBarColor(
                                                      functions.getActiveScore(
                                                          containerUsersStatsRecord
                                                              ?.days
                                                              ?.toList(),
                                                          FFAppState()
                                                              .activeDateRelative),
                                                      containerUsersStatsRecord
                                                          ?.co2target),
                                              backgroundColor:
                                                  Color(0x98FFFFFF),
                                              center: Text(
                                                functions.printScore(
                                                    functions.getActiveScore(
                                                        containerUsersStatsRecord
                                                            ?.days
                                                            ?.toList(),
                                                        FFAppState()
                                                            .activeDateRelative)),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 25.0,
                                                    ),
                                              ),
                                              startAngle: 0.0,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.30),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        45.0, 0.0, 45.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Objectif : ${valueOrDefault<String>(
                                                          functions.printScore(
                                                              containerUsersStatsRecord
                                                                  ?.co2target),
                                                          '0',
                                                        )}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, -0.35),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      if (FFAppState()
                                                              .activeDateRelative >=
                                                          6)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          buttonSize: 30.0,
                                                          icon: Icon(
                                                            Icons.skip_previous,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .gray,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'previousDisabled pressed ...');
                                                          },
                                                        ),
                                                      if (FFAppState()
                                                              .activeDateRelative <
                                                          6)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          buttonSize: 30.0,
                                                          icon: Icon(
                                                            Icons.skip_previous,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_previous_ON_TAP');
                                                            logFirebaseEvent(
                                                                'previous_update_app_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .activeDate =
                                                                  functions.setOneDayBefore(
                                                                      FFAppState()
                                                                          .activeDate);
                                                              FFAppState()
                                                                      .activeDateRelative =
                                                                  FFAppState()
                                                                          .activeDateRelative +
                                                                      1;
                                                            });
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                  Text(
                                                    FFAppState().activeDate,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 10.0,
                                                        ),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      if (FFAppState()
                                                              .activeDateRelative >
                                                          0)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          buttonSize: 30.0,
                                                          icon: Icon(
                                                            Icons.skip_next,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_next_ON_TAP');
                                                            logFirebaseEvent(
                                                                'next_update_app_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .activeDate =
                                                                  functions.setOneDayAfter(
                                                                      FFAppState()
                                                                          .activeDate);
                                                              FFAppState()
                                                                      .activeDateRelative =
                                                                  FFAppState()
                                                                          .activeDateRelative +
                                                                      -1;
                                                            });
                                                          },
                                                        ),
                                                      if (FFAppState()
                                                              .activeDateRelative <=
                                                          0)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          buttonSize: 30.0,
                                                          icon: Icon(
                                                            Icons.skip_next,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .gray,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'nextDisabled pressed ...');
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xB3FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          if (FFAppState()
                                                              .displayFoodActions)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Repas',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(functions.getActiveScore(
                                                                        containerUsersStatsRecord
                                                                            ?.foodActionsDayCO2e
                                                                            ?.toList(),
                                                                        FFAppState()
                                                                            .activeDateRelative)),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(functions.getActiveScore(containerUsersStatsRecord?.foodActionsDayCO2e?.toList(), FFAppState().activeDateRelative), functions.getActiveScore(containerUsersStatsRecord?.days?.toList(), FFAppState().activeDateRelative))} de votre journée',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (!FFAppState()
                                                              .displayFoodActions)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Repas récurrent',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(
                                                                        containerUsersStatsRecord
                                                                            ?.foodPeriodicsCO2e),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(containerUsersStatsRecord?.foodPeriodicsCO2e, containerUsersStatsRecord?.allPeriodicsCO2e)} de vos émissions récurrentes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/hot-pot.png',
                                                          width: 110.0,
                                                          height: 100.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 7.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_Card_pbhld83j_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Card_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0xBF000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        600.0,
                                                                    child:
                                                                        FoodListWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: Color(
                                                                0xFFF1F4F8),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFF57636C),
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (FFAppState()
                                                                .displayFoodActions)
                                                              StreamBuilder<
                                                                  List<
                                                                      FoodActionsRecord>>(
                                                                stream:
                                                                    queryFoodActionsRecord(
                                                                  queryBuilder: (foodActionsRecord) => foodActionsRecord
                                                                      .where(
                                                                          'userId',
                                                                          isEqualTo:
                                                                              currentUserUid)
                                                                      .where(
                                                                          'day',
                                                                          isEqualTo: FFAppState()
                                                                              .activeDate)
                                                                      .where(
                                                                          'isPeriodic',
                                                                          isEqualTo:
                                                                              false)
                                                                      .orderBy(
                                                                          'created_time'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            2.0,
                                                                        height:
                                                                            2.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<FoodActionsRecord>
                                                                      foodsFoodActionsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: List.generate(
                                                                          foodsFoodActionsRecordList
                                                                              .length,
                                                                          (foodsIndex) {
                                                                        final foodsFoodActionsRecord =
                                                                            foodsFoodActionsRecordList[foodsIndex];
                                                                        return Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            children: [
                                                                              if (foodsFoodActionsRecord.food == 'starter')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_starterAction_ON_TAP');
                                                                                    logFirebaseEvent('starterAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'starter',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/canape_(1).png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (foodsFoodActionsRecord.food == 'main')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_mainAction_ON_TAP');
                                                                                    logFirebaseEvent('mainAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'main',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/steak.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (foodsFoodActionsRecord.food == 'desert')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_desertAction_ON_TAP');
                                                                                    logFirebaseEvent('desertAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'desert',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/ice-cream.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (foodsFoodActionsRecord.food == 'drinks')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_drinksAction_ON_TAP');
                                                                                    logFirebaseEvent('drinksAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'drinks',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/soft-drink.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (foodsFoodActionsRecord.food == 'cheese')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_cheeseAction_ON_TAP');
                                                                                    logFirebaseEvent('cheeseAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'cheese',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/cheeses.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (foodsFoodActionsRecord.food == 'bread')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_breadAction_ON_TAP');
                                                                                    logFirebaseEvent('breadAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'bread',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/bread.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (foodsFoodActionsRecord.food == 'coffee')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_coffeeAction_ON_TAP');
                                                                                    logFirebaseEvent('coffeeAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'food',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'coffee',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/coffee.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            if (!FFAppState()
                                                                .displayFoodActions)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        FoodActionsRecord>>(
                                                                  stream:
                                                                      queryFoodActionsRecord(
                                                                    queryBuilder: (foodActionsRecord) => foodActionsRecord
                                                                        .where(
                                                                            'userId',
                                                                            isEqualTo:
                                                                                currentUserUid)
                                                                        .where(
                                                                            'isPeriodic',
                                                                            isEqualTo:
                                                                                true),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              2.0,
                                                                          height:
                                                                              2.0,
                                                                          child:
                                                                              SpinKitRing(
                                                                            color:
                                                                                Colors.transparent,
                                                                            size:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<FoodActionsRecord>
                                                                        foodPeriodicsFoodActionsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: List.generate(
                                                                            foodPeriodicsFoodActionsRecordList.length,
                                                                            (foodPeriodicsIndex) {
                                                                          final foodPeriodicsFoodActionsRecord =
                                                                              foodPeriodicsFoodActionsRecordList[foodPeriodicsIndex];
                                                                          return Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              children: [
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'starter')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_starterPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('starterPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'starter',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/canape_(1).png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'main')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_mainPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('mainPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'main',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/steak.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'desert')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_desertPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('desertPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'desert',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/ice-cream.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'drinks')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_drinksPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('drinksPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'drinks',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/soft-drink.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'cheese')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_cheesePeriodics_ON_TAP');
                                                                                      logFirebaseEvent('cheesePeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'cheese',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/cheeses.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'bread')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_breadPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('breadPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'bread',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/bread.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'coffee')
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_coffeePeriodics_ON_TAP');
                                                                                      logFirebaseEvent('coffeePeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParameters: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            'food',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'action': serializeParam(
                                                                                            'coffee',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/coffee.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              setState(() => FFAppState()
                                                                      .displayFoodActions =
                                                                  !FFAppState()
                                                                      .displayFoodActions);
                                                            },
                                                            value: FFAppState()
                                                                .displayFoodActions,
                                                            onIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0x9857636C),
                                                              size: 20.0,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xB3FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          if (FFAppState()
                                                              .displayTransportActions)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Transports',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(functions.getActiveScore(
                                                                        containerUsersStatsRecord
                                                                            ?.transportActionsDayCO2e
                                                                            ?.toList(),
                                                                        FFAppState()
                                                                            .activeDateRelative)),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(functions.getActiveScore(containerUsersStatsRecord?.transportActionsDayCO2e?.toList(), FFAppState().activeDateRelative), functions.getActiveScore(containerUsersStatsRecord?.days?.toList(), FFAppState().activeDateRelative))} de votre journée',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (!FFAppState()
                                                              .displayTransportActions)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Transports récurrent',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(
                                                                        containerUsersStatsRecord
                                                                            ?.transportPeriodicsCO2e),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(containerUsersStatsRecord?.transportPeriodicsCO2e, containerUsersStatsRecord?.allPeriodicsCO2e)} de vos émissions récurrentes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/sport-car_(1).png',
                                                          width: 110.0,
                                                          height: 100.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 7.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_Card_sk6gbsww_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Card_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0xBF000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        600.0,
                                                                    child:
                                                                        TransportListWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: Color(
                                                                0xFFF1F4F8),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFF57636C),
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (FFAppState()
                                                                .displayTransportActions)
                                                              StreamBuilder<
                                                                  List<
                                                                      TransportActionsRecord>>(
                                                                stream:
                                                                    queryTransportActionsRecord(
                                                                  queryBuilder: (transportActionsRecord) => transportActionsRecord
                                                                      .where(
                                                                          'userId',
                                                                          isEqualTo:
                                                                              currentUserUid)
                                                                      .where(
                                                                          'day',
                                                                          isEqualTo: FFAppState()
                                                                              .activeDate)
                                                                      .where(
                                                                          'isPeriodic',
                                                                          isEqualTo:
                                                                              false)
                                                                      .orderBy(
                                                                          'created_time'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            2.0,
                                                                        height:
                                                                            2.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TransportActionsRecord>
                                                                      transportsTransportActionsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: List.generate(
                                                                          transportsTransportActionsRecordList
                                                                              .length,
                                                                          (transportsIndex) {
                                                                        final transportsTransportActionsRecord =
                                                                            transportsTransportActionsRecordList[transportsIndex];
                                                                        return Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            children: [
                                                                              if (transportsTransportActionsRecord.transport == 'car')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_carAction_ON_TAP');
                                                                                    logFirebaseEvent('carAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('carAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('carAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'car',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-car-01.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'bus')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_busAction_ON_TAP');
                                                                                    logFirebaseEvent('busAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('busAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('busAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'bus',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-bus-02.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'scooter')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_scooterAction_ON_TAP');
                                                                                    logFirebaseEvent('scooterAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('scooterAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('scooterAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'scooter',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-motor-03.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'moto')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_motoAction_ON_TAP');
                                                                                    logFirebaseEvent('motoAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('motoAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('motoAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'moto',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/motorcycle.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'train')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_trainAction_ON_TAP');
                                                                                    logFirebaseEvent('trainAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('trainAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('trainAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'train',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-train-04.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'metro')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_metroAction_ON_TAP');
                                                                                    logFirebaseEvent('metroAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('metroAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('metroAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'metro',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-metro-06.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'flight')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_flightAction_ON_TAP');
                                                                                    logFirebaseEvent('flightAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('flightAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('flightAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'flight',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/aircraft.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (transportsTransportActionsRecord.transport == 'bike')
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_bikeAction_ON_TAP');
                                                                                    logFirebaseEvent('bikeAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('bikeAction_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = false;
                                                                                    });
                                                                                    logFirebaseEvent('bikeAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'bike',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-cycle-08.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            if (!FFAppState()
                                                                .displayTransportActions)
                                                              StreamBuilder<
                                                                  List<
                                                                      TransportActionsRecord>>(
                                                                stream:
                                                                    queryTransportActionsRecord(
                                                                  queryBuilder: (transportActionsRecord) => transportActionsRecord
                                                                      .where(
                                                                          'userId',
                                                                          isEqualTo:
                                                                              currentUserUid)
                                                                      .where(
                                                                          'isPeriodic',
                                                                          isEqualTo:
                                                                              true),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            2.0,
                                                                        height:
                                                                            2.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TransportActionsRecord>
                                                                      transportPeriodicsTransportActionsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: List.generate(
                                                                        transportPeriodicsTransportActionsRecordList
                                                                            .length,
                                                                        (transportPeriodicsIndex) {
                                                                      final transportPeriodicsTransportActionsRecord =
                                                                          transportPeriodicsTransportActionsRecordList[
                                                                              transportPeriodicsIndex];
                                                                      return Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'car')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_carPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('carPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('carPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('carPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'car',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-car-01.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'bus')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_busPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('busPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('busPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('busPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'bus',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-bus-02.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'scooter')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_scooterPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('scooterPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('scooterPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('scooterPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'scooter',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-motor-03.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'moto')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_motoPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('motoPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('motoPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('motoPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'moto',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/motorcycle.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'train')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_trainPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('trainPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('trainPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('trainPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'train',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-train-04.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'metro')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_metroPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('metroPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('metroPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('metroPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'metro',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-metro-06.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'flight')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_flightPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('flightPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('flightPeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('flightPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'flight',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/aircraft.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'bike')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_bikePeriodics_ON_TAP');
                                                                                    logFirebaseEvent('bikePeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayOptions = false;
                                                                                      FFAppState().displayDates = false;
                                                                                    });
                                                                                    logFirebaseEvent('bikePeriodics_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().displayDays = true;
                                                                                    });
                                                                                    logFirebaseEvent('bikePeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'transport',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'bike',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/trans-cycle-08.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              setState(() => FFAppState()
                                                                      .displayTransportActions =
                                                                  !FFAppState()
                                                                      .displayTransportActions);
                                                            },
                                                            value: FFAppState()
                                                                .displayTransportActions,
                                                            onIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0x9857636C),
                                                              size: 20.0,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xB3FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          if (FFAppState()
                                                              .displayEnergyActions)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Énergie',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(functions.getActiveScore(
                                                                        containerUsersStatsRecord
                                                                            ?.energyActionsDayCO2e
                                                                            ?.toList(),
                                                                        FFAppState()
                                                                            .activeDateRelative)),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(functions.getActiveScore(containerUsersStatsRecord?.energyActionsDayCO2e?.toList(), FFAppState().activeDateRelative), functions.getActiveScore(containerUsersStatsRecord?.days?.toList(), FFAppState().activeDateRelative))} de votre journée',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (!FFAppState()
                                                              .displayEnergyActions)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Énergie récurrentes',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(
                                                                        containerUsersStatsRecord
                                                                            ?.energyPeriodicsCO2e),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(containerUsersStatsRecord?.energyPeriodicsCO2e, containerUsersStatsRecord?.allPeriodicsCO2e)} de vos émissions récurrentes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/green-energy.png',
                                                          width: 110.0,
                                                          height: 100.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 7.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_Card_nhwa43an_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Card_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0xBF000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        362.0,
                                                                    child:
                                                                        EnergyListWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: Color(
                                                                0xFFF1F4F8),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFF57636C),
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (FFAppState()
                                                                .displayEnergyActions)
                                                              StreamBuilder<
                                                                  List<
                                                                      EnergyActionsRecord>>(
                                                                stream:
                                                                    queryEnergyActionsRecord(
                                                                  queryBuilder: (energyActionsRecord) => energyActionsRecord
                                                                      .where(
                                                                          'userId',
                                                                          isEqualTo:
                                                                              currentUserUid)
                                                                      .where(
                                                                          'day',
                                                                          isEqualTo: FFAppState()
                                                                              .activeDate)
                                                                      .where(
                                                                          'isPeriodic',
                                                                          isEqualTo:
                                                                              false)
                                                                      .orderBy(
                                                                          'created_time'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            2.0,
                                                                        height:
                                                                            2.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<EnergyActionsRecord>
                                                                      energyEnergyActionsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: List.generate(
                                                                        energyEnergyActionsRecordList
                                                                            .length,
                                                                        (energyIndex) {
                                                                      final energyEnergyActionsRecord =
                                                                          energyEnergyActionsRecordList[
                                                                              energyIndex];
                                                                      return Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          children: [
                                                                            if (energyEnergyActionsRecord.energy ==
                                                                                'electricity')
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_electricityAction_ON_TAP');
                                                                                  logFirebaseEvent('electricityAction_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Energies',
                                                                                    queryParameters: {
                                                                                      'actionRef': serializeParam(
                                                                                        energyEnergyActionsRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'category': serializeParam(
                                                                                        'energy',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'action': serializeParam(
                                                                                        'electricity',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.asset(
                                                                                    'assets/images/energy.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (energyEnergyActionsRecord.energy ==
                                                                                'gas')
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_gasAction_ON_TAP');
                                                                                  logFirebaseEvent('gasAction_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Energies',
                                                                                    queryParameters: {
                                                                                      'actionRef': serializeParam(
                                                                                        energyEnergyActionsRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'category': serializeParam(
                                                                                        'energy',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'action': serializeParam(
                                                                                        'gas',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.asset(
                                                                                    'assets/images/gas.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (energyEnergyActionsRecord.energy ==
                                                                                'water')
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_waterAction_ON_TAP');
                                                                                  logFirebaseEvent('waterAction_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Energies',
                                                                                    queryParameters: {
                                                                                      'actionRef': serializeParam(
                                                                                        energyEnergyActionsRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'category': serializeParam(
                                                                                        'energy',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'action': serializeParam(
                                                                                        'water',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.asset(
                                                                                    'assets/images/water-drop.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                            if (!FFAppState()
                                                                .displayEnergyActions)
                                                              StreamBuilder<
                                                                  List<
                                                                      EnergyActionsRecord>>(
                                                                stream:
                                                                    queryEnergyActionsRecord(
                                                                  queryBuilder: (energyActionsRecord) => energyActionsRecord
                                                                      .where(
                                                                          'userId',
                                                                          isEqualTo:
                                                                              currentUserUid)
                                                                      .where(
                                                                          'isPeriodic',
                                                                          isEqualTo:
                                                                              true),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            2.0,
                                                                        height:
                                                                            2.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<EnergyActionsRecord>
                                                                      energyPeriodicsEnergyActionsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: List.generate(
                                                                        energyPeriodicsEnergyActionsRecordList
                                                                            .length,
                                                                        (energyPeriodicsIndex) {
                                                                      final energyPeriodicsEnergyActionsRecord =
                                                                          energyPeriodicsEnergyActionsRecordList[
                                                                              energyPeriodicsIndex];
                                                                      return Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (energyPeriodicsEnergyActionsRecord.energy ==
                                                                                'electricity')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_electricityPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('electricityPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Energies',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          energyPeriodicsEnergyActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'energy',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'electricity',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/energy.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (energyPeriodicsEnergyActionsRecord.energy ==
                                                                                'gas')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_gasPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('gasPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Energies',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          energyPeriodicsEnergyActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'energy',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'gas',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/gas.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (energyPeriodicsEnergyActionsRecord.energy ==
                                                                                'water')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_waterPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('waterPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Energies',
                                                                                      queryParameters: {
                                                                                        'actionRef': serializeParam(
                                                                                          energyPeriodicsEnergyActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'category': serializeParam(
                                                                                          'energy',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'action': serializeParam(
                                                                                          'water',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/water-drop.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              setState(() => FFAppState()
                                                                      .displayEnergyActions =
                                                                  !FFAppState()
                                                                      .displayEnergyActions);
                                                            },
                                                            value: FFAppState()
                                                                .displayEnergyActions,
                                                            onIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0x9857636C),
                                                              size: 20.0,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
