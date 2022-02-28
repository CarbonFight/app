import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_action_widget.dart';
import '../components/info_widget.dart';
import '../drawer/drawer_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../statistiques/statistiques_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeV2Widget extends StatefulWidget {
  const HomeV2Widget({Key key}) : super(key: key);

  @override
  _HomeV2WidgetState createState() => _HomeV2WidgetState();
}

class _HomeV2WidgetState extends State<HomeV2Widget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int daySocre;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      daySocre = await actions.updateDayScore(
        currentUserUid,
      );
    });
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
                'assets/images/background.png',
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
                  height: MediaQuery.of(context).size.height * 0.25,
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
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
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
                      Container(
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/default_avatar_3d.png',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
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
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).gronyLight,
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
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
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
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child: StatistiquesWidget(),
                                            ),
                                          );
                                        },
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
                                    ),
                                  ],
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
                  height: 500,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: PageView(
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
                                          CircularPercentIndicator(
                                              percent: 0.25,
                                              radius: 100,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .redi,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              center: Text(
                                                '71%',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 46,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              startAngle: 0),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -0.4),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(45, 0, 45, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'You\'re on track to decrease emissions by',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(45, 0, 45, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'This Month',
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
                                          CircularPercentIndicator(
                                              percent: 0.25,
                                              radius: 100,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .redi,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              center: Text(
                                                '71%',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 46,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              startAngle: 0),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -0.4),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(45, 0, 45, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'You\'re on track to decrease emissions by',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(45, 0, 45, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'This Month',
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
                                          CircularPercentIndicator(
                                              percent: 0.25,
                                              radius: 100,
                                              lineWidth: 18,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .redi,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              center: Text(
                                                '71%',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 46,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              startAngle: 0),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -0.4),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(120, 0, 120, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'You\'re on track to decrease emissions by',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(45, 0, 45, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'This Month',
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
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StreamBuilder<List<ScoresRecord>>(
                                    stream: queryScoresRecord(
                                      queryBuilder: (scoresRecord) =>
                                          scoresRecord.where('userId',
                                              isEqualTo: currentUserUid),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ScoresRecord> textScoresRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final textScoresRecord =
                                          textScoresRecordList.isNotEmpty
                                              ? textScoresRecordList.first
                                              : null;
                                      return Text(
                                        functions.printScore(
                                            textScoresRecord.globalScore),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 46,
                                            ),
                                      );
                                    },
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'CO2e',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () async {
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
                                                  height: 375,
                                                  child: InfoWidget(
                                                    title: 'Some statistics',
                                                    body:
                                                        'The French average is 12.5 kg. The 10 most polluting countries emit on average between 40 kg (USA/Canada) and 83 kg (Quatar) of CO2 per capita per day. To reach the balance of our planet, it would be necessary to emit less than 3.30 kg per inhabitant.',
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: Color(0x13000000),
                                                offset: Offset(0, 8),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.info_outline_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 22,
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
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
                                                    height: 375,
                                                    child: InfoWidget(
                                                      title: 'Some statistics',
                                                      body:
                                                          'The French average is 12.5 kg. The 10 most polluting countries emit on average between 40 kg (USA/Canada) and 83 kg (Quatar) of CO2 per capita per day. To reach the balance of our planet, it would be necessary to emit less than 3.30 kg per inhabitant.',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10,
                                                  color: Color(0x13000000),
                                                  offset: Offset(0, 8),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Icon(
                                              Icons.info_outline_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child:
                                              StreamBuilder<List<ScoresRecord>>(
                                            stream: queryScoresRecord(
                                              queryBuilder: (scoresRecord) =>
                                                  scoresRecord.where('userId',
                                                      isEqualTo:
                                                          currentUserUid),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ScoresRecord>
                                                  textScoresRecordList =
                                                  snapshot.data;
                                              // Return an empty Container when the document does not exist.
                                              if (snapshot.data.isEmpty) {
                                                return Container();
                                              }
                                              final textScoresRecord =
                                                  textScoresRecordList
                                                          .isNotEmpty
                                                      ? textScoresRecordList
                                                          .first
                                                      : null;
                                              return Text(
                                                'Vos émissions du jour : ${functions.printScore(textScoresRecord.dayScore)}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                    ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: SvgPicture.asset(
                                              'assets/images/01.svg',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: SvgPicture.asset(
                                              'assets/images/02.svg',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: SvgPicture.asset(
                                              'assets/images/03.svg',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '38%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gronyLighter,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
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
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Stack(
                    alignment: AlignmentDirectional(-0.65, -1),
                    children: [
                      if (FFAppState().addButtonsHome ?? true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 90, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0xBF000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 500,
                                            child: AddActionWidget(
                                              list: 'Transport',
                                            ),
                                          ),
                                        );
                                      },
                                    );
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: SvgPicture.asset(
                                            'assets/images/transport.svg',
                                            width: 25,
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Transport',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0xBF000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 500,
                                            child: AddActionWidget(
                                              list: 'Repas',
                                            ),
                                          ),
                                        );
                                      },
                                    );
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: SvgPicture.asset(
                                            'assets/images/repas.svg',
                                            width: 25,
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Repas',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 11,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0xBF000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 500,
                                            child: AddActionWidget(
                                              list: 'Energies',
                                            ),
                                          ),
                                        );
                                      },
                                    );
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: SvgPicture.asset(
                                            'assets/images/energies.svg',
                                            width: 25,
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Energies',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
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
                        ),
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 35,
                              color: Color(0x1A000000),
                              offset: Offset(0, 12),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                          borderRadius: 50,
                          borderWidth: 10,
                          buttonSize: 50,
                          fillColor: FlutterFlowTheme.of(context).gronyLight,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (!(FFAppState().addButtonsHome)) {
                              setState(
                                  () => FFAppState().addButtonsHome = true);
                            }
                            if (FFAppState().addButtonsHome) {
                              setState(
                                  () => FFAppState().addButtonsHome = false);
                            }
                          },
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
    );
  }
}
