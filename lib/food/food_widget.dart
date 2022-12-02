import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({
    Key? key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference? actionRef;

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> with TickerProviderStateMixin {
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
    'containerOnPageLoadAnimation5': AnimationInfo(
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
    'containerOnPageLoadAnimation6': AnimationInfo(
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
  List<String>? sideComponentValues;
  String? mainComponentValue;
  int? portionsValue;
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
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Food'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FoodActionsRecord>(
      stream: FoodActionsRecord.getDocument(widget.actionRef!),
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
        final foodFoodActionsRecord = snapshot.data!;
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
                                              'FOOD_PAGE_Container_3lu83eh2_ON_TAP');
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
                                                'FOOD_PAGE_Actions_ON_TAP');
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
                                                    'FOOD_PAGE_Icon_9p0wkq6o_ON_TAP');
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
                                                'FOOD_PAGE_Stats_ON_TAP');
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
                                                'FOOD_PAGE_Profil_ON_TAP');
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
                                                        if (!foodFoodActionsRecord
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
                                                              'Repas',
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
                                                        if (foodFoodActionsRecord
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
                                                              'Repas avec répétition',
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
                                                    if (!foodFoodActionsRecord
                                                        .isPeriodic!)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          'Le ${foodFoodActionsRecord.day}',
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
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'starter')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/canape_(1).png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'main')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/hot-pot.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'desert')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/ice-cream.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'drinks')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/soft-drink.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'bread')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/bread.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'cheese')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/cheeses.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (foodFoodActionsRecord
                                                          .food ==
                                                      'coffee')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/images/coffee.png',
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
                                                  12, 0, 7, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Color(0xFF9E9E9E),
                                                    width: 1,
                                                  ),
                                                ),
                                                child:
                                                    FlutterFlowCountController(
                                                  decrementIconBuilder:
                                                      (enabled) => FaIcon(
                                                    FontAwesomeIcons.minus,
                                                    color: enabled
                                                        ? Color(0xDD000000)
                                                        : Color(0xFFEEEEEE),
                                                    size: 20,
                                                  ),
                                                  incrementIconBuilder:
                                                      (enabled) => FaIcon(
                                                    FontAwesomeIcons.plus,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .green
                                                        : Color(0xFFEEEEEE),
                                                    size: 20,
                                                  ),
                                                  countBuilder: (count) => Text(
                                                    count.toString(),
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  count: portionsValue ??=
                                                      foodFoodActionsRecord
                                                          .portions!,
                                                  updateCount: (count) async {
                                                    setState(() =>
                                                        portionsValue = count);
                                                    logFirebaseEvent(
                                                        'FOOD_Portions_ON_FORM_WIDGET_SELECTED');
                                                    logFirebaseEvent(
                                                        'Portions_backend_call');

                                                    final foodActionsUpdateData =
                                                        createFoodActionsRecordData(
                                                      portions: portionsValue,
                                                    );
                                                    await foodFoodActionsRecord
                                                        .reference
                                                        .update(
                                                            foodActionsUpdateData);
                                                  },
                                                  stepSize: 1,
                                                  minimum: 0,
                                                  maximum: 10,
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
                                                          foodFoodActionsRecord
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
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                ),
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
                                        StreamBuilder<
                                            List<FoodCalculationRecord>>(
                                          stream: queryFoodCalculationRecord(
                                            queryBuilder:
                                                (foodCalculationRecord) =>
                                                    foodCalculationRecord.where(
                                                        'foodtype',
                                                        isEqualTo:
                                                            foodFoodActionsRecord
                                                                .mainComponent),
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
                                            List<FoodCalculationRecord>
                                                containerFoodCalculationRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the document does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerFoodCalculationRecord =
                                                containerFoodCalculationRecordList
                                                        .isNotEmpty
                                                    ? containerFoodCalculationRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 10, 5, 10),
                                                child: SelectionArea(
                                                    child: Text(
                                                  containerFoodCalculationRecord!
                                                      .hint!,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                )),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                ),
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
                                        StreamBuilder<
                                            List<FoodCalculationRecord>>(
                                          stream: queryFoodCalculationRecord(
                                            queryBuilder:
                                                (foodCalculationRecord) =>
                                                    foodCalculationRecord.where(
                                                        'food',
                                                        isEqualTo:
                                                            foodFoodActionsRecord
                                                                .food),
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
                                            List<FoodCalculationRecord>
                                                containerFoodCalculationRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 12, 8, 12),
                                                child: FlutterFlowChoiceChips(
                                                  initiallySelected: [
                                                    foodFoodActionsRecord
                                                        .mainComponent!
                                                  ],
                                                  options:
                                                      containerFoodCalculationRecordList
                                                          .map((e) =>
                                                              e.foodtype!)
                                                          .toList()
                                                          .map((label) =>
                                                              ChipData(label))
                                                          .toList(),
                                                  onChanged: (val) async {
                                                    setState(() =>
                                                        mainComponentValue =
                                                            val?.first);
                                                    logFirebaseEvent(
                                                        'FOOD_mainComponent_ON_FORM_WIDGET_SELECT');
                                                    logFirebaseEvent(
                                                        'mainComponent_backend_call');

                                                    final foodActionsUpdateData =
                                                        createFoodActionsRecordData(
                                                      mainComponent:
                                                          mainComponentValue,
                                                    );
                                                    await foodFoodActionsRecord
                                                        .reference
                                                        .update(
                                                            foodActionsUpdateData);
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        Color(0xFF323B45),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                        ),
                                                    iconColor: Colors.white,
                                                    iconSize: 18,
                                                    elevation: 4,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        Colors.white,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF323B45),
                                                        ),
                                                    iconColor:
                                                        Color(0xFF323B45),
                                                    iconSize: 18,
                                                    elevation: 4,
                                                  ),
                                                  chipSpacing: 20,
                                                  multiselect: false,
                                                  initialized:
                                                      mainComponentValue !=
                                                          null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                ),
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
                                        if (foodFoodActionsRecord.food ==
                                            'main')
                                          StreamBuilder<
                                              List<FoodCalculationRecord>>(
                                            stream: queryFoodCalculationRecord(
                                              queryBuilder:
                                                  (foodCalculationRecord) =>
                                                      foodCalculationRecord
                                                          .where('food',
                                                              isEqualTo:
                                                                  'side'),
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
                                              List<FoodCalculationRecord>
                                                  containerFoodCalculationRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 12),
                                                  child: FlutterFlowChoiceChips(
                                                    initiallySelected:
                                                        foodFoodActionsRecord
                                                            .sideComponent!
                                                            .toList(),
                                                    options:
                                                        containerFoodCalculationRecordList
                                                            .map((e) =>
                                                                e.foodtype!)
                                                            .toList()
                                                            .map((label) =>
                                                                ChipData(label))
                                                            .toList(),
                                                    onChanged: (val) async {
                                                      setState(() =>
                                                          sideComponentValues =
                                                              val);
                                                      logFirebaseEvent(
                                                          'FOOD_sideComponent_ON_FORM_WIDGET_SELECT');
                                                      logFirebaseEvent(
                                                          'sideComponent_backend_call');

                                                      final foodActionsUpdateData =
                                                          {
                                                        'sideComponent':
                                                            sideComponentValues,
                                                      };
                                                      await foodFoodActionsRecord
                                                          .reference
                                                          .update(
                                                              foodActionsUpdateData);
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Color(0xFF323B45),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      iconColor: Colors.white,
                                                      iconSize: 18,
                                                      elevation: 4,
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF323B45),
                                                              ),
                                                      iconColor:
                                                          Color(0xFF323B45),
                                                      iconSize: 18,
                                                      elevation: 4,
                                                    ),
                                                    chipSpacing: 20,
                                                    multiselect: true,
                                                    initialized:
                                                        sideComponentValues !=
                                                            null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation4']!),
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
                                            foodFoodActionsRecord.createdTime,
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
                                        'containerOnPageLoadAnimation5']!),
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
                                              foodFoodActionsRecord.periodicity!
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
                                        'containerOnPageLoadAnimation6']!),
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
                                                    'FOOD_PAGE_delete_ON_TAP');
                                                logFirebaseEvent(
                                                    'delete_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                logFirebaseEvent(
                                                    'delete_backend_call');
                                                await foodFoodActionsRecord
                                                    .reference
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
                                                    'FOOD_PAGE_modify_ON_TAP');
                                                logFirebaseEvent(
                                                    'modify_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                if (foodFoodActionsRecord
                                                    .isPeriodic!) {
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  final foodActionsUpdateData =
                                                      {
                                                    ...createFoodActionsRecordData(
                                                      mainComponent:
                                                          valueOrDefault<
                                                              String>(
                                                        mainComponentValue,
                                                        'default',
                                                      ),
                                                      portions: portionsValue,
                                                    ),
                                                    'periodicity':
                                                        periodicityValues,
                                                    'sideComponent':
                                                        foodFoodActionsRecord
                                                            .sideComponent!
                                                            .toList(),
                                                  };
                                                  await foodFoodActionsRecord
                                                      .reference
                                                      .update(
                                                          foodActionsUpdateData);
                                                } else {
                                                  if (FFAppState()
                                                      .displayDays) {
                                                    logFirebaseEvent(
                                                        'modify_backend_call');

                                                    final foodActionsCreateData =
                                                        {
                                                      ...createFoodActionsRecordData(
                                                        userId: currentUserUid,
                                                        co2e: 0,
                                                        isPeriodic: true,
                                                        food:
                                                            foodFoodActionsRecord
                                                                .food,
                                                        portions: portionsValue,
                                                        mainComponent:
                                                            valueOrDefault<
                                                                String>(
                                                          mainComponentValue,
                                                          'default',
                                                        ),
                                                      ),
                                                      'periodicity':
                                                          periodicityValues,
                                                      'sideComponent':
                                                          foodFoodActionsRecord
                                                              .sideComponent!
                                                              .toList(),
                                                    };
                                                    await FoodActionsRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            foodActionsCreateData);
                                                  }
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  final foodActionsUpdateData =
                                                      {
                                                    ...createFoodActionsRecordData(
                                                      userId: currentUserUid,
                                                      day: functions
                                                          .timestampToDay(
                                                              calendarSelectedDay
                                                                  ?.start),
                                                      createdTime:
                                                          calendarSelectedDay
                                                              ?.start,
                                                      isPeriodic: false,
                                                      mainComponent:
                                                          valueOrDefault<
                                                              String>(
                                                        mainComponentValue,
                                                        'default',
                                                      ),
                                                      portions: portionsValue,
                                                    ),
                                                    'sideComponent':
                                                        foodFoodActionsRecord
                                                            .sideComponent!
                                                            .toList(),
                                                  };
                                                  await foodFoodActionsRecord
                                                      .reference
                                                      .update(
                                                          foodActionsUpdateData);
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
