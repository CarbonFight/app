import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../drawer/drawer_widget.dart';
import '../energies/energies_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../food/food_widget.dart';
import '../home/home_widget.dart';
import '../statistiques/statistiques_widget.dart';
import '../transport/transport_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  String? activeProfilePartValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 30),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
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
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('uid', isEqualTo: currentUserUid),
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
                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerUsersRecord =
                      containerUsersRecordList.isNotEmpty
                          ? containerUsersRecordList.first
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
                          'assets/images/onboard3flou.jpg',
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
                                              'PROFILE_PAGE_Container_zi3bxkl5_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_Navigate-To');
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .leftToRight,
                                              duration:
                                                  Duration(milliseconds: 300),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILE_PAGE_Actions_ON_TAP');
                                            logFirebaseEvent(
                                                'Actions_Navigate-To');
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
                                                    'PROFILE_PAGE_Icon_c33h4vn9_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_Navigate-To');
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                    reverseDuration: Duration(
                                                        milliseconds: 0),
                                                    child: HomeWidget(),
                                                  ),
                                                );
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
                                                'PROFILE_PAGE_Stats_ON_TAP');
                                            logFirebaseEvent(
                                                'Stats_Navigate-To');
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
                                                'PROFILE_PAGE_Profil_ON_TAP');
                                            logFirebaseEvent(
                                                'Profil_Navigate-To');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                                reverseDuration:
                                                    Duration(milliseconds: 0),
                                                child: ProfileWidget(),
                                              ),
                                            );
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
                                            child: AuthUserStreamWidget(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    currentUserPhoto,
                                                    'https://firebasestorage.googleapis.com/v0/b/carbonfight-89af6.appspot.com/o/18275220161537356156-128.png?alt=media&token=c9797a03-bba1-46b8-aaac-4c54cb99fcb6',
                                                  ),
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                ),
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
                          Container(
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
                                        20, 15, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 10, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 75,
                                                height: 75,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 20, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: AuthUserStreamWidget(
                                                  child: Text(
                                                    currentUserDisplayName,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Points trophés : ${containerUsersRecord!.totalPoints?.toString()}',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 11,
                                                    ),
                                              ),
                                              Text(
                                                'Objectif journalier : ${functions.printScore(containerUsersRecord!.co2target)}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 11,
                                                    ),
                                              ),
                                              Text(
                                                'CO2 total enregistré : ${functions.printScore(containerUsersRecord!.globalScore)}',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 11,
                                                    ),
                                              ),
                                              Text(
                                                'Projection annuelle : ${functions.printScore(containerUsersRecord!.globalProjection)}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 11,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 5, 20, 0),
                                            child: FlutterFlowChoiceChips(
                                              initiallySelected:
                                                  activeProfilePartValue != null
                                                      ? [
                                                          activeProfilePartValue!
                                                        ]
                                                      : ['Trophés'],
                                              options: [
                                                ChipData('Trophés',
                                                    FontAwesomeIcons.trophy),
                                                ChipData(
                                                    'Classement',
                                                    Icons
                                                        .format_line_spacing_sharp),
                                                ChipData(
                                                    'Objectifs', Icons.stars),
                                                ChipData(
                                                    'Historique', Icons.update),
                                                ChipData('Paramètres',
                                                    FontAwesomeIcons.cog)
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  activeProfilePartValue =
                                                      val?.first),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF323B45),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 15,
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF323B45),
                                                      fontSize: 10,
                                                    ),
                                                iconColor: Color(0xFF323B45),
                                                iconSize: 15,
                                                elevation: 4,
                                              ),
                                              chipSpacing: 10,
                                              multiselect: false,
                                              initialized:
                                                  activeProfilePartValue !=
                                                      null,
                                              alignment: WrapAlignment.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (activeProfilePartValue == 'Trophés')
                                    StreamBuilder<List<UsersTrophiesRecord>>(
                                      stream: queryUsersTrophiesRecord(
                                        queryBuilder: (usersTrophiesRecord) =>
                                            usersTrophiesRecord.where('uid',
                                                isEqualTo: currentUserUid),
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
                                        List<UsersTrophiesRecord>
                                            trophiesUsersTrophiesRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final trophiesUsersTrophiesRecord =
                                            trophiesUsersTrophiesRecordList
                                                    .isNotEmpty
                                                ? trophiesUsersTrophiesRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 480,
                                          decoration: BoxDecoration(
                                            color: Color(0x00EEEEEE),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                            child: Image.asset(
                                                              'assets/images/stopwatch.png',
                                                              width: 70,
                                                              height: 70,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Installer\nl\'application',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '100 points',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .hasParams ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/time-management.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .hasParams!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/time-managementBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Régler ses\nparamètres',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '(bientôt)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .hasGoals ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/target.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .hasGoals!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/targetBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Fixer ses\nobjectifs',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '100 points',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .has50Actions ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/add-pointer.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .has50Actions!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/add-pointerBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Ajouter\n50 actions',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '200 points',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .has7DaysStreak ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/on-time.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .has7DaysStreak!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/on-timeBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Connexion\n7 jours d\'affilé',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '500 points',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .has3Periodics ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/schedule.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .has3Periodics!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/scheduleBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Ajouter 3\nactions récurrentes',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '100 points',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .has2Invites ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/partnership-handshake.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .has2Invites!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/partnership-handshakeBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Inviter\n2 amis',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '(bientôt)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .has5Likes ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/positive-review.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .has5Likes!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/positive-reviewBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Obtenir\n5 likes',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '(bientôt)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (trophiesUsersTrophiesRecord!
                                                                      .hasReviewApp ??
                                                                  true)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/star.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!trophiesUsersTrophiesRecord!
                                                                  .hasReviewApp!)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/starBW.png',
                                                                    width: 70,
                                                                    height: 70,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Noter\nl\'application',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayLight,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '(bientôt)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  if (activeProfilePartValue == 'Objectifs')
                                    StreamBuilder<List<UsersTrophiesRecord>>(
                                      stream: queryUsersTrophiesRecord(
                                        queryBuilder: (usersTrophiesRecord) =>
                                            usersTrophiesRecord.where('uid',
                                                isEqualTo: currentUserUid),
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
                                        List<UsersTrophiesRecord>
                                            goalsUsersTrophiesRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final goalsUsersTrophiesRecord =
                                            goalsUsersTrophiesRecordList
                                                    .isNotEmpty
                                                ? goalsUsersTrophiesRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 700,
                                          decoration: BoxDecoration(
                                            color: Color(0x00EEEEEE),
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Votre objectif',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'En kg / habitant / jour',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontSize: 8,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 3000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/planet-earth.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Equilibre\nPlanétaire',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '3 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        3000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        3000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 5000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            2),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0),
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/eiffel-tower.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Objectif 2050\nAccords de Paris ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 8,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '5 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        5000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        5000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 12000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/france.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'France',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '12 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        12000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        12000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 24000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/germany_(1).png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Allemagne',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '24 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        24000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        24000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 15000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/italy.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Italie',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '15 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        15000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        15000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 14000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/spain.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Espagne',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '14 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        14000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        14000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 10000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/sweden.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Suède',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '11 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        11000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        11000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 22000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/belgium.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Belgique',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '22 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        22000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        22000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 16000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/united-kingdom.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'UK',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '16 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        16000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        16000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 25000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/japan.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Japon',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '25 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        25000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        25000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 43000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/australia.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Australie',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '43 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        43000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        43000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 6000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/brazil.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Brézil',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '6 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        6000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        6000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 4000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/india.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Inde',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '4 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        4000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        4000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 40000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/united-states.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'USA',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '40 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        40000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        40000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 18000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/china.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Chine',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '18 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_up,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        18000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        18000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 29000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/russia.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Russie',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '29 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        29000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        29000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 1000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/nepal.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Népal',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '1 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        1000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        1000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_PAGE_userList_5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'userList_5_Backend-Call');

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            co2target: 83000,
                                                          );
                                                          await containerUsersRecord!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              26),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/qatar.png',
                                                                    width: 36,
                                                                    height: 36,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
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
                                                                        Text(
                                                                          'Qatar',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF0F1113),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              '83 Kg',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (containerUsersRecord!
                                                                            .co2target ==
                                                                        83000)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_outline_sharp,
                                                                        color: Color(
                                                                            0xCB272D30),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    if (containerUsersRecord!
                                                                            .co2target !=
                                                                        83000)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_off_rounded,
                                                                        color: Color(
                                                                            0xCC272D30),
                                                                        size:
                                                                            24,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  if (activeProfilePartValue == 'Classement')
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.orderBy(
                                                    'totalPoints',
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
                                                    color: Colors.transparent,
                                                    size: 2,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                listViewUsersRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listViewUsersRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewUsersRecord =
                                                    listViewUsersRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 4, 16, 8),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x32000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.printRank(
                                                                    listViewIndex),
                                                                '#1 ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        26),
                                                            child:
                                                                Image.network(
                                                              listViewUsersRecord
                                                                  .photoUrl!,
                                                              width: 36,
                                                              height: 36,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
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
                                                                  Text(
                                                                    listViewUsersRecord
                                                                        .displayName!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF0F1113),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
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
                                                                  Text(
                                                                    'Trophés : ${listViewUsersRecord.totalPoints?.toString()} points',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Enregistré : ${functions.printScore(listViewUsersRecord.globalScore)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Projection : ${functions.printScore(listViewUsersRecord.globalProjection)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  if (activeProfilePartValue == 'Historique')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Text(
                                              'Transports',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
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
                                                    0, 10, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: StreamBuilder<
                                                  List<TransportActionsRecord>>(
                                                stream:
                                                    queryTransportActionsRecord(
                                                  queryBuilder:
                                                      (transportActionsRecord) =>
                                                          transportActionsRecord
                                                              .where('userId',
                                                                  isEqualTo:
                                                                      currentUserUid)
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
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
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
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
                                                                    5, 0, 5, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x99F1F4F8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'car')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_carAction_ON_TAP');
                                                                                logFirebaseEvent('carAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'bus')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_busAction_ON_TAP');
                                                                                logFirebaseEvent('busAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'scooter')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_scooterAction_ON_TAP');
                                                                                logFirebaseEvent('scooterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'moto')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_motoAction_ON_TAP');
                                                                                logFirebaseEvent('motoAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'train')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_trainAction_ON_TAP');
                                                                                logFirebaseEvent('trainAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'metro')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_metroAction_ON_TAP');
                                                                                logFirebaseEvent('metroAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'flight')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_flightAction_ON_TAP');
                                                                                logFirebaseEvent('flightAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                          if (listViewTransportActionsRecord.transport ==
                                                                              'bike')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_bikeAction_ON_TAP');
                                                                                logFirebaseEvent('bikeAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: TransportWidget(
                                                                                      actionRef: listViewTransportActionsRecord.reference,
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
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_PAGE_Icon_riogaptv_ON_TAP');
                                                                            logFirebaseEvent('Icon_Navigate-To');
                                                                            await Navigator.push(
                                                                              context,
                                                                              PageTransition(
                                                                                type: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                                reverseDuration: Duration(milliseconds: 0),
                                                                                child: TransportWidget(
                                                                                  actionRef: listViewTransportActionsRecord.reference,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.edit_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('PROFILE_PAGE_Icon_l53r2dbf_ON_TAP');
                                                                              logFirebaseEvent('Icon_Backend-Call');
                                                                              await listViewTransportActionsRecord.reference.delete();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.delete_forever,
                                                                              color: Color(0xA8FF0000),
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  listViewTransportActionsRecord
                                                                      .day!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  functions.printScore(
                                                                      listViewTransportActionsRecord
                                                                          .co2e),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ).animated([
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation1']!
                                                        ]),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              'Repas',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
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
                                                    0, 10, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: StreamBuilder<
                                                  List<FoodActionsRecord>>(
                                                stream: queryFoodActionsRecord(
                                                  queryBuilder:
                                                      (foodActionsRecord) =>
                                                          foodActionsRecord
                                                              .where('userId',
                                                                  isEqualTo:
                                                                      currentUserUid)
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
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
                                                  List<FoodActionsRecord>
                                                      foodLisFoodActionsRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        foodLisFoodActionsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        foodLisIndex) {
                                                      final foodLisFoodActionsRecord =
                                                          foodLisFoodActionsRecordList[
                                                              foodLisIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 5, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x9CF1F4F8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
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
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'starter')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_starterAction_ON_TAP');
                                                                                logFirebaseEvent('starterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'main')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_mainAction_ON_TAP');
                                                                                logFirebaseEvent('mainAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                                  'assets/images/hot-pot.png',
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'desert')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_desertAction_ON_TAP');
                                                                                logFirebaseEvent('desertAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'drinks')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_drinksAction_ON_TAP');
                                                                                logFirebaseEvent('drinksAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'cheese')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_cheeseAction_ON_TAP');
                                                                                logFirebaseEvent('cheeseAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'bread')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_breadAction_ON_TAP');
                                                                                logFirebaseEvent('breadAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                          if (foodLisFoodActionsRecord.food ==
                                                                              'coffee')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_coffeeAction_ON_TAP');
                                                                                logFirebaseEvent('coffeeAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: FoodWidget(
                                                                                      actionRef: foodLisFoodActionsRecord.reference,
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
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_PAGE_Icon_poueefyl_ON_TAP');
                                                                            logFirebaseEvent('Icon_Navigate-To');
                                                                            await Navigator.push(
                                                                              context,
                                                                              PageTransition(
                                                                                type: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                                reverseDuration: Duration(milliseconds: 0),
                                                                                child: FoodWidget(
                                                                                  actionRef: foodLisFoodActionsRecord.reference,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.edit_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('PROFILE_PAGE_Icon_r9xea8de_ON_TAP');
                                                                              logFirebaseEvent('Icon_Backend-Call');
                                                                              await foodLisFoodActionsRecord.reference.delete();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.delete_forever,
                                                                              color: Color(0xA8FF0000),
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  foodLisFoodActionsRecord
                                                                      .day!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  functions.printScore(
                                                                      foodLisFoodActionsRecord
                                                                          .co2e),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ).animated([
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation2']!
                                                        ]),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              'Energies',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
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
                                                    0, 10, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: StreamBuilder<
                                                  List<EnergyActionsRecord>>(
                                                stream:
                                                    queryEnergyActionsRecord(
                                                  queryBuilder:
                                                      (energyActionsRecord) =>
                                                          energyActionsRecord
                                                              .where(
                                                                  'userId',
                                                                  isEqualTo:
                                                                      currentUserUid)
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
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
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
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
                                                                    5, 0, 5, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x9AF1F4F8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
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
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        children: [
                                                                          if (listViewEnergyActionsRecord.energy ==
                                                                              'electricity')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_electricityAction_ON_TAP');
                                                                                logFirebaseEvent('electricityAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: EnergiesWidget(
                                                                                      actionRef: listViewEnergyActionsRecord.reference,
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
                                                                          if (listViewEnergyActionsRecord.energy ==
                                                                              'gas')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_gasAction_ON_TAP');
                                                                                logFirebaseEvent('gasAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: EnergiesWidget(
                                                                                      actionRef: listViewEnergyActionsRecord.reference,
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
                                                                          if (listViewEnergyActionsRecord.energy ==
                                                                              'water')
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('PROFILE_PAGE_waterAction_ON_TAP');
                                                                                logFirebaseEvent('waterAction_Navigate-To');
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: EnergiesWidget(
                                                                                      actionRef: listViewEnergyActionsRecord.reference,
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
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('PROFILE_PAGE_Icon_9grbdbql_ON_TAP');
                                                                            logFirebaseEvent('Icon_Navigate-To');
                                                                            await Navigator.push(
                                                                              context,
                                                                              PageTransition(
                                                                                type: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                                reverseDuration: Duration(milliseconds: 0),
                                                                                child: EnergiesWidget(
                                                                                  actionRef: listViewEnergyActionsRecord.reference,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.edit_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('PROFILE_PAGE_Icon_8ib4tnm6_ON_TAP');
                                                                              logFirebaseEvent('Icon_Backend-Call');
                                                                              await listViewEnergyActionsRecord.reference.delete();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.delete_forever,
                                                                              color: Color(0xA8FF0000),
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  listViewEnergyActionsRecord
                                                                      .day!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  functions.printScore(
                                                                      listViewEnergyActionsRecord
                                                                          .co2e),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ).animated([
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation3']!
                                                        ]),
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
                                  if (activeProfilePartValue == 'Paramètres')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 12),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Paramètres',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Text(
                                                      'Dans la prochaine version, vous pourrez régler vos paramètres par défaut (type de véhicule, transports en commun, taille du foyer, etc).',
                                                      style:
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).animated([
                                            animationsMap[
                                                'containerOnPageLoadAnimation4']!
                                          ]),
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
            ],
          ),
        ),
      ),
    );
  }
}
