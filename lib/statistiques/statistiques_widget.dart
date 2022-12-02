import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StatistiquesWidget extends StatefulWidget {
  const StatistiquesWidget({Key? key}) : super(key: key);

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
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
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
                      'assets/images/mobile_cover_2_flou.jpg',
                    ).image,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
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
                          List<UsersRecord> headerUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final headerUsersRecord =
                              headerUsersRecordList.isNotEmpty
                                  ? headerUsersRecordList.first
                                  : null;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                                              'STATISTIQUES_Container_4uwupvb1_ON_TAP');
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
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STATISTIQUES_PAGE_Actions_ON_TAP');
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                width: 1,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'STATISTIQUES_PAGE_Icon_xodx627i_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_navigate_to');

                                                context.pushNamed('Home');
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STATISTIQUES_PAGE_Stats_ON_TAP');
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                'STATISTIQUES_PAGE_Profil_ON_TAP');
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                width: 1,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  headerUsersRecord!.photoUrl,
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
                          );
                        },
                      ),
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
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 20, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x67FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x2B202529),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sur les 7 derniers jours',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF101213),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'En KG de co2e par jour',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 200,
                                                child: FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData: FFAppState()
                                                          .XAxisDays,
                                                      yData:
                                                          containerUsersStatsRecord!
                                                              .daysChart!
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .redi,
                                                        barWidth: 2,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                        belowBarData:
                                                            BarAreaData(
                                                          show: true,
                                                          color:
                                                              Color(0x99E25606),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        Color(0xFFEE8B60),
                                                    backgroundColor:
                                                        Color(0x00FFFFFF),
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(
                                                    minX: -6,
                                                    minY: 0,
                                                    maxX: 0,
                                                  ),
                                                  xAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                    labelInterval: 1,
                                                  ),
                                                  yAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelInterval: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 10, 16, 16),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x67FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x2B202529),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sur les 3 dernières semaines',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF101213),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'En KG de co2e par jour',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 200,
                                                child: FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData: FFAppState()
                                                          .XAxisWeeks,
                                                      yData:
                                                          containerUsersStatsRecord!
                                                              .weeksChart!
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            Color(0xB315554B),
                                                        barWidth: 2,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                        belowBarData:
                                                            BarAreaData(
                                                          show: true,
                                                          color:
                                                              Color(0xB315554B),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        Color(0xFFEE8B60),
                                                    backgroundColor:
                                                        Color(0x00FFFFFF),
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(
                                                    minX: -3,
                                                    minY: 0,
                                                    maxX: 0,
                                                  ),
                                                  xAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                    labelInterval: 1,
                                                  ),
                                                  yAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelInterval: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 10, 16, 16),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x67FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x2B202529),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sur les 3 dernièrs mois',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF101213),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'En KG de co2e par jour',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 200,
                                                child: FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData: FFAppState()
                                                          .XAxisMonths,
                                                      yData:
                                                          containerUsersStatsRecord!
                                                              .monthsChart!
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            Color(0x8D0F9CFF),
                                                        barWidth: 2,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                        belowBarData:
                                                            BarAreaData(
                                                          show: true,
                                                          color:
                                                              Color(0x8D0F9CFF),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        Color(0xFFEE8B60),
                                                    backgroundColor:
                                                        Color(0x00FFFFFF),
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(
                                                    minX: -3,
                                                    minY: 0,
                                                    maxX: 0,
                                                  ),
                                                  xAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                    labelInterval: 1,
                                                  ),
                                                  yAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelInterval: 10,
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
