import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_model.dart';
export 'food_model.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({
    Key? key,
    this.actionRef,
    required this.category,
    required this.action,
  }) : super(key: key);

  final DocumentReference? actionRef;
  final String? category;
  final String? action;

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> with TickerProviderStateMixin {
  late FoodModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
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
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
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
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
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
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
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
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
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
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Food'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FOOD_PAGE_Food_ON_INIT_STATE');
      logFirebaseEvent('Food_backend_call');
      _model.options = await GetOptionsCall.call(
        category: widget.category,
        action: widget.action,
      );
      logFirebaseEvent('Food_backend_call');
      _model.emissionFactor = await GetEmissionFactorCall.call(
        category: widget.category,
        action: widget.action,
      );
      logFirebaseEvent('Food_update_app_state');
      setState(() {
        FFAppState().actionEmissionFactor = GetEmissionFactorCall.co2e(
          (_model.emissionFactor?.jsonBody ?? ''),
        );
      });
      if (widget.action == 'main') {
        logFirebaseEvent('Food_backend_call');
        _model.listOptionsSide = await GetOptionsCall.call(
          category: widget.category,
          action: 'side',
        );
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<FoodActionsRecord>(
      stream: FoodActionsRecord.getDocument(widget.actionRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 2.0,
                height: 2.0,
                child: SpinKitRing(
                  color: Colors.transparent,
                  size: 2.0,
                ),
              ),
            ),
          );
        }
        final foodFoodActionsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                    maxHeight: MediaQuery.sizeOf(context).height * 1.0,
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
                                width: 2.0,
                                height: 2.0,
                                child: SpinKitRing(
                                  color: Colors.transparent,
                                  size: 2.0,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> headerUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final headerUsersRecord =
                              headerUsersRecordList.isNotEmpty
                                  ? headerUsersRecordList.first
                                  : null;
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
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
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: SvgPicture.asset(
                                            'assets/images/menu.svg',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/logo_light.png',
                                        width: 100.0,
                                        height: 40.0,
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
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_PAGE_Actions_ON_TAP');
                                            logFirebaseEvent(
                                                'Actions_navigate_to');

                                            context.pushNamed('Statistiques');
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x4DFFFFFF),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Color(0x2C000000),
                                                  offset: Offset(0.0, 4.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
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
                                                        .tertiary,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_PAGE_Stats_ON_TAP');
                                            logFirebaseEvent(
                                                'Stats_navigate_to');

                                            context.pushNamed('Statistiques');
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x4DFFFFFF),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Color(0x2C000000),
                                                  offset: Offset(0.0, 4.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.stacked_bar_chart,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_PAGE_Profil_ON_TAP');
                                            logFirebaseEvent(
                                                'Profil_navigate_to');

                                            context.pushNamed('Profile');
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Color(0x2C000000),
                                                  offset: Offset(0.0, 4.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  headerUsersRecord?.photoUrl,
                                                  'https://storage.googleapis.com/carbonfight-89af6.appspot.com/default_photo_url.png',
                                                ),
                                                width: 50.0,
                                                height: 50.0,
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
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xB3FFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x2B202529),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 0.0, 4.0),
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
                                                            .isPeriodic)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Repas',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (foodFoodActionsRecord
                                                            .isPeriodic)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Repas avec répétition',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    if (!foodFoodActionsRecord
                                                        .isPeriodic)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Le ${foodFoodActionsRecord.day}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 14.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/canape_(1).png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/hot-pot.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/ice-cream.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/soft-drink.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/bread.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/cheeses.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/coffee.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                  12.0, 0.0, 7.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 120.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Color(0xFF9E9E9E),
                                                    width: 1.0,
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
                                                    size: 20.0,
                                                  ),
                                                  incrementIconBuilder:
                                                      (enabled) => FaIcon(
                                                    FontAwesomeIcons.plus,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .green
                                                        : Color(0xFFEEEEEE),
                                                    size: 20.0,
                                                  ),
                                                  countBuilder: (count) => Text(
                                                    count.toString(),
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  count:
                                                      _model.portionsValue ??=
                                                          foodFoodActionsRecord
                                                              .portions,
                                                  updateCount: (count) async {
                                                    setState(() => _model
                                                        .portionsValue = count);
                                                    logFirebaseEvent(
                                                        'FOOD_Portions_ON_FORM_WIDGET_SELECTED');
                                                    logFirebaseEvent(
                                                        'Portions_backend_call');

                                                    await foodFoodActionsRecord
                                                        .reference
                                                        .update(
                                                            createFoodActionsRecordData(
                                                      portions:
                                                          _model.portionsValue,
                                                    ));
                                                    logFirebaseEvent(
                                                        'Portions_update_app_state');
                                                    setState(() {
                                                      FFAppState().actionCO2e =
                                                          functions.calculateActionCO2e(
                                                              FFAppState()
                                                                  .actionEmissionFactor,
                                                              _model
                                                                  .portionsValue,
                                                              1,
                                                              1,
                                                              '1');
                                                    });
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
                                                      BorderRadius.circular(
                                                          40.0),
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
                                                    size: 20.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.threesixty,
                                                    color: Color(0x8157636C),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF1F4F8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
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
                                                    size: 20.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.date_range_rounded,
                                                    color: Color(0x8157636C),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  functions.printScore(
                                                      FFAppState().actionCO2e),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 20.0,
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
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xB3FFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x2B202529),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 5.0, 10.0),
                                            child: SelectionArea(
                                                child: Text(
                                              FFAppState().actionHint,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xB3FFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x2B202529),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 20.0, 8.0, 20.0),
                                            child: FlutterFlowChoiceChips(
                                              options: (GetOptionsCall.options(
                                                (_model.options?.jsonBody ??
                                                    ''),
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()!
                                                  .map((label) =>
                                                      ChipData(label))
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.mainComponentValue =
                                                        val?.first);
                                                logFirebaseEvent(
                                                    'FOOD_mainComponent_ON_FORM_WIDGET_SELECT');
                                                logFirebaseEvent(
                                                    'mainComponent_backend_call');

                                                await foodFoodActionsRecord
                                                    .reference
                                                    .update(
                                                        createFoodActionsRecordData(
                                                  mainComponent:
                                                      _model.mainComponentValue,
                                                ));
                                                logFirebaseEvent(
                                                    'mainComponent_backend_call');
                                                _model.emissionFactorMain =
                                                    await GetEmissionFactorCall
                                                        .call(
                                                  category: widget.category,
                                                  action: widget.action,
                                                  option:
                                                      _model.mainComponentValue,
                                                  sideList: _model
                                                      .sideComponentValues,
                                                );
                                                logFirebaseEvent(
                                                    'mainComponent_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                          .actionEmissionFactor =
                                                      GetEmissionFactorCall
                                                          .co2e(
                                                    (_model.emissionFactorMain
                                                            ?.jsonBody ??
                                                        ''),
                                                  );
                                                });
                                                logFirebaseEvent(
                                                    'mainComponent_update_app_state');
                                                setState(() {
                                                  FFAppState().actionCO2e =
                                                      functions.calculateActionCO2e(
                                                          FFAppState()
                                                              .actionEmissionFactor,
                                                          _model.portionsValue,
                                                          1,
                                                          1,
                                                          '1');
                                                });
                                                logFirebaseEvent(
                                                    'mainComponent_update_app_state');
                                                setState(() {
                                                  FFAppState().actionHint =
                                                      GetEmissionFactorCall
                                                          .hint(
                                                    (_model.emissionFactorMain
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString();
                                                });

                                                setState(() {});
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF323B45),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 18.0,
                                                elevation: 4.0,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF323B45),
                                                    ),
                                                iconColor: Color(0xFF323B45),
                                                iconSize: 18.0,
                                                elevation: 4.0,
                                              ),
                                              chipSpacing: 20.0,
                                              rowSpacing: 12.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.mainComponentValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .mainComponentValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [
                                                  foodFoodActionsRecord
                                                      .mainComponent
                                                ],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xB3FFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x2B202529),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (foodFoodActionsRecord.food ==
                                            'main')
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 8.0, 20.0),
                                              child: FlutterFlowChoiceChips(
                                                options:
                                                    (GetOptionsCall.options(
                                                  (_model.listOptionsSide
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .sideComponentValues =
                                                      val);
                                                  logFirebaseEvent(
                                                      'FOOD_sideComponent_ON_FORM_WIDGET_SELECT');
                                                  logFirebaseEvent(
                                                      'sideComponent_backend_call');

                                                  await foodFoodActionsRecord
                                                      .reference
                                                      .update({
                                                    'sideComponent': _model
                                                        .sideComponentValues,
                                                  });
                                                  logFirebaseEvent(
                                                      'sideComponent_backend_call');
                                                  _model.emissionFactorSide =
                                                      await GetEmissionFactorCall
                                                          .call(
                                                    category: widget.category,
                                                    action: widget.action,
                                                    option: _model
                                                        .mainComponentValue,
                                                    sideList: _model
                                                        .sideComponentValues,
                                                  );
                                                  logFirebaseEvent(
                                                      'sideComponent_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                            .actionEmissionFactor =
                                                        GetEmissionFactorCall
                                                            .co2e(
                                                      (_model.emissionFactorSide
                                                              ?.jsonBody ??
                                                          ''),
                                                    );
                                                  });
                                                  logFirebaseEvent(
                                                      'sideComponent_update_app_state');
                                                  setState(() {
                                                    FFAppState().actionCO2e =
                                                        functions.calculateActionCO2e(
                                                            FFAppState()
                                                                .actionEmissionFactor,
                                                            _model
                                                                .portionsValue,
                                                            1,
                                                            1,
                                                            '1');
                                                  });

                                                  setState(() {});
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      Color(0xFF323B45),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                          ),
                                                  iconColor: Colors.white,
                                                  iconSize: 18.0,
                                                  elevation: 4.0,
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFF323B45),
                                                      ),
                                                  iconColor: Color(0xFF323B45),
                                                  iconSize: 18.0,
                                                  elevation: 4.0,
                                                ),
                                                chipSpacing: 20.0,
                                                rowSpacing: 12.0,
                                                multiselect: true,
                                                initialized: _model
                                                        .sideComponentValues !=
                                                    null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .sideComponentValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  foodFoodActionsRecord
                                                      .sideComponent,
                                                ),
                                                wrapped: true,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation4']!),
                                ),
                                if (FFAppState().displayDates)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xB3FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x2B202529),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: FlutterFlowCalendar(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        weekFormat: true,
                                        weekStartsMonday: true,
                                        initialDate:
                                            foodFoodActionsRecord.createdTime,
                                        onChange:
                                            (DateTimeRange? newSelectedDate) {
                                          setState(() =>
                                              _model.calendarSelectedDay =
                                                  newSelectedDate);
                                        },
                                        titleStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                        ),
                                        dayOfWeekStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
                                        ),
                                        dateStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
                                        ),
                                        selectedDateStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
                                        ),
                                        inactiveDateStyle: GoogleFonts.getFont(
                                          'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
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
                                        16.0, 8.0, 16.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xB3FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x2B202529),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 16.0, 12.0, 16.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('Lundi'),
                                            ChipData('Mardi'),
                                            ChipData('Mercredi'),
                                            ChipData('Jeudi'),
                                            ChipData('Vendredi'),
                                            ChipData('Samedi'),
                                            ChipData('Dimanche')
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.periodicityValues = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor: Color(0xFF323B45),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            iconColor: Colors.white,
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.white,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF323B45),
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            iconColor: Color(0xFF323B45),
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                          ),
                                          chipSpacing: 10.0,
                                          rowSpacing: 17.0,
                                          multiselect: true,
                                          initialized:
                                              _model.periodicityValues != null,
                                          alignment: WrapAlignment.spaceEvenly,
                                          controller: _model
                                                  .periodicityValueController ??=
                                              FormFieldController<List<String>>(
                                            foodFoodActionsRecord.periodicity,
                                          ),
                                          wrapped: true,
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
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 15.0),
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
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'FOOD_PAGE_delete_ON_TAP');
                                                logFirebaseEvent(
                                                    'delete_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = true;
                                                });
                                                logFirebaseEvent(
                                                    'delete_backend_call');
                                                await foodFoodActionsRecord
                                                    .reference
                                                    .delete();
                                                logFirebaseEvent(
                                                    'delete_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = false;
                                                });
                                                logFirebaseEvent(
                                                    'delete_navigate_to');

                                                context.pushNamed('Home');
                                              },
                                              child: wrapWithModel(
                                                model: _model.deleteModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: IconButtonWidget(
                                                  fillColor: Color(0x98BC0909),
                                                  fontColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  icon: Icon(
                                                    Icons.delete_forever,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 20.0,
                                                  ),
                                                  text: 'Supprimer ',
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().loading)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model.deleteWaitModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: IconButtonWidget(
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .gray,
                                                fontColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.delete_forever,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 20.0,
                                                ),
                                                text: 'Supprimer ',
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Stack(
                                        children: [
                                          if (!FFAppState().loading)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'FOOD_PAGE_modify_ON_TAP');
                                                logFirebaseEvent(
                                                    'modify_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = true;
                                                });
                                                if (foodFoodActionsRecord
                                                    .isPeriodic) {
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  await foodFoodActionsRecord
                                                      .reference
                                                      .update({
                                                    ...createFoodActionsRecordData(
                                                      mainComponent:
                                                          valueOrDefault<
                                                              String>(
                                                        _model
                                                            .mainComponentValue,
                                                        'default',
                                                      ),
                                                      portions:
                                                          _model.portionsValue,
                                                      co2e: FFAppState()
                                                          .actionCO2e,
                                                    ),
                                                    'periodicity': _model
                                                        .periodicityValues,
                                                    'sideComponent':
                                                        foodFoodActionsRecord
                                                            .sideComponent,
                                                  });
                                                } else {
                                                  if (FFAppState()
                                                      .displayDays) {
                                                    logFirebaseEvent(
                                                        'modify_backend_call');

                                                    await FoodActionsRecord
                                                        .collection
                                                        .doc()
                                                        .set({
                                                      ...createFoodActionsRecordData(
                                                        userId: currentUserUid,
                                                        co2e: FFAppState()
                                                            .actionCO2e,
                                                        isPeriodic: true,
                                                        food:
                                                            foodFoodActionsRecord
                                                                .food,
                                                        portions: _model
                                                            .portionsValue,
                                                        mainComponent:
                                                            valueOrDefault<
                                                                String>(
                                                          _model
                                                              .mainComponentValue,
                                                          'default',
                                                        ),
                                                      ),
                                                      'periodicity': _model
                                                          .periodicityValues,
                                                      'sideComponent':
                                                          foodFoodActionsRecord
                                                              .sideComponent,
                                                    });
                                                  }
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  await foodFoodActionsRecord
                                                      .reference
                                                      .update({
                                                    ...createFoodActionsRecordData(
                                                      userId: currentUserUid,
                                                      day: functions
                                                          .timestampToDay(_model
                                                              .calendarSelectedDay
                                                              ?.start),
                                                      createdTime: _model
                                                          .calendarSelectedDay
                                                          ?.start,
                                                      isPeriodic: false,
                                                      mainComponent:
                                                          valueOrDefault<
                                                              String>(
                                                        _model
                                                            .mainComponentValue,
                                                        'default',
                                                      ),
                                                      portions:
                                                          _model.portionsValue,
                                                      co2e: FFAppState()
                                                          .actionCO2e,
                                                    ),
                                                    'sideComponent':
                                                        foodFoodActionsRecord
                                                            .sideComponent,
                                                  });
                                                }

                                                logFirebaseEvent(
                                                    'modify_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = false;
                                                });
                                                logFirebaseEvent(
                                                    'modify_navigate_to');

                                                context.pushNamed('Home');
                                              },
                                              child: wrapWithModel(
                                                model: _model.modifyModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: IconButtonWidget(
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  fontColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  icon: Icon(
                                                    Icons.add_circle_outline,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 20.0,
                                                  ),
                                                  text: 'Valider ',
                                                ),
                                              ),
                                            ),
                                          if (FFAppState().loading)
                                            wrapWithModel(
                                              model: _model.modifyWaitModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: IconButtonWidget(
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .gray,
                                                fontColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 20.0,
                                                ),
                                                text: 'Valider ',
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
