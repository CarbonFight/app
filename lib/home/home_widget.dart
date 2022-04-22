import '../account/account_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bike_form_modify_widget.dart';
import '../components/bread_form_modify_widget.dart';
import '../components/bus_form_modify_widget.dart';
import '../components/car_form_modify_widget.dart';
import '../components/cheese_form_modify_widget.dart';
import '../components/coffee_form_modify_widget.dart';
import '../components/desert_form_modify_widget.dart';
import '../components/drinks_form_modify_widget.dart';
import '../components/electricity_form_action_modify_widget.dart';
import '../components/electricity_form_periodic_modify_widget.dart';
import '../components/energy_form_widget.dart';
import '../components/flight_form_modify_widget.dart';
import '../components/food_form_widget.dart';
import '../components/gaz_form_action_modify_widget.dart';
import '../components/gaz_form_periodic_modify_widget.dart';
import '../components/main_food_form_modify_widget.dart';
import '../components/metro_form_modify_widget.dart';
import '../components/moto_form_modify_widget.dart';
import '../components/scooter_form_modify_widget.dart';
import '../components/starter_form_modify_widget.dart';
import '../components/train_form_modify_widget.dart';
import '../components/transport_form_widget.dart';
import '../components/water_form_action_modif_widget.dart';
import '../components/water_form_periodic_modify_widget.dart';
import '../drawer/drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../statistiques/statistiques_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
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
  PageController pageView2Controller;
  PageController periodicsController;
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
                                    logFirebaseEvent('Container-ON_TAP');
                                    logFirebaseEvent('Container-Navigate-To');
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
                                logFirebaseEvent('Container-ON_TAP');
                                logFirebaseEvent('Container-Navigate-To');
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
                                        logFirebaseEvent('Container-ON_TAP');
                                        logFirebaseEvent(
                                            'Container-Navigate-To');
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeWidget(),
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
                                        logFirebaseEvent('Container-ON_TAP');
                                        logFirebaseEvent(
                                            'Container-Navigate-To');
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StatistiquesWidget(),
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
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                          percent: functions
                                                              .ratioScoreGoal(
                                                                  containerUsersStatsRecord
                                                                      .day0,
                                                                  'day',
                                                                  currentUserDocument
                                                                      ?.co2target),
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
                                                                  .fromSTEB(45,
                                                                      0, 45, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  .fromSTEB(45,
                                                                      0, 45, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  child: Text(
                                                                    'Objectif : ${valueOrDefault<String>(
                                                                      functions.printTarget(
                                                                          'day',
                                                                          currentUserDocument
                                                                              ?.co2target),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
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
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      child:
                                                          CircularPercentIndicator(
                                                        percent: functions
                                                            .ratioScoreGoal(
                                                                containerUsersStatsRecord
                                                                    .week0,
                                                                'week',
                                                                currentUserDocument
                                                                    ?.co2target),
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
                                                                'Cette semaine',
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
                                                                        'week',
                                                                        currentUserDocument
                                                                            ?.co2target),
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
                                                          percent: functions
                                                              .ratioScoreGoal(
                                                                  containerUsersStatsRecord
                                                                      .month0,
                                                                  'month',
                                                                  currentUserDocument
                                                                      ?.co2target),
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
                                                                  .fromSTEB(
                                                                      120,
                                                                      0,
                                                                      120,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  .fromSTEB(45,
                                                                      0, 45, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  child: Text(
                                                                    'Objectif : ${valueOrDefault<String>(
                                                                      functions.printTarget(
                                                                          'month',
                                                                          currentUserDocument
                                                                              ?.co2target),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
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
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 20, 40, 0),
                                        child: FutureBuilder<
                                            List<ActionCacheRecord>>(
                                          future: queryActionCacheRecordOnce(
                                            queryBuilder: (actionCacheRecord) =>
                                                actionCacheRecord
                                                    .where('user',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .where('day',
                                                        isEqualTo: dateTimeFormat(
                                                                    'yMd',
                                                                    getCurrentTimestamp) !=
                                                                ''
                                                            ? dateTimeFormat(
                                                                'yMd',
                                                                getCurrentTimestamp)
                                                            : null),
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
                                            List<ActionCacheRecord>
                                                rowActionCacheRecordList =
                                                snapshot.data;
                                            final rowActionCacheRecord =
                                                rowActionCacheRecordList
                                                        .isNotEmpty
                                                    ? rowActionCacheRecordList
                                                        .first
                                                    : null;
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 7, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'Repasbtn-ON_TAP');
                                                          logFirebaseEvent(
                                                              'Repasbtn-Bottom-Sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0xBF000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 600,
                                                                  child:
                                                                      FoodFormWidget(
                                                                    cache:
                                                                        rowActionCacheRecord,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 90,
                                                          height: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x9FFFFFFF),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 25,
                                                                color: Color(
                                                                    0x0C000000),
                                                                offset: Offset(
                                                                    0, 10),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/diet.png',
                                                                  width: 50,
                                                                  height: 50,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                                      fontSize:
                                                                          11,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'EnergiesBtn-ON_TAP');
                                                        logFirebaseEvent(
                                                            'EnergiesBtn-Bottom-Sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0xBF000000),
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 600,
                                                                child:
                                                                    TransportFormWidget(
                                                                  cache:
                                                                      rowActionCacheRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 90,
                                                        height: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x99FFFFFF),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 25,
                                                              color: Color(
                                                                  0x0C000000),
                                                              offset:
                                                                  Offset(0, 10),
                                                            )
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/vehicles.png',
                                                                width: 50,
                                                                height: 50,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Transports',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'EnergiesBtn-ON_TAP');
                                                          logFirebaseEvent(
                                                              'EnergiesBtn-Bottom-Sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0xBF000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 362,
                                                                  child:
                                                                      EnergyFormWidget(
                                                                    actioncache:
                                                                        rowActionCacheRecord,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 90,
                                                          height: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x98FFFFFF),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 25,
                                                                color: Color(
                                                                    0x0C000000),
                                                                offset: Offset(
                                                                    0, 10),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/utility.png',
                                                                  width: 50,
                                                                  height: 50,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                                      fontSize:
                                                                          11,
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
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Stack(
                                    children: [
                                      if ((FFAppState().actionActive) == true)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 0),
                                              child: StreamBuilder<
                                                  List<ActionCacheRecord>>(
                                                stream: queryActionCacheRecord(
                                                  queryBuilder:
                                                      (actionCacheRecord) =>
                                                          actionCacheRecord.where(
                                                              'user',
                                                              isEqualTo:
                                                                  homeUsersRecord
                                                                      .reference),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 2,
                                                        height: 2,
                                                        child: SpinKitRing(
                                                          color: Colors
                                                              .transparent,
                                                          size: 2,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ActionCacheRecord>
                                                      containerActionCacheRecordList =
                                                      snapshot.data;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: StreamBuilder<
                                                        List<
                                                            ActionCacheRecord>>(
                                                      stream:
                                                          queryActionCacheRecord(
                                                        queryBuilder: (actionCacheRecord) =>
                                                            actionCacheRecord
                                                                .where('user',
                                                                    isEqualTo:
                                                                        currentUserReference)
                                                                .orderBy('date',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<ActionCacheRecord>
                                                            pageView2ActionCacheRecordList =
                                                            snapshot.data;
                                                        return Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                          child:
                                                              PageView.builder(
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            controller: pageView2Controller ??=
                                                                PageController(
                                                                    initialPage: min(
                                                                        0,
                                                                        pageView2ActionCacheRecordList.length -
                                                                            1)),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                pageView2ActionCacheRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                pageView2Index) {
                                                              final pageView2ActionCacheRecord =
                                                                  pageView2ActionCacheRecordList[
                                                                      pageView2Index];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 120,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x9F00A193),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            5,
                                                                            15,
                                                                            5),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('Container-ON_TAP');
                                                                                logFirebaseEvent('Container-Page-View');
                                                                                await pageView2Controller.previousPage(
                                                                                  duration: Duration(milliseconds: 300),
                                                                                  curve: Curves.ease,
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 50,
                                                                                height: 25,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Visibility(
                                                                                  visible: (pageView2Index) > 0,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                                                                                    child: Icon(
                                                                                      Icons.arrow_back_ios,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 20,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Stack(
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: Text(
                                                                                      'Vos actions du ${dateTimeFormat('d/M/y', pageView2ActionCacheRecord.date)}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('Container-ON_TAP');
                                                                                logFirebaseEvent('Container-Page-View');
                                                                                await pageView2Controller.nextPage(
                                                                                  duration: Duration(milliseconds: 300),
                                                                                  curve: Curves.ease,
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 50,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Visibility(
                                                                                  visible: (functions.primed(containerActionCacheRecordList.length, pageView2Index)) == true,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                                                                                    child: Icon(
                                                                                      Icons.arrow_forward_ios,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 20,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              StreamBuilder<List<ActionTypeCacheRecord>>(
                                                                            stream:
                                                                                queryActionTypeCacheRecord(
                                                                              queryBuilder: (actionTypeCacheRecord) => actionTypeCacheRecord.where('actionCache', isEqualTo: pageView2ActionCacheRecord.reference).orderBy('date', descending: true),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<ActionTypeCacheRecord> rowActionTypeCacheRecordList = snapshot.data;
                                                                              if (rowActionTypeCacheRecordList.isEmpty) {
                                                                                return Center(
                                                                                  child: Image.asset(
                                                                                    'assets/images/dust.png',
                                                                                    width: 40,
                                                                                  ),
                                                                                );
                                                                              }
                                                                              return SingleChildScrollView(
                                                                                scrollDirection: Axis.horizontal,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: List.generate(rowActionTypeCacheRecordList.length, (rowIndex) {
                                                                                    final rowActionTypeCacheRecord = rowActionTypeCacheRecordList[rowIndex];
                                                                                    return Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                      child: Container(
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        child: Stack(
                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                          children: [
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'gas')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('gasAction-ON_TAP');
                                                                                                  logFirebaseEvent('gasAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 519,
                                                                                                          child: GazFormActionModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'water')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('waterAction-ON_TAP');
                                                                                                  logFirebaseEvent('waterAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 463,
                                                                                                          child: WaterFormActionModifWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'electricity')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('electricityAction-ON_TAP');
                                                                                                  logFirebaseEvent('electricityAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 526,
                                                                                                          child: ElectricityFormActionModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'train')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('trainAction-ON_TAP');
                                                                                                  logFirebaseEvent('trainAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 520,
                                                                                                          child: TrainFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'car')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('carAction-ON_TAP');
                                                                                                  logFirebaseEvent('carAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 602,
                                                                                                          child: CarFormModifyWidget(
                                                                                                            typeAction: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'bus')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('busAction-ON_TAP');
                                                                                                  logFirebaseEvent('busAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 476,
                                                                                                          child: BusFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'moto')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('motoAction-ON_TAP');
                                                                                                  logFirebaseEvent('motoAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 342,
                                                                                                          child: MotoFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'scooter')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('scooterAction-ON_TAP');
                                                                                                  logFirebaseEvent('scooterAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 520,
                                                                                                          child: ScooterFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'metro')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('metroAction-ON_TAP');
                                                                                                  logFirebaseEvent('metroAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 357,
                                                                                                          child: MetroFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'flight')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('flightAction-ON_TAP');
                                                                                                  logFirebaseEvent('flightAction-Update-Local-State');
                                                                                                  setState(() => FFAppState().actionCO2 = pageView2ActionCacheRecord.co2e);
                                                                                                  logFirebaseEvent('flightAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 356,
                                                                                                          child: FlightFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'bike')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('bikeAction-ON_TAP');
                                                                                                  logFirebaseEvent('bikeAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 477,
                                                                                                          child: BikeFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'starter')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('starterAction-ON_TAP');
                                                                                                  logFirebaseEvent('starterAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 407,
                                                                                                          child: StarterFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'main')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('mainAction-ON_TAP');
                                                                                                  logFirebaseEvent('mainAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 573,
                                                                                                          child: MainFoodFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'desert')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('desertAction-ON_TAP');
                                                                                                  logFirebaseEvent('desertAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 440,
                                                                                                          child: DesertFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'drinks')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('drinksAction-ON_TAP');
                                                                                                  logFirebaseEvent('drinksAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 508,
                                                                                                          child: DrinksFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'cheese')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('cheeseAction-ON_TAP');
                                                                                                  logFirebaseEvent('cheeseAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 349,
                                                                                                          child: CheeseFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'bread')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('breadAction-ON_TAP');
                                                                                                  logFirebaseEvent('breadAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 387,
                                                                                                          child: BreadFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                                                            if ((rowActionTypeCacheRecord.actionType) == 'coffee')
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('coffeeAction-ON_TAP');
                                                                                                  logFirebaseEvent('coffeeAction-Bottom-Sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 435,
                                                                                                          child: CoffeeFormModifyWidget(
                                                                                                            typeCache: rowActionTypeCacheRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      if ((FFAppState().actionActive) == false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 2, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 20, 20, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    child: PageView(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      controller:
                                                          periodicsController ??=
                                                              PageController(
                                                                  initialPage:
                                                                      0),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 8, 0),
                                                          child: Container(
                                                            width: 100,
                                                            height: 120,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xA9F77303),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          5,
                                                                          15,
                                                                          5),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Emissions hebdomadaires : ${functions.printScore(containerUsersStatsRecord.periodics)}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            EnergyPeriodicsRecord>>(
                                                                      stream:
                                                                          queryEnergyPeriodicsRecord(
                                                                        queryBuilder: (energyPeriodicsRecord) => energyPeriodicsRecord.where(
                                                                            'userId',
                                                                            isEqualTo:
                                                                                currentUserUid),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 2,
                                                                              height: 2,
                                                                              child: SpinKitRing(
                                                                                color: Colors.transparent,
                                                                                size: 2,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<EnergyPeriodicsRecord>
                                                                            rowEnergyPeriodicsRecordList =
                                                                            snapshot.data;
                                                                        if (rowEnergyPeriodicsRecordList
                                                                            .isEmpty) {
                                                                          return Center(
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/dust.png',
                                                                              width: 40,
                                                                            ),
                                                                          );
                                                                        }
                                                                        return SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                List.generate(rowEnergyPeriodicsRecordList.length, (rowIndex) {
                                                                              final rowEnergyPeriodicsRecord = rowEnergyPeriodicsRecordList[rowIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                child: Container(
                                                                                  width: 40,
                                                                                  height: 40,
                                                                                  child: Stack(
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    children: [
                                                                                      if ((rowEnergyPeriodicsRecord.energy) == 'water')
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                          child: InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('waterPeriodics-ON_TAP');
                                                                                              logFirebaseEvent('waterPeriodics-Update-Local-State');
                                                                                              setState(() => FFAppState().actionCO2 = rowEnergyPeriodicsRecord.co2e);
                                                                                              logFirebaseEvent('waterPeriodics-Bottom-Sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: Container(
                                                                                                      height: 467,
                                                                                                      child: WaterFormPeriodicModifyWidget(
                                                                                                        periodic: rowEnergyPeriodicsRecord,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
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
                                                                                        ),
                                                                                      if ((rowEnergyPeriodicsRecord.energy) == 'gas')
                                                                                        InkWell(
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('gazPeriodics-ON_TAP');
                                                                                            logFirebaseEvent('gazPeriodics-Update-Local-State');
                                                                                            setState(() => FFAppState().actionCO2 = rowEnergyPeriodicsRecord.co2e);
                                                                                            logFirebaseEvent('gazPeriodics-Bottom-Sheet');
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return Padding(
                                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                                  child: Container(
                                                                                                    height: 519,
                                                                                                    child: GazFormPeriodicModifyWidget(
                                                                                                      periodic: rowEnergyPeriodicsRecord,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
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
                                                                                      if ((rowEnergyPeriodicsRecord.energy) == 'electricity')
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                          child: InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('electricityPeriodics-ON_TAP');
                                                                                              logFirebaseEvent('electricityPeriodics-Update-Local-State');
                                                                                              setState(() => FFAppState().actionCO2 = rowEnergyPeriodicsRecord.co2e);
                                                                                              logFirebaseEvent('electricityPeriodics-Bottom-Sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: Container(
                                                                                                      height: 526,
                                                                                                      child: ElectricityFormPeriodicModifyWidget(
                                                                                                        periodic: rowEnergyPeriodicsRecord,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
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
                                                                                        ),
                                                                                    ],
                                                                                  ),
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
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        if ((FFAppState().actionActive) ==
                                            false)
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
                                                          'Text-ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text-Update-Local-State');
                                                      setState(() => FFAppState()
                                                          .actionActive = true);
                                                    },
                                                    child: Text(
                                                      'Actions ',
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
                                                                    .primaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.alarm_add_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                        'Text-ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text-Update-Local-State');
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.update,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
