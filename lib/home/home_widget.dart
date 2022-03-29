import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_space_txt_for_action_cache_widget.dart';
import '../components/energy_form_widget.dart';
import '../components/food_form_widget.dart';
import '../components/train_form_copy_widget.dart';
import '../components/transport_form_widget.dart';
import '../drawer/drawer_widget.dart';
import '../drawer_copy/drawer_copy_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../statistiques/statistiques_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
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
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
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
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent('Container-ON_TAP');
                          logFirebaseEvent('Container-Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DrawerCopyWidget(),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color(0x2C000000),
                                offset: Offset(0, 4),
                              )
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayLight,
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
                            color: FlutterFlowTheme.of(context).tertiaryColor,
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
                                logFirebaseEvent('Container-ON_TAP');
                                logFirebaseEvent('Container-Navigate-To');
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
                                        'assets/images/actions.svg',
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
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent('Container-ON_TAP');
                                logFirebaseEvent('Container-Navigate-To');
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
                                        'assets/images/statics-green.svg',
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
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.35),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 350,
                          child: Stack(
                            children: [
                              PageView(
                                controller: pageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 220,
                                    height: 220,
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
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        AuthUserStreamWidget(
                                          child: CircularPercentIndicator(
                                              percent:
                                                  functions.percentProgressBar(
                                                      currentUserDocument
                                                          ?.dayScore,
                                                      'day',
                                                      currentUserDocument
                                                          ?.co2target),
                                              radius: 100,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .orange,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              center: Text(
                                                functions.printScore(
                                                    currentUserDocument
                                                        ?.dayScore),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                    ),
                                              ),
                                              startAngle: 0),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -0.4),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    45, 0, 45, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Aujourd\'hui',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gronyLighter,
                                                          fontSize: 11,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.4),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    45, 0, 45, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'co2e',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gronyLighter,
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
                                    width: 220,
                                    height: 220,
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
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        AuthUserStreamWidget(
                                          child: CircularPercentIndicator(
                                              percent:
                                                  functions.percentProgressBar(
                                                      currentUserDocument
                                                          ?.weekScore,
                                                      'week',
                                                      currentUserDocument
                                                          ?.co2target),
                                              radius: 100,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .orange,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              center: Text(
                                                functions.printScore(
                                                    currentUserDocument
                                                        ?.weekScore),
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
                                                    ),
                                              ),
                                              startAngle: 0),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -0.4),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    45, 0, 45, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Cette semaine',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gronyLighter,
                                                          fontSize: 11,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.4),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    45, 0, 45, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'co2e',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gronyLighter,
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
                                    width: 220,
                                    height: 220,
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
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        AuthUserStreamWidget(
                                          child: CircularPercentIndicator(
                                              percent:
                                                  functions.percentProgressBar(
                                                      currentUserDocument
                                                          ?.monthScore,
                                                      'month',
                                                      currentUserDocument
                                                          ?.co2target),
                                              radius: 100,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .orange,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              center: Text(
                                                functions.printScore(
                                                    currentUserDocument
                                                        ?.monthScore),
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
                                                    ),
                                              ),
                                              startAngle: 0),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -0.4),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    120, 0, 120, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Ce mois',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gronyLighter,
                                                          fontSize: 11,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.4),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    45, 0, 45, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'co2e',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gronyLighter,
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
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: ExpandingDotsEffect(
                                      expansionFactor: 4,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 8,
                                      dotHeight: 8,
                                      dotColor: FlutterFlowTheme.of(context)
                                          .gronyLighter,
                                      activeDotColor:
                                          FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                        child: StreamBuilder<List<ActionCacheRecord>>(
                          stream: queryActionCacheRecord(
                            queryBuilder: (actionCacheRecord) =>
                                actionCacheRecord
                                    .where('user',
                                        isEqualTo: currentUserReference)
                                    .where('date',
                                        isEqualTo: getCurrentTimestamp),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitRing(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<ActionCacheRecord> rowActionCacheRecordList =
                                snapshot.data;
                            final rowActionCacheRecord =
                                rowActionCacheRecordList.isNotEmpty
                                    ? rowActionCacheRecordList.first
                                    : null;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 5),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent('TransBtn-ON_TAP');
                                          logFirebaseEvent(
                                              'TransBtn-Bottom-Sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0xBF000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: 600,
                                                  child: TransportFormWidget(),
                                                ),
                                              );
                                            },
                                          );
                                          if ((currentUserDocument?.cache) !=
                                              (getCurrentTimestamp)) {
                                            logFirebaseEvent(
                                                'TransBtn-Backend-Call');

                                            final actionCacheCreateData =
                                                createActionCacheRecordData(
                                              user: currentUserReference,
                                              date: getCurrentTimestamp,
                                              co2e: 0,
                                            );
                                            await ActionCacheRecord.collection
                                                .doc()
                                                .set(actionCacheCreateData);
                                            logFirebaseEvent(
                                                'TransBtn-Backend-Call');

                                            final usersUpdateData =
                                                createUsersRecordData(
                                              cache: getCurrentTimestamp,
                                            );
                                            await currentUserReference
                                                .update(usersUpdateData);
                                          }
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25,
                                                color: Color(0x0E000000),
                                                offset: Offset(0, 10),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-car-01.svg',
                                                  width: 25,
                                                  height: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                'Transports',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 5),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent('Repasbtn-ON_TAP');
                                          logFirebaseEvent(
                                              'Repasbtn-Bottom-Sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0xBF000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: 600,
                                                  child: FoodFormWidget(),
                                                ),
                                              );
                                            },
                                          );
                                          if ((currentUserDocument?.cache) !=
                                              (getCurrentTimestamp)) {
                                            logFirebaseEvent(
                                                'Repasbtn-Backend-Call');

                                            final actionCacheCreateData =
                                                createActionCacheRecordData(
                                              user: currentUserReference,
                                              date: getCurrentTimestamp,
                                              co2e: 0,
                                            );
                                            await ActionCacheRecord.collection
                                                .doc()
                                                .set(actionCacheCreateData);
                                            logFirebaseEvent(
                                                'Repasbtn-Backend-Call');

                                            final usersUpdateData =
                                                createUsersRecordData(
                                              cache: getCurrentTimestamp,
                                            );
                                            await currentUserReference
                                                .update(usersUpdateData);
                                          }
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25,
                                                color: Color(0x0C000000),
                                                offset: Offset(0, 10),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: Image.asset(
                                                  'assets/images/canape_(1).png',
                                                  width: 25,
                                                  height: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                'Repas',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 5),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'EnergiesBtn-ON_TAP');
                                          logFirebaseEvent(
                                              'EnergiesBtn-Bottom-Sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0xBF000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: 380,
                                                  child: EnergyFormWidget(),
                                                ),
                                              );
                                            },
                                          );
                                          if ((currentUserDocument?.cache) !=
                                              (getCurrentTimestamp)) {
                                            logFirebaseEvent(
                                                'EnergiesBtn-Backend-Call');

                                            final actionCacheCreateData =
                                                createActionCacheRecordData(
                                              user: currentUserReference,
                                              date: getCurrentTimestamp,
                                              co2e: 0,
                                            );
                                            await ActionCacheRecord.collection
                                                .doc()
                                                .set(actionCacheCreateData);
                                            logFirebaseEvent(
                                                'EnergiesBtn-Backend-Call');

                                            final usersUpdateData =
                                                createUsersRecordData(
                                              cache: getCurrentTimestamp,
                                            );
                                            await currentUserReference
                                                .update(usersUpdateData);
                                          }
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25,
                                                color: Color(0x0C000000),
                                                offset: Offset(0, 10),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: Image.asset(
                                                  'assets/images/energy.png',
                                                  width: 25,
                                                  height: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                'Energies',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 10, 40, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'Les actions du jour',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: StreamBuilder<List<ActionCacheRecord>>(
                                stream: queryActionCacheRecord(
                                  queryBuilder: (actionCacheRecord) =>
                                      actionCacheRecord
                                          .where('user',
                                              isEqualTo: currentUserReference)
                                          .orderBy('date', descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitRing(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ActionCacheRecord>
                                      pageView2ActionCacheRecordList =
                                      snapshot.data;
                                  if (pageView2ActionCacheRecordList.isEmpty) {
                                    return Center(
                                      child:
                                          EmptySpaceTxtForActionCacheWidget(),
                                    );
                                  }
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: PageView.builder(
                                      controller: pageView2Controller ??=
                                          PageController(
                                              initialPage: min(
                                                  0,
                                                  pageView2ActionCacheRecordList
                                                          .length -
                                                      1)),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          pageView2ActionCacheRecordList.length,
                                      itemBuilder: (context, pageView2Index) {
                                        final pageView2ActionCacheRecord =
                                            pageView2ActionCacheRecordList[
                                                pageView2Index];
                                        return Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xCCF77203),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 5, 15, 5),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 7, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'Icon-ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon-Page-View');
                                                          await pageView2Controller
                                                              .previousPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.arrow_back_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          if ((pageView2ActionCacheRecord
                                                                  .date) !=
                                                              (getCurrentTimestamp))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                'Vous avez émis ${valueOrDefault<String>(
                                                                  pageView2ActionCacheRecord
                                                                      .co2e
                                                                      .toString(),
                                                                  '0',
                                                                )} kg de CO2 sur ${dateTimeFormat('d/M/y', pageView2ActionCacheRecord.date)}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          if ((pageView2ActionCacheRecord
                                                                  .date) ==
                                                              (getCurrentTimestamp))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                'Vous avez émis ${valueOrDefault<String>(
                                                                  pageView2ActionCacheRecord
                                                                      .co2e
                                                                      .toString(),
                                                                  '0',
                                                                )} kg de CO2 sur aujourd\'hui',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7, 0, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'Icon-ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon-Page-View');
                                                          await pageView2Controller
                                                              .nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                TransportActionsRecord>>(
                                                          stream:
                                                              queryTransportActionsRecord(
                                                            queryBuilder: (transportActionsRecord) => transportActionsRecord
                                                                .where('userId',
                                                                    isEqualTo: currentUserUid !=
                                                                            ''
                                                                        ? currentUserUid
                                                                        : null)
                                                                .where(
                                                                    'created_time',
                                                                    isEqualTo:
                                                                        pageView2ActionCacheRecord
                                                                            .date),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitRing(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    size: 50,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TransportActionsRecord>
                                                                row1TransportActionsRecordList =
                                                                snapshot.data;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: List.generate(
                                                                  row1TransportActionsRecordList
                                                                      .length,
                                                                  (row1Index) {
                                                                final row1TransportActionsRecord =
                                                                    row1TransportActionsRecordList[
                                                                        row1Index];
                                                                return Stack(
                                                                  children: [
                                                                    if ((row1TransportActionsRecord
                                                                            .transport) ==
                                                                        'train')
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'trainImage-ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'trainImage-Bottom-Sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: 450,
                                                                                  child: TrainFormCopyWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/trans-train-04.svg',
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              children: [],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              children: [],
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
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
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
      ),
    );
  }
}
