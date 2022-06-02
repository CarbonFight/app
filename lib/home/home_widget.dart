import '../account/account_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/energy_list_widget.dart';
import '../components/food_list_widget.dart';
import '../components/transport_list_widget.dart';
import '../drawer/drawer_widget.dart';
import '../energies/energies_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../food/food_widget.dart';
import '../statistiques/statistiques_widget.dart';
import '../transport/transport_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_PAGE_LOAD');
      logFirebaseEvent('Home_Update-Local-State');
      setState(() =>
          FFAppState().activeDate = dateTimeFormat('yMd', getCurrentTimestamp));
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final homeUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: StreamBuilder<List<UsersStatsRecord>>(
            stream: queryUsersStatsRecord(
              queryBuilder: (usersStatsRecord) =>
                  usersStatsRecord.where('uid', isEqualTo: currentUserUid),
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
                  snapshot.data;
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
                      'assets/images/Final_Concept_1.jpg',
                    ).image,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF0F86D9), Color(0x0023D0C1)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0x0000A193), Color(0xCB0EBAA1)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_Container_0enn42xz_ON_TAP');
                                    logFirebaseEvent('Container_Navigate-To');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: DrawerWidget(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    alignment: AlignmentDirectional(0, 0),
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
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Container_gcuzh7sp_ON_TAP');
                                logFirebaseEvent('Container_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: AccountWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
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
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    width: 1,
                                  ),
                                ),
                                child: AuthUserStreamWidget(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/carbonfight-89af6.appspot.com/o/18275220161537356156-128.png?alt=media&token=c9797a03-bba1-46b8-aaac-4c54cb99fcb6',
                                      ),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.9),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40,
                                      color: Color(0x99FFFFFF),
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Container(
                                width: 310,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Container_ol5sejov_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
                                            child: HomeWidget(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .gronyLight,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/actions.svg',
                                                width: 18,
                                                height: 18,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  'Actions',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Container_a2kikzom_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
                                            child: StatistiquesWidget(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/statics-green.svg',
                                                width: 18,
                                                height: 18,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  'Statistiques',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gronyLight,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.35),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 600,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                        child: PageView(
                                          controller: pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x23FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 35,
                                                    color: Color(0x0E000000),
                                                    offset: Offset(0, 10),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 2),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      child:
                                                          CircularPercentIndicator(
                                                        percent: functions.ratioScoreGoal(
                                                            containerUsersStatsRecord
                                                                .day0,
                                                            'day',
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.co2target,
                                                                0)),
                                                        radius: 100,
                                                        lineWidth: 18,
                                                        animation: true,
                                                        progressColor:
                                                            Color(0xB30B1E1B),
                                                        backgroundColor:
                                                            Color(0x98FFFFFF),
                                                        center: Text(
                                                          functions.printScore(
                                                              containerUsersStatsRecord
                                                                  .day0),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title2
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                fontSize: 32,
                                                              ),
                                                        ),
                                                        startAngle: 0,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -0.4),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(45, 0,
                                                                    45, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Aujourd\'hui',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .gronyLighter,
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.4),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(45, 0,
                                                                    45, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child: Text(
                                                                  'Objectif : ${valueOrDefault<String>(
                                                                    functions.printTarget(
                                                                        'day',
                                                                        valueOrDefault(
                                                                            currentUserDocument?.co2target,
                                                                            0)),
                                                                    '0',
                                                                  )}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x23FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 35,
                                                    color: Color(0x0E000000),
                                                    offset: Offset(0, 10),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                children: [
                                                  AuthUserStreamWidget(
                                                    child:
                                                        CircularPercentIndicator(
                                                      percent: functions.ratioScoreGoal(
                                                          containerUsersStatsRecord
                                                              .week0,
                                                          'week',
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.co2target,
                                                              0)),
                                                      radius: 100,
                                                      lineWidth: 18,
                                                      animation: true,
                                                      progressColor:
                                                          Color(0xB30B1E1B),
                                                      backgroundColor:
                                                          Color(0x98FFFFFF),
                                                      center: Text(
                                                        functions.printScore(
                                                            containerUsersStatsRecord
                                                                .week0),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontSize: 32,
                                                                ),
                                                      ),
                                                      startAngle: 0,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, -0.4),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  45, 0, 45, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Cette semaine',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .gronyLighter,
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0.4),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  45, 0, 45, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                AuthUserStreamWidget(
                                                              child: Text(
                                                                'Objectif : ${valueOrDefault<String>(
                                                                  functions.printTarget(
                                                                      'week',
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.co2target,
                                                                          0)),
                                                                  '0',
                                                                )}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x23FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 35,
                                                    color: Color(0x0E000000),
                                                    offset: Offset(0, 10),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                width: 100,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      child:
                                                          CircularPercentIndicator(
                                                        percent: functions.ratioScoreGoal(
                                                            containerUsersStatsRecord
                                                                .month0,
                                                            'month',
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.co2target,
                                                                0)),
                                                        radius: 100,
                                                        lineWidth: 18,
                                                        animation: true,
                                                        progressColor:
                                                            Color(0xB30B1E1B),
                                                        backgroundColor:
                                                            Color(0x98FFFFFF),
                                                        center: Text(
                                                          functions.printScore(
                                                              containerUsersStatsRecord
                                                                  .month0),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title2
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                fontSize: 32,
                                                              ),
                                                        ),
                                                        startAngle: 0,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -0.4),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(120,
                                                                    0, 120, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Ce mois',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .gronyLighter,
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.4),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(45, 0,
                                                                    45, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child: Text(
                                                                  'Objectif : ${valueOrDefault<String>(
                                                                    functions.printTarget(
                                                                        'month',
                                                                        valueOrDefault(
                                                                            currentUserDocument?.co2target,
                                                                            0)),
                                                                    '0',
                                                                  )}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: SmoothPageIndicator(
                                          controller: pageViewController ??=
                                              PageController(initialPage: 0),
                                          count: 3,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            pageViewController.animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: ExpandingDotsEffect(
                                            expansionFactor: 4,
                                            spacing: 8,
                                            radius: 16,
                                            dotWidth: 8,
                                            dotHeight: 8,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .gronyLighter,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 20, 40, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 7, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Repasbtn_ON_TAP');
                                              logFirebaseEvent(
                                                  'Repasbtn_Bottom-Sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: Color(0xBF000000),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height: 600,
                                                      child: FoodListWidget(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                color: Color(0x9FFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25,
                                                    color: Color(0x0C000000),
                                                    offset: Offset(0, 10),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 5),
                                                    child: Image.asset(
                                                      'assets/images/diet.png',
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Repas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 11,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_EnergiesBtn_ON_TAP');
                                            logFirebaseEvent(
                                                'EnergiesBtn_Bottom-Sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0xBF000000),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height: 600,
                                                    child:
                                                        TransportListWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 90,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              color: Color(0x99FFFFFF),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25,
                                                  color: Color(0x0C000000),
                                                  offset: Offset(0, 10),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: Image.asset(
                                                    'assets/images/vehicles.png',
                                                    width: 50,
                                                    height: 50,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Transports',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 11,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_EnergiesBtn_ON_TAP');
                                              logFirebaseEvent(
                                                  'EnergiesBtn_Bottom-Sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: Color(0xBF000000),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height: 362,
                                                      child: EnergyListWidget(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                color: Color(0x98FFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25,
                                                    color: Color(0x0C000000),
                                                    offset: Offset(0, 10),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 5),
                                                    child: Image.asset(
                                                      'assets/images/utility.png',
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Energies',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 11,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  if (FFAppState().actionActive ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 170,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x9F00A193),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 5, 15, 5),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_PAGE_date_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'date_Update-Local-State');
                                                                        setState(() =>
                                                                            FFAppState().activeDate =
                                                                                functions.setOneDayBefore(FFAppState().activeDate));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .chevron_left_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Vos actions du ${FFAppState().activeDate}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_PAGE_date_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'date_Update-Local-State');
                                                                        setState(() =>
                                                                            FFAppState().activeDate =
                                                                                functions.setOneDayAfter(FFAppState().activeDate));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .navigate_next,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  TransportActionsRecord>>(
                                                            stream:
                                                                queryTransportActionsRecord(
                                                              queryBuilder: (transportActionsRecord) => transportActionsRecord
                                                                  .where(
                                                                      'userId',
                                                                      isEqualTo:
                                                                          currentUserUid)
                                                                  .where('day',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .activeDate)
                                                                  .where(
                                                                      'isPeriodic',
                                                                      isEqualTo:
                                                                          false)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
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
                                                                    width: 2,
                                                                    height: 2,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: Colors
                                                                          .transparent,
                                                                      size: 2,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<TransportActionsRecord>
                                                                  transportsTransportActionsRecordList =
                                                                  snapshot.data;
                                                              if (transportsTransportActionsRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/dust.png',
                                                                    width: 40,
                                                                  ),
                                                                );
                                                              }
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
                                                                        transportsTransportActionsRecordList[
                                                                            transportsIndex];
                                                                    return Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'car')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_carAction_ON_TAP');
                                                                                logFirebaseEvent('carAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'bus')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_busAction_ON_TAP');
                                                                                logFirebaseEvent('busAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'scooter')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_scooterAction_ON_TAP');
                                                                                logFirebaseEvent('scooterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'moto')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_motoAction_ON_TAP');
                                                                                logFirebaseEvent('motoAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'train')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_trainAction_ON_TAP');
                                                                                logFirebaseEvent('trainAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'metro')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_metroAction_ON_TAP');
                                                                                logFirebaseEvent('metroAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'flight')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_flightAction_ON_TAP');
                                                                                logFirebaseEvent('flightAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((transportsTransportActionsRecord.transport) ==
                                                                              'bike')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_bikeAction_ON_TAP');
                                                                                logFirebaseEvent('bikeAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: transportsTransportActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  EnergyActionsRecord>>(
                                                            stream:
                                                                queryEnergyActionsRecord(
                                                              queryBuilder: (energyActionsRecord) => energyActionsRecord
                                                                  .where(
                                                                      'userId',
                                                                      isEqualTo:
                                                                          currentUserUid)
                                                                  .where('day',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .activeDate)
                                                                  .where(
                                                                      'isPeriodic',
                                                                      isEqualTo:
                                                                          false)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
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
                                                                    width: 2,
                                                                    height: 2,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: Colors
                                                                          .transparent,
                                                                      size: 2,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<EnergyActionsRecord>
                                                                  energyEnergyActionsRecordList =
                                                                  snapshot.data;
                                                              if (energyEnergyActionsRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/dust.png',
                                                                    width: 40,
                                                                  ),
                                                                );
                                                              }
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
                                                                      energyEnergyActionsRecordList
                                                                          .length,
                                                                      (energyIndex) {
                                                                    final energyEnergyActionsRecord =
                                                                        energyEnergyActionsRecordList[
                                                                            energyIndex];
                                                                    return Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if ((energyEnergyActionsRecord.energy) ==
                                                                              'electricity')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_electricityAction_ON_TAP');
                                                                                logFirebaseEvent('electricityAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: EnergiesWidget(
                                                                                      actionRef: energyEnergyActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((energyEnergyActionsRecord.energy) ==
                                                                              'gaz')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_gazAction_ON_TAP');
                                                                                logFirebaseEvent('gazAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: EnergiesWidget(
                                                                                      actionRef: energyEnergyActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((energyEnergyActionsRecord.energy) ==
                                                                              'water')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_waterAction_ON_TAP');
                                                                                logFirebaseEvent('waterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: EnergiesWidget(
                                                                                      actionRef: energyEnergyActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
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
                                                                  .where('day',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .activeDate)
                                                                  .where(
                                                                      'isPeriodic',
                                                                      isEqualTo:
                                                                          false)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
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
                                                                    width: 2,
                                                                    height: 2,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: Colors
                                                                          .transparent,
                                                                      size: 2,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<FoodActionsRecord>
                                                                  foodsFoodActionsRecordList =
                                                                  snapshot.data;
                                                              if (foodsFoodActionsRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/dust.png',
                                                                    width: 40,
                                                                  ),
                                                                );
                                                              }
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
                                                                        foodsFoodActionsRecordList[
                                                                            foodsIndex];
                                                                    return Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'starter')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_starterAction_ON_TAP');
                                                                                logFirebaseEvent('starterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'main')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_mainAction_ON_TAP');
                                                                                logFirebaseEvent('mainAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'desert')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_desertAction_ON_TAP');
                                                                                logFirebaseEvent('desertAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'drinks')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_drinksAction_ON_TAP');
                                                                                logFirebaseEvent('drinksAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'cheese')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_cheeseAction_ON_TAP');
                                                                                logFirebaseEvent('cheeseAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'bread')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_breadAction_ON_TAP');
                                                                                logFirebaseEvent('breadAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'coffee')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_coffeeAction_ON_TAP');
                                                                                logFirebaseEvent('coffeeAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (!(FFAppState().actionActive) ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xA9F77303),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 5, 15, 5),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Text(
                                                                  'Emissions hebdomadaires : ${functions.printScore(containerUsersStatsRecord.periodics)}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                TransportActionsRecord>>(
                                                          stream:
                                                              queryTransportActionsRecord(
                                                            queryBuilder: (transportActionsRecord) =>
                                                                transportActionsRecord
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
                                                                child: SizedBox(
                                                                  width: 2,
                                                                  height: 2,
                                                                  child:
                                                                      SpinKitRing(
                                                                    color: Colors
                                                                        .transparent,
                                                                    size: 2,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TransportActionsRecord>
                                                                transportsTransportActionsRecordList =
                                                                snapshot.data;
                                                            if (transportsTransportActionsRecordList
                                                                .isEmpty) {
                                                              return Image
                                                                  .asset(
                                                                'assets/images/dust.png',
                                                                width: 40,
                                                                height: 40,
                                                              );
                                                            }
                                                            return Row(
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
                                                                    transportsTransportActionsRecordList[
                                                                        transportsIndex];
                                                                return Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  child: Stack(
                                                                    children: [
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'car')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_carPeriodics_ON_TAP');
                                                                              logFirebaseEvent('carPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'bus')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_busPeriodics_ON_TAP');
                                                                              logFirebaseEvent('busPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'scooter')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_scooterPeriodics_ON_TAP');
                                                                              logFirebaseEvent('scooterPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'moto')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_motoPeriodics_ON_TAP');
                                                                              logFirebaseEvent('motoPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'train')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_trainPeriodics_ON_TAP');
                                                                              logFirebaseEvent('trainPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'metro')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_metroPeriodics_ON_TAP');
                                                                              logFirebaseEvent('metroPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'flight')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_flightPeriodics_ON_TAP');
                                                                              logFirebaseEvent('flightPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((transportsTransportActionsRecord
                                                                              .transport) ==
                                                                          'bike')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_bikePeriodics_ON_TAP');
                                                                              logFirebaseEvent('bikePeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: TransportWidget(
                                                                                    actionRef: transportsTransportActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                        StreamBuilder<
                                                            List<
                                                                EnergyActionsRecord>>(
                                                          stream:
                                                              queryEnergyActionsRecord(
                                                            queryBuilder: (energyActionsRecord) =>
                                                                energyActionsRecord
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
                                                                child: SizedBox(
                                                                  width: 2,
                                                                  height: 2,
                                                                  child:
                                                                      SpinKitRing(
                                                                    color: Colors
                                                                        .transparent,
                                                                    size: 2,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<EnergyActionsRecord>
                                                                energyEnergyActionsRecordList =
                                                                snapshot.data;
                                                            if (energyEnergyActionsRecordList
                                                                .isEmpty) {
                                                              return Image
                                                                  .asset(
                                                                'assets/images/dust.png',
                                                                width: 40,
                                                                height: 40,
                                                              );
                                                            }
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
                                                                  width: 40,
                                                                  height: 40,
                                                                  child: Stack(
                                                                    children: [
                                                                      if ((energyEnergyActionsRecord
                                                                              .energy) ==
                                                                          'electricity')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_electricityPeriodics_ON_TAP');
                                                                              logFirebaseEvent('electricityPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: EnergiesWidget(
                                                                                    actionRef: energyEnergyActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((energyEnergyActionsRecord
                                                                              .energy) ==
                                                                          'gas')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_gasPeriodics_ON_TAP');
                                                                              logFirebaseEvent('gasPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: EnergiesWidget(
                                                                                    actionRef: energyEnergyActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                                      if ((energyEnergyActionsRecord
                                                                              .energy) ==
                                                                          'water')
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_waterPeriodics_ON_TAP');
                                                                              logFirebaseEvent('waterPeriodics_Navigate-To');
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                  reverseDuration: Duration(milliseconds: 0),
                                                                                  child: EnergiesWidget(
                                                                                    actionRef: energyEnergyActionsRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
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
                                                                          true)
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
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
                                                                    width: 2,
                                                                    height: 2,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: Colors
                                                                          .transparent,
                                                                      size: 2,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<FoodActionsRecord>
                                                                  foodsFoodActionsRecordList =
                                                                  snapshot.data;
                                                              if (foodsFoodActionsRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/dust.png',
                                                                    width: 40,
                                                                  ),
                                                                );
                                                              }
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
                                                                        foodsFoodActionsRecordList[
                                                                            foodsIndex];
                                                                    return Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'starter')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_starterAction_ON_TAP');
                                                                                logFirebaseEvent('starterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'main')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_mainAction_ON_TAP');
                                                                                logFirebaseEvent('mainAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'desert')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_desertAction_ON_TAP');
                                                                                logFirebaseEvent('desertAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'drinks')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_drinksAction_ON_TAP');
                                                                                logFirebaseEvent('drinksAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'cheese')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_cheeseAction_ON_TAP');
                                                                                logFirebaseEvent('cheeseAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'bread')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_breadAction_ON_TAP');
                                                                                logFirebaseEvent('breadAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                                                                          if ((foodsFoodActionsRecord.food) ==
                                                                              'coffee')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_coffeeAction_ON_TAP');
                                                                                logFirebaseEvent('coffeeAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodsFoodActionsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 40,
                                                                                height: 40,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      if ((FFAppState().actionActive) == false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 1, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_Text_oij3eqfy_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_Update-Local-State');
                                                    setState(() => FFAppState()
                                                        .actionActive = true);
                                                  },
                                                  child: Text(
                                                    'Actions ',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.alarm_add_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      if ((FFAppState().actionActive) == true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_Text_qdgwfwwm_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Text_Update-Local-State');
                                                  setState(() => FFAppState()
                                                      .actionActive = false);
                                                },
                                                child: Text(
                                                  'Actions récurrentes',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.update,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
