import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TransportWidget extends StatefulWidget {
  const TransportWidget({
    Key? key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference? actionRef;

  @override
  _TransportWidgetState createState() => _TransportWidgetState();
}

class _TransportWidgetState extends State<TransportWidget>
    with TickerProviderStateMixin {
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
  DateTimeRange? calendarSelectedDay;
  String? passengersValue;
  String? powertypeValue;
  TextEditingController? textController;
  List<String>? periodicityValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Transport'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransportActionsRecord>(
      stream: TransportActionsRecord.getDocument(widget.actionRef!),
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
        final transportTransportActionsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                        'assets/images/Final_Concept_flou.jpg',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              'TRANSPORT_PAGE_Container_6axr6553_ON_TAP');
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
                                                'TRANSPORT_PAGE_Actions_ON_TAP');
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
                                                    'TRANSPORT_PAGE_Icon_zonjepev_ON_TAP');
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
                                                'TRANSPORT_PAGE_Stats_ON_TAP');
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
                                                'TRANSPORT_PAGE_Profil_ON_TAP');
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 4, 0, 4),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (!transportTransportActionsRecord
                                                            .isPeriodic!)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Transports',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (transportTransportActionsRecord
                                                                .isPeriodic ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Transport avec répétition',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (!transportTransportActionsRecord
                                                            .roundTrip!)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Aller simple',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (transportTransportActionsRecord
                                                                .roundTrip ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Aller / Retour',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    if (transportTransportActionsRecord
                                                            .isPeriodic ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          'Le ${transportTransportActionsRecord.day}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
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
                                              Stack(
                                                children: [
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'car')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-car-01.svg',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'bus')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-bus-02.svg',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'scooter')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-motor-03.svg',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'moto')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/motorcycle.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'train')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-train-04.svg',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'metro')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-metro-06.svg',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'flight')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/aircraft.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'bike')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-cycle-08.svg',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 7, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    setState(() => FFAppState()
                                                            .displayOptions =
                                                        !FFAppState()
                                                            .displayOptions);
                                                  },
                                                  value: FFAppState()
                                                      .displayOptions,
                                                  onIcon: Icon(
                                                    Icons.menu_open,
                                                    color: Color(0xE6272D30),
                                                    size: 20,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.menu,
                                                    color: Color(0x8157636C),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    final transportActionsUpdateData =
                                                        {
                                                      'roundTrip':
                                                          !transportTransportActionsRecord
                                                              .roundTrip!,
                                                    };
                                                    await transportTransportActionsRecord
                                                        .reference
                                                        .update(
                                                            transportActionsUpdateData);
                                                  },
                                                  value:
                                                      transportTransportActionsRecord
                                                          .roundTrip!,
                                                  onIcon: Icon(
                                                    Icons
                                                        .compare_arrows_rounded,
                                                    color: Color(0xE6272D30),
                                                    size: 20,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.arrow_right_alt,
                                                    color: Color(0x8157636C),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    setState(() => FFAppState()
                                                            .displayDays =
                                                        !FFAppState()
                                                            .displayDays);
                                                  },
                                                  value:
                                                      FFAppState().displayDays,
                                                  onIcon: Icon(
                                                    Icons.threesixty,
                                                    color: Color(0xE6272D30),
                                                    size: 20,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.threesixty,
                                                    color: Color(0x8157636C),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    setState(() => FFAppState()
                                                            .displayDates =
                                                        !FFAppState()
                                                            .displayDates);
                                                  },
                                                  value:
                                                      FFAppState().displayDates,
                                                  onIcon: Icon(
                                                    Icons.date_range_rounded,
                                                    color: Color(0xE6272D30),
                                                    size: 20,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.date_range_rounded,
                                                    color: Color(0x8157636C),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    '+ ${valueOrDefault<String>(
                                                      functions.printScore(
                                                          transportTransportActionsRecord
                                                              .co2e),
                                                      '0',
                                                    )}',
                                                    '+ 0 g',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 20,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 8),
                                                  child: TextFormField(
                                                    controller: textController ??=
                                                        TextEditingController(
                                                      text:
                                                          transportTransportActionsRecord
                                                              .distance,
                                                    ),
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      'textController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        logFirebaseEvent(
                                                            'TRANSPORT_TextField_6hnfmxsj_ON_TEXTFIEL');
                                                        logFirebaseEvent(
                                                            'TextField_backend_call');

                                                        final transportActionsUpdateData =
                                                            createTransportActionsRecordData(
                                                          distance:
                                                              textController
                                                                      ?.text ??
                                                                  '',
                                                        );
                                                        await transportTransportActionsRecord
                                                            .reference
                                                            .update(
                                                                transportActionsUpdateData);
                                                      },
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: functions
                                                          .getTransportDistanceLabel(
                                                              transportTransportActionsRecord
                                                                  .transport),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayLight,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayLight,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFF1F4F8),
                                                      suffixIcon:
                                                          textController!.text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    textController
                                                                        ?.clear();
                                                                    logFirebaseEvent(
                                                                        'TRANSPORT_TextField_6hnfmxsj_ON_TEXTFIEL');
                                                                    logFirebaseEvent(
                                                                        'TextField_backend_call');

                                                                    final transportActionsUpdateData =
                                                                        createTransportActionsRecordData(
                                                                      distance:
                                                                          textController?.text ??
                                                                              '',
                                                                    );
                                                                    await transportTransportActionsRecord
                                                                        .reference
                                                                        .update(
                                                                            transportActionsUpdateData);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 25,
                                                                  ),
                                                                )
                                                              : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                ),
                                if (FFAppState().displayOptions)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
                                    child: StreamBuilder<
                                        List<TransportCalculationRecord>>(
                                      stream: queryTransportCalculationRecord(
                                        queryBuilder: (transportCalculationRecord) =>
                                            transportCalculationRecord.where(
                                                'transport',
                                                isEqualTo:
                                                    transportTransportActionsRecord
                                                        .transport),
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
                                        List<TransportCalculationRecord>
                                            transportParametersTransportCalculationRecordList =
                                            snapshot.data!;
                                        return Container(
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
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 8, 12, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      initialOption:
                                                          powertypeValue ??=
                                                              transportTransportActionsRecord
                                                                  .powertype,
                                                      options:
                                                          transportParametersTransportCalculationRecordList
                                                              .map((e) =>
                                                                  e.powertype!)
                                                              .toList()
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        setState(() =>
                                                            powertypeValue =
                                                                val);
                                                        logFirebaseEvent(
                                                            'TRANSPORT_powertype_ON_FORM_WIDGET_SELEC');
                                                        logFirebaseEvent(
                                                            'powertype_backend_call');

                                                        final transportActionsUpdateData =
                                                            createTransportActionsRecordData(
                                                          powertype:
                                                              powertypeValue,
                                                        );
                                                        await transportTransportActionsRecord
                                                            .reference
                                                            .update(
                                                                transportActionsUpdateData);
                                                      },
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 40,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'Type de transport',
                                                      icon: Icon(
                                                        Icons
                                                            .electrical_services_rounded,
                                                        size: 15,
                                                      ),
                                                      fillColor:
                                                          Color(0xFFFAFAFA),
                                                      elevation: 2,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayLight,
                                                      borderWidth: 1,
                                                      borderRadius: 100,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 4, 12, 4),
                                                      hidesUnderline: true,
                                                    ),
                                                  ),
                                                ),
                                                if (transportTransportActionsRecord
                                                        .transport ==
                                                    'car')
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        initialOption:
                                                            passengersValue ??=
                                                                transportTransportActionsRecord
                                                                    .passengers,
                                                        options: functions
                                                            .getTransportPassengers(
                                                                transportTransportActionsRecord
                                                                    .transport)
                                                            .toList(),
                                                        onChanged: (val) async {
                                                          setState(() =>
                                                              passengersValue =
                                                                  val);
                                                          logFirebaseEvent(
                                                              'TRANSPORT_passengers_ON_FORM_WIDGET_SELE');
                                                          logFirebaseEvent(
                                                              'passengers_backend_call');

                                                          final transportActionsUpdateData =
                                                              createTransportActionsRecordData(
                                                            passengers:
                                                                passengersValue,
                                                          );
                                                          await transportTransportActionsRecord
                                                              .reference
                                                              .update(
                                                                  transportActionsUpdateData);
                                                        },
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 40,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        hintText: 'Passagers',
                                                        icon: Icon(
                                                          Icons.family_restroom,
                                                          size: 15,
                                                        ),
                                                        fillColor:
                                                            Color(0xFFFAFAFA),
                                                        elevation: 2,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayLight,
                                                        borderWidth: 1,
                                                        borderRadius: 100,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 4,
                                                                    12, 4),
                                                        hidesUnderline: true,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!);
                                      },
                                    ),
                                  ),
                                if (FFAppState().displayDates)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
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
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: FlutterFlowCalendar(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        weekFormat: true,
                                        weekStartsMonday: true,
                                        initialDate:
                                            transportTransportActionsRecord
                                                .createdTime,
                                        onChange:
                                            (DateTimeRange? newSelectedDate) {
                                          setState(() => calendarSelectedDay =
                                              newSelectedDate);
                                        },
                                        titleStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                        dayOfWeekStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                        dateStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                        selectedDateStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                        inactiveDateStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation3']!),
                                  ),
                                if (FFAppState().displayDays)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
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
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 8, 12, 8),
                                        child: FlutterFlowChoiceChips(
                                          initiallySelected:
                                              transportTransportActionsRecord
                                                  .periodicity!
                                                  .toList(),
                                          options: [
                                            ChipData('Lundi'),
                                            ChipData('Mardi'),
                                            ChipData('Mercredi'),
                                            ChipData('Jeudi'),
                                            ChipData('Vendredi'),
                                            ChipData('Samedi'),
                                            ChipData('Dimanche')
                                          ],
                                          onChanged: (val) => setState(
                                              () => periodicityValues = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor: Color(0xFF323B45),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            iconColor: Colors.white,
                                            iconSize: 18,
                                            elevation: 4,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.white,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF323B45),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            iconColor: Color(0xFF323B45),
                                            iconSize: 18,
                                            elevation: 4,
                                          ),
                                          chipSpacing: 10,
                                          rowSpacing: 5,
                                          multiselect: true,
                                          initialized:
                                              periodicityValues != null,
                                          alignment: WrapAlignment.spaceEvenly,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation4']!),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0, 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        if (!FFAppState().loading)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'TRANSPORT_PAGE_delete_ON_TAP');
                                                logFirebaseEvent(
                                                    'delete_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                logFirebaseEvent(
                                                    'delete_backend_call');
                                                await widget.actionRef!
                                                    .delete();
                                                logFirebaseEvent(
                                                    'delete_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = false);
                                                logFirebaseEvent(
                                                    'delete_navigate_to');

                                                context.pushNamed('Home');
                                              },
                                              child: IconButtonWidget(
                                                fillColor: Color(0x98BC0909),
                                                fontColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                icon: Icon(
                                                  Icons.delete_forever,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 20,
                                                ),
                                                text: 'Supprimer ',
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().loading)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: IconButtonWidget(
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              icon: Icon(
                                                Icons.delete_forever,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 20,
                                              ),
                                              text: 'Supprimer ',
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Stack(
                                        children: [
                                          if (!FFAppState().loading)
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'TRANSPORT_PAGE_modify_ON_TAP');
                                                logFirebaseEvent(
                                                    'modify_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                if (transportTransportActionsRecord
                                                    .isPeriodic!) {
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  final transportActionsUpdateData =
                                                      {
                                                    ...createTransportActionsRecordData(
                                                      distance: textController
                                                              ?.text ??
                                                          '',
                                                      powertype: powertypeValue,
                                                      passengers:
                                                          passengersValue,
                                                    ),
                                                    'periodicity':
                                                        periodicityValues,
                                                  };
                                                  await widget.actionRef!.update(
                                                      transportActionsUpdateData);
                                                } else {
                                                  if (FFAppState()
                                                      .displayDays) {
                                                    logFirebaseEvent(
                                                        'modify_backend_call');

                                                    final transportActionsCreateData =
                                                        {
                                                      ...createTransportActionsRecordData(
                                                        transport:
                                                            transportTransportActionsRecord
                                                                .transport,
                                                        powertype:
                                                            powertypeValue,
                                                        userId:
                                                            transportTransportActionsRecord
                                                                .userId,
                                                        co2e: 0,
                                                        passengers:
                                                            passengersValue,
                                                        roundTrip:
                                                            transportTransportActionsRecord
                                                                .roundTrip,
                                                        isPeriodic: true,
                                                        distance: textController
                                                                ?.text ??
                                                            '',
                                                      ),
                                                      'periodicity':
                                                          periodicityValues,
                                                    };
                                                    await TransportActionsRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            transportActionsCreateData);
                                                  }
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  final transportActionsUpdateData =
                                                      createTransportActionsRecordData(
                                                    distance:
                                                        textController?.text ??
                                                            '',
                                                    powertype: powertypeValue,
                                                    userId: currentUserUid,
                                                    passengers: passengersValue,
                                                    day: functions
                                                        .timestampToDay(
                                                            calendarSelectedDay
                                                                ?.start),
                                                    createdTime:
                                                        calendarSelectedDay
                                                            ?.start,
                                                    isPeriodic: false,
                                                  );
                                                  await widget.actionRef!.update(
                                                      transportActionsUpdateData);
                                                }

                                                logFirebaseEvent(
                                                    'modify_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = false);
                                                logFirebaseEvent(
                                                    'modify_navigate_to');

                                                context.pushNamed('Home');
                                              },
                                              child: IconButtonWidget(
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                fontColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 20,
                                                ),
                                                text: 'Valider ',
                                              ),
                                            ),
                                          if (FFAppState().loading)
                                            IconButtonWidget(
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              icon: Icon(
                                                Icons.add_circle_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 20,
                                              ),
                                              text: 'Valider ',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
