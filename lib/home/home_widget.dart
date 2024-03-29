import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/energy_list_widget.dart';
import '../components/food_list_widget.dart';
import '../components/transport_list_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 70),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 70),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 70),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_PAGE_LOAD');
      logFirebaseEvent('Home_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('Home_update_local_state');
      setState(() => FFAppState().activeDate = dateTimeFormat(
            'd/M/y',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ));
      logFirebaseEvent('Home_update_local_state');
      setState(() => FFAppState().activeDateRelative = 0);
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 2,
              height: 2,
              child: SpinKitRing(
                color: Colors.transparent,
                size: 2,
              ),
            ),
          );
        }
        final homeUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
                          width: 2,
                          height: 2,
                          child: SpinKitRing(
                            color: Colors.transparent,
                            size: 2,
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: MediaQuery.of(context).size.height * 1,
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
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
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
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: SvgPicture.asset(
                                              'assets/images/menu.svg',
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/logo_light.png',
                                          width: 100,
                                          height: 40,
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
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Actions_ON_TAP');
                                              logFirebaseEvent(
                                                  'Actions_navigate_to');

                                              context.pushNamed('Statistiques');
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0x4DFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    color: Color(0x2C000000),
                                                    offset: Offset(0, 4),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1,
                                                ),
                                              ),
                                              child: InkWell(
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
                                                      .tertiaryColor,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Stats_ON_TAP');
                                              logFirebaseEvent(
                                                  'Stats_navigate_to');

                                              context.pushNamed('Statistiques');
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0x4DFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    color: Color(0x2C000000),
                                                    offset: Offset(0, 4),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.stacked_bar_chart,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Profil_ON_TAP');
                                              logFirebaseEvent(
                                                  'Profil_navigate_to');

                                              context.pushNamed('Profile');
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    color: Color(0x2C000000),
                                                    offset: Offset(0, 4),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    homeUsersRecord.photoUrl,
                                                    'https://storage.googleapis.com/carbonfight-89af6.appspot.com/default_photo_url.png',
                                                  ),
                                                  width: 50,
                                                  height: 50,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 800,
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
                                        height: 180,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 35,
                                              color: Color(0x0E000000),
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            CircularPercentIndicator(
                                              percent: functions.ratioScoreTotal(
                                                  functions.getActiveScore(
                                                      containerUsersStatsRecord!
                                                          .days!
                                                          .toList(),
                                                      FFAppState()
                                                          .activeDateRelative),
                                                  containerUsersStatsRecord!
                                                      .co2target),
                                              radius: 85,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  functions.progressBarColor(
                                                      functions.getActiveScore(
                                                          containerUsersStatsRecord!
                                                              .days!
                                                              .toList(),
                                                          FFAppState()
                                                              .activeDateRelative),
                                                      containerUsersStatsRecord!
                                                          .co2target),
                                              backgroundColor:
                                                  Color(0x98FFFFFF),
                                              center: Text(
                                                functions.printScore(
                                                    functions.getActiveScore(
                                                        containerUsersStatsRecord!
                                                            .days!
                                                            .toList(),
                                                        FFAppState()
                                                            .activeDateRelative)),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 25,
                                                    ),
                                              ),
                                              startAngle: 0,
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.3),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(45, 0, 45, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Objectif : ${valueOrDefault<String>(
                                                          functions.printScore(
                                                              containerUsersStatsRecord!
                                                                  .co2target),
                                                          '0',
                                                        )}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0, -0.35),
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
                                                          borderRadius: 30,
                                                          buttonSize: 30,
                                                          icon: Icon(
                                                            Icons.skip_previous,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .gray,
                                                            size: 15,
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
                                                          borderRadius: 30,
                                                          buttonSize: 30,
                                                          icon: Icon(
                                                            Icons.skip_previous,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            size: 15,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_previous_ON_TAP');
                                                            logFirebaseEvent(
                                                                'previous_update_local_state');
                                                            setState(() => FFAppState()
                                                                    .activeDate =
                                                                functions.setOneDayBefore(
                                                                    FFAppState()
                                                                        .activeDate));
                                                            logFirebaseEvent(
                                                                'previous_update_local_state');
                                                            setState(() => FFAppState()
                                                                    .activeDateRelative =
                                                                FFAppState()
                                                                        .activeDateRelative +
                                                                    1);
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                  Text(
                                                    FFAppState().activeDate,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontSize: 10,
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
                                                          borderRadius: 30,
                                                          buttonSize: 30,
                                                          icon: Icon(
                                                            Icons.skip_next,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            size: 15,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_next_ON_TAP');
                                                            logFirebaseEvent(
                                                                'next_update_local_state');
                                                            setState(() => FFAppState()
                                                                    .activeDate =
                                                                functions.setOneDayAfter(
                                                                    FFAppState()
                                                                        .activeDate));
                                                            logFirebaseEvent(
                                                                'next_update_local_state');
                                                            setState(() => FFAppState()
                                                                    .activeDateRelative =
                                                                FFAppState()
                                                                        .activeDateRelative +
                                                                    -1);
                                                          },
                                                        ),
                                                      if (FFAppState()
                                                              .activeDateRelative <=
                                                          0)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          buttonSize: 30,
                                                          icon: Icon(
                                                            Icons.skip_next,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .gray,
                                                            size: 15,
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
                                            16, 8, 16, 12),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xB3FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x2B202529),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
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
                                                                          8,
                                                                          4,
                                                                          0,
                                                                          4),
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
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Repas',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(functions.getActiveScore(
                                                                        containerUsersStatsRecord!
                                                                            .foodActionsDayCO2e!
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .activeDateRelative)),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(functions.getActiveScore(containerUsersStatsRecord!.foodActionsDayCO2e!.toList(), FFAppState().activeDateRelative), functions.getActiveScore(containerUsersStatsRecord!.days!.toList(), FFAppState().activeDateRelative))} de votre journée',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12,
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
                                                                          8,
                                                                          4,
                                                                          0,
                                                                          4),
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
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Repas récurrent',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(
                                                                        containerUsersStatsRecord!
                                                                            .foodPeriodicsCO2e),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(containerUsersStatsRecord!.foodPeriodicsCO2e, containerUsersStatsRecord!.allPeriodicsCO2e)} de vos émissions récurrentes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12,
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
                                                                  0, 2, 2, 0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/hot-pot.png',
                                                          width: 110,
                                                          height: 100,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 7, 8),
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
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: 600,
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
                                                                          40),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFF57636C),
                                                                size: 20,
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
                                                                            2,
                                                                        height:
                                                                            2,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2,
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
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            children: [
                                                                              if (foodsFoodActionsRecord.food == 'starter')
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_starterAction_ON_TAP');
                                                                                    logFirebaseEvent('starterAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_mainAction_ON_TAP');
                                                                                    logFirebaseEvent('mainAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_desertAction_ON_TAP');
                                                                                    logFirebaseEvent('desertAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_drinksAction_ON_TAP');
                                                                                    logFirebaseEvent('drinksAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_cheeseAction_ON_TAP');
                                                                                    logFirebaseEvent('cheeseAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_breadAction_ON_TAP');
                                                                                    logFirebaseEvent('breadAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_coffeeAction_ON_TAP');
                                                                                    logFirebaseEvent('coffeeAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Food',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          foodsFoodActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                        0, 0),
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
                                                                              2,
                                                                          height:
                                                                              2,
                                                                          child:
                                                                              SpinKitRing(
                                                                            color:
                                                                                Colors.transparent,
                                                                            size:
                                                                                2,
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
                                                                                40,
                                                                            height:
                                                                                40,
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              children: [
                                                                                if (foodPeriodicsFoodActionsRecord.food == 'starter')
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_starterPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('starterPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_mainPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('mainPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_desertPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('desertPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_drinksPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('drinksPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_cheesePeriodics_ON_TAP');
                                                                                      logFirebaseEvent('cheesePeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_breadPeriodics_ON_TAP');
                                                                                      logFirebaseEvent('breadPeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('HOME_PAGE_coffeePeriodics_ON_TAP');
                                                                                      logFirebaseEvent('coffeePeriodics_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Food',
                                                                                        queryParams: {
                                                                                          'actionRef': serializeParam(
                                                                                            foodPeriodicsFoodActionsRecord.reference,
                                                                                            ParamType.DocumentReference,
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
                                                                        40),
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
                                                              size: 20,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 20,
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
                                            16, 8, 16, 12),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xB3FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x2B202529),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
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
                                                                          8,
                                                                          4,
                                                                          0,
                                                                          4),
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
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Transports',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(functions.getActiveScore(
                                                                        containerUsersStatsRecord!
                                                                            .transportActionsDayCO2e!
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .activeDateRelative)),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(functions.getActiveScore(containerUsersStatsRecord!.transportActionsDayCO2e!.toList(), FFAppState().activeDateRelative), functions.getActiveScore(containerUsersStatsRecord!.days!.toList(), FFAppState().activeDateRelative))} de votre journée',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12,
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
                                                                          8,
                                                                          4,
                                                                          0,
                                                                          4),
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
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Transports récurrent',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(
                                                                        containerUsersStatsRecord!
                                                                            .transportPeriodicsCO2e),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(containerUsersStatsRecord!.transportPeriodicsCO2e, containerUsersStatsRecord!.allPeriodicsCO2e)} de vos émissions récurrentes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12,
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
                                                                  0, 2, 2, 0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/sport-car_(1).png',
                                                          width: 110,
                                                          height: 100,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 7, 8),
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
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: 600,
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
                                                                          40),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFF57636C),
                                                                size: 20,
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
                                                                            2,
                                                                        height:
                                                                            2,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2,
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
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            children: [
                                                                              if (transportsTransportActionsRecord.transport == 'car')
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_carAction_ON_TAP');
                                                                                    logFirebaseEvent('carAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('carAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('carAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('carAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_busAction_ON_TAP');
                                                                                    logFirebaseEvent('busAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('busAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('busAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('busAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_scooterAction_ON_TAP');
                                                                                    logFirebaseEvent('scooterAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('scooterAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('scooterAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('scooterAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_motoAction_ON_TAP');
                                                                                    logFirebaseEvent('motoAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('motoAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('motoAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('motoAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_trainAction_ON_TAP');
                                                                                    logFirebaseEvent('trainAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('trainAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('trainAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('trainAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_metroAction_ON_TAP');
                                                                                    logFirebaseEvent('metroAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('metroAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('metroAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('metroAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_flightAction_ON_TAP');
                                                                                    logFirebaseEvent('flightAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('flightAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('flightAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('flightAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_bikeAction_ON_TAP');
                                                                                    logFirebaseEvent('bikeAction_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('bikeAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('bikeAction_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = false);
                                                                                    logFirebaseEvent('bikeAction_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                            2,
                                                                        height:
                                                                            2,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2,
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
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (transportPeriodicsTransportActionsRecord.transport ==
                                                                                'car')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_carPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('carPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('carPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('carPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('carPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_busPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('busPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('busPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('busPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('busPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_scooterPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('scooterPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('scooterPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('scooterPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('scooterPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_motoPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('motoPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('motoPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('motoPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('motoPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_trainPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('trainPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('trainPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('trainPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('trainPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_metroPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('metroPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('metroPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('metroPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('metroPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_flightPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('flightPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('flightPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('flightPeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('flightPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_bikePeriodics_ON_TAP');
                                                                                    logFirebaseEvent('bikePeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayOptions = false);
                                                                                    logFirebaseEvent('bikePeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDates = false);
                                                                                    logFirebaseEvent('bikePeriodics_update_local_state');
                                                                                    setState(() => FFAppState().displayDays = true);
                                                                                    logFirebaseEvent('bikePeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Transport',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          transportPeriodicsTransportActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                        40),
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
                                                              size: 20,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 20,
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
                                            16, 8, 16, 12),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xB3FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x2B202529),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
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
                                                                          8,
                                                                          4,
                                                                          0,
                                                                          4),
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
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Énergie',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(functions.getActiveScore(
                                                                        containerUsersStatsRecord!
                                                                            .energyActionsDayCO2e!
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .activeDateRelative)),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(functions.getActiveScore(containerUsersStatsRecord!.energyActionsDayCO2e!.toList(), FFAppState().activeDateRelative), functions.getActiveScore(containerUsersStatsRecord!.days!.toList(), FFAppState().activeDateRelative))} de votre journée',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12,
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
                                                                          8,
                                                                          4,
                                                                          0,
                                                                          4),
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
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Énergie récurrentes',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions.printScore(
                                                                        containerUsersStatsRecord!
                                                                            .energyPeriodicsCO2e),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${functions.printRatioScoreTotal(containerUsersStatsRecord!.energyPeriodicsCO2e, containerUsersStatsRecord!.allPeriodicsCO2e)} de vos émissions récurrentes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              12,
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
                                                                  0, 2, 2, 0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/green-energy.png',
                                                          width: 110,
                                                          height: 100,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 7, 8),
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
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: 362,
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
                                                                          40),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Color(
                                                                    0xFF57636C),
                                                                size: 20,
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
                                                                            2,
                                                                        height:
                                                                            2,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2,
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
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          children: [
                                                                            if (energyEnergyActionsRecord.energy ==
                                                                                'electricity')
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_electricityAction_ON_TAP');
                                                                                  logFirebaseEvent('electricityAction_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Energies',
                                                                                    queryParams: {
                                                                                      'actionRef': serializeParam(
                                                                                        energyEnergyActionsRecord.reference,
                                                                                        ParamType.DocumentReference,
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
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_gasAction_ON_TAP');
                                                                                  logFirebaseEvent('gasAction_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Energies',
                                                                                    queryParams: {
                                                                                      'actionRef': serializeParam(
                                                                                        energyEnergyActionsRecord.reference,
                                                                                        ParamType.DocumentReference,
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
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_waterAction_ON_TAP');
                                                                                  logFirebaseEvent('waterAction_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Energies',
                                                                                    queryParams: {
                                                                                      'actionRef': serializeParam(
                                                                                        energyEnergyActionsRecord.reference,
                                                                                        ParamType.DocumentReference,
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
                                                                            2,
                                                                        height:
                                                                            2,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              Colors.transparent,
                                                                          size:
                                                                              2,
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
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (energyPeriodicsEnergyActionsRecord.energy ==
                                                                                'electricity')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_electricityPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('electricityPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Energies',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          energyPeriodicsEnergyActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_gasPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('gasPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Energies',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          energyPeriodicsEnergyActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_waterPeriodics_ON_TAP');
                                                                                    logFirebaseEvent('waterPeriodics_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Energies',
                                                                                      queryParams: {
                                                                                        'actionRef': serializeParam(
                                                                                          energyPeriodicsEnergyActionsRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                        40),
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
                                                              size: 20,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons.threesixty,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 20,
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
