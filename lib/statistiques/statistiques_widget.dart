import '../account/account_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/ranks_widget.dart';
import '../drawer/drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatistiquesWidget extends StatefulWidget {
  const StatistiquesWidget({Key key}) : super(key: key);

  @override
  _StatistiquesWidgetState createState() => _StatistiquesWidgetState();
}

class _StatistiquesWidgetState extends State<StatistiquesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Statistiques'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
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
                'assets/images/mobile_cover_2.jpg',
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
                    colors: [Color(0xC2782D00), Color(0x00E25606)],
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xCC000000)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<UsersStatsRecord>>(
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
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 140,
                                  height: 120,
                                  child: Stack(
                                    alignment: AlignmentDirectional(-1, 0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1, 0.95),
                                        child: Image.asset(
                                          'assets/images/badge.png',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Stack(
                                        alignment: AlignmentDirectional(0, 0),
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25,
                                                  color: Color(0x1C000000),
                                                  offset: Offset(0, 12),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            child: CircularPercentIndicator(
                                              percent: functions.ratioScoreGoal(
                                                  containerUsersStatsRecord
                                                      .day0,
                                                  'day',
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.co2target,
                                                      0)),
                                              radius: 35,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .orange,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'STATISTIQUES_PAGE_Container_yeznk2hd_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_Navigate-To');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: AccountWidget(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1,
                                                ),
                                              ),
                                              child: AuthUserStreamWidget(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.35, 0),
                                        child: AuthUserStreamWidget(
                                          child: Text(
                                            valueOrDefault<String>(
                                              valueOrDefault(
                                                      currentUserDocument
                                                          ?.level,
                                                      0)
                                                  .toString(),
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'STATISTIQUES_PAGE_Column_4otlsmdh_ON_TAP');
                                        logFirebaseEvent('Column_Bottom-Sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: 600,
                                                child: RanksWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AuthUserStreamWidget(
                                            child: Text(
                                              valueOrDefault<String>(
                                                currentUserDisplayName,
                                                'Display Name',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Niveau : ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gronyLighter,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                AuthUserStreamWidget(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions.printLevel(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.level,
                                                              0)),
                                                      'CarbonFighter',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Classement : ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gronyLighter,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: AuthUserStreamWidget(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      '${valueOrDefault<String>(
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.rank,
                                                                0)
                                                            .toString(),
                                                        '-',
                                                      )} / ${valueOrDefault<String>(
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.rankSize,
                                                                0)
                                                            .toString(),
                                                        '-',
                                                      )}',
                                                      '- / -',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.info_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 35,
                                        color: Color(0x12000000),
                                        offset: Offset(0, -4),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x82FF9E65),
                                        Color(0x00FF9E65)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0, -1),
                                      end: AlignmentDirectional(0, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 10, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Jour',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.printScore(
                                                              containerUsersStatsRecord
                                                                  .day0),
                                                          '4.5 kg',
                                                        ),
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
                                                                  fontSize: 20,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Semaine',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.printScore(
                                                              containerUsersStatsRecord
                                                                  .week0),
                                                          '4.5 kg',
                                                        ),
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
                                                                  fontSize: 20,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Mois',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.printScore(
                                                              containerUsersStatsRecord
                                                                  .month0),
                                                          '4.5 kg',
                                                        ),
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
                                                                  fontSize: 20,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 15, 20, 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 135,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 35,
                                    color: Color(0x12000000),
                                    offset: Offset(0, -4),
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x82FF9E65),
                                    Color(0x00FF9E65)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0, -1),
                                  end: AlignmentDirectional(0, 1),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Répartition par secteur',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              'assets/images/vehicles.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.printScore(
                                                    containerUsersStatsRecord
                                                        .transportDay0),
                                                '1.2 kg',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            Text(
                                              functions.printRatioScoreTotal(
                                                  containerUsersStatsRecord
                                                      .transportDay0,
                                                  containerUsersStatsRecord
                                                      .day0),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            LinearPercentIndicator(
                                              percent:
                                                  functions.ratioScoreTotal(
                                                      containerUsersStatsRecord
                                                          .transportDay0,
                                                      containerUsersStatsRecord
                                                          .day0),
                                              width: 140,
                                              lineHeight: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              backgroundColor:
                                                  Color(0xFFF1F4F8),
                                              barRadius: Radius.circular(100),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              'assets/images/diet.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              functions.printScore(
                                                  containerUsersStatsRecord
                                                      .foodDay0),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            Text(
                                              functions.printRatioScoreTotal(
                                                  containerUsersStatsRecord
                                                      .foodDay0,
                                                  containerUsersStatsRecord
                                                      .day0),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            LinearPercentIndicator(
                                              percent:
                                                  functions.ratioScoreTotal(
                                                      containerUsersStatsRecord
                                                          .foodDay0,
                                                      containerUsersStatsRecord
                                                          .day0),
                                              width: 140,
                                              lineHeight: 18,
                                              animation: true,
                                              progressColor: Color(0xFF0072FF),
                                              backgroundColor:
                                                  Color(0xFFF1F4F8),
                                              barRadius: Radius.circular(100),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              'assets/images/utility.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              functions.printScore(
                                                  containerUsersStatsRecord
                                                      .energyDay0),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.printRatioScoreTotal(
                                                    containerUsersStatsRecord
                                                        .energyDay0,
                                                    containerUsersStatsRecord
                                                        .day0),
                                                '0 %',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            LinearPercentIndicator(
                                              percent:
                                                  functions.ratioScoreTotal(
                                                      containerUsersStatsRecord
                                                          .energyDay0,
                                                      containerUsersStatsRecord
                                                          .day0),
                                              width: 140,
                                              lineHeight: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .redi,
                                              backgroundColor:
                                                  Color(0xFFF1F4F8),
                                              barRadius: Radius.circular(100),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 210,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 35,
                                    color: Color(0x12000000),
                                    offset: Offset(0, -4),
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x82FF9E65),
                                    Color(0x00FF9E65)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0, -1),
                                  end: AlignmentDirectional(0, 1),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Répartition par action',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: StreamBuilder<
                                                List<FoodActionsRecord>>(
                                              stream: queryFoodActionsRecord(
                                                queryBuilder: (foodActionsRecord) =>
                                                    foodActionsRecord
                                                        .where('userId',
                                                            isEqualTo:
                                                                currentUserUid)
                                                        .where('day',
                                                            isEqualTo:
                                                                dateTimeFormat(
                                                                    'yMd',
                                                                    getCurrentTimestamp))
                                                        .orderBy('created_time',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 2,
                                                      height: 2,
                                                      child: SpinKitRing(
                                                        color:
                                                            Colors.transparent,
                                                        size: 2,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<FoodActionsRecord>
                                                    listViewFoodActionsRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewFoodActionsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewFoodActionsRecord =
                                                        listViewFoodActionsRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 10, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'main')
                                                                Image.asset(
                                                                  'assets/images/steak.png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'coffee')
                                                                Image.asset(
                                                                  'assets/images/coffee.png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'starter')
                                                                Image.asset(
                                                                  'assets/images/canape_(1).png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'desert')
                                                                Image.asset(
                                                                  'assets/images/ice-cream.png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'drinks')
                                                                Image.asset(
                                                                  'assets/images/soft-drink.png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'cheese')
                                                                Image.asset(
                                                                  'assets/images/cheeses.png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              if ((listViewFoodActionsRecord
                                                                      .food) ==
                                                                  'bread')
                                                                Image.asset(
                                                                  'assets/images/bread.png',
                                                                  width: 30,
                                                                  height: 30,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                            ],
                                                          ),
                                                          Text(
                                                            functions.printScore(
                                                                listViewFoodActionsRecord
                                                                    .co2e),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.printRatioScoreTotal(
                                                                  listViewFoodActionsRecord
                                                                      .co2e,
                                                                  containerUsersStatsRecord
                                                                      .day0),
                                                              '0%',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          LinearPercentIndicator(
                                                            percent: functions.ratioScoreTotal(
                                                                listViewFoodActionsRecord
                                                                    .co2e,
                                                                containerUsersStatsRecord
                                                                    .day0),
                                                            width: 140,
                                                            lineHeight: 18,
                                                            animation: true,
                                                            progressColor:
                                                                Color(
                                                                    0xFF0072FF),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFF1F4F8),
                                                            barRadius:
                                                                Radius.circular(
                                                                    100),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: StreamBuilder<
                                                  List<TransportActionsRecord>>(
                                                stream:
                                                    queryTransportActionsRecord(
                                                  queryBuilder: (transportActionsRecord) =>
                                                      transportActionsRecord
                                                          .where('userId',
                                                              isEqualTo:
                                                                  currentUserUid)
                                                          .where('day',
                                                              isEqualTo:
                                                                  dateTimeFormat(
                                                                      'yMd',
                                                                      getCurrentTimestamp))
                                                          .orderBy(
                                                              'created_time',
                                                              descending: true),
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
                                                  List<TransportActionsRecord>
                                                      listViewTransportActionsRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTransportActionsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewTransportActionsRecord =
                                                          listViewTransportActionsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'car')
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/trans-car-01.svg',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'bus')
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/trans-bus-02.svg',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'train')
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/trans-train-04.svg',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'scooter')
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/trans-motor-03.svg',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'metro')
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/trans-metro-06.svg',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'moto')
                                                                  Image.asset(
                                                                    'assets/images/motorcycle.png',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'flight')
                                                                  Image.asset(
                                                                    'assets/images/aircraft.png',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewTransportActionsRecord
                                                                        .transport) ==
                                                                    'bike')
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/trans-cycle-08.svg',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                              ],
                                                            ),
                                                            Text(
                                                              functions.printScore(
                                                                  listViewTransportActionsRecord
                                                                      .co2e),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.printRatioScoreTotal(
                                                                    listViewTransportActionsRecord
                                                                        .co2e,
                                                                    containerUsersStatsRecord
                                                                        .day0),
                                                                '0%',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: functions.ratioScoreTotal(
                                                                  listViewTransportActionsRecord
                                                                      .co2e,
                                                                  containerUsersStatsRecord
                                                                      .day0),
                                                              width: 140,
                                                              lineHeight: 18,
                                                              animation: true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFF1F4F8),
                                                              barRadius: Radius
                                                                  .circular(
                                                                      100),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: StreamBuilder<
                                                  List<EnergyActionsRecord>>(
                                                stream:
                                                    queryEnergyActionsRecord(
                                                  queryBuilder: (energyActionsRecord) =>
                                                      energyActionsRecord
                                                          .where('userId',
                                                              isEqualTo:
                                                                  currentUserUid)
                                                          .where('day',
                                                              isEqualTo:
                                                                  dateTimeFormat(
                                                                      'yMd',
                                                                      getCurrentTimestamp))
                                                          .orderBy(
                                                              'created_time',
                                                              descending: true),
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
                                                  List<EnergyActionsRecord>
                                                      listViewEnergyActionsRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewEnergyActionsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewEnergyActionsRecord =
                                                          listViewEnergyActionsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                if ((listViewEnergyActionsRecord
                                                                        .energy) ==
                                                                    'gas')
                                                                  Image.asset(
                                                                    'assets/images/gas.png',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewEnergyActionsRecord
                                                                        .energy) ==
                                                                    'water')
                                                                  Image.asset(
                                                                    'assets/images/water-drop.png',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                if ((listViewEnergyActionsRecord
                                                                        .energy) ==
                                                                    'electricity')
                                                                  Image.asset(
                                                                    'assets/images/energy.png',
                                                                    width: 30,
                                                                    height: 30,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                              ],
                                                            ),
                                                            Text(
                                                              functions.printScore(
                                                                  listViewEnergyActionsRecord
                                                                      .co2e),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.printRatioScoreTotal(
                                                                    listViewEnergyActionsRecord
                                                                        .co2e,
                                                                    containerUsersStatsRecord
                                                                        .day0),
                                                                '0 %',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: functions.ratioScoreTotal(
                                                                  listViewEnergyActionsRecord
                                                                      .co2e,
                                                                  containerUsersStatsRecord
                                                                      .day0),
                                                              width: 140,
                                                              lineHeight: 18,
                                                              animation: true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .redi,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFF1F4F8),
                                                              barRadius: Radius
                                                                  .circular(
                                                                      100),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
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
                  );
                },
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
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'STATISTIQUES_PAGE_Container_0gx9wx6k_ON_TAP');
                          logFirebaseEvent('Container_Navigate-To');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
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
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40,
                                color: Color(0x5BFFFFFF),
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
                            color: FlutterFlowTheme.of(context).tertiaryColor,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'STATISTIQUES_PAGE_Container_pfc39kc9_ON_TAP');
                                logFirebaseEvent('Container_Navigate-To');
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
                                      .tertiaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/actions_green.svg',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Actions',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gronyLight,
                                                fontWeight: FontWeight.w800,
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
                                    'STATISTIQUES_PAGE_Container_owsdktcl_ON_TAP');
                                logFirebaseEvent('Container_Navigate-To');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StatistiquesWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).gronyLight,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/statics_white.svg',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Statistiques',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontWeight: FontWeight.w800,
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
