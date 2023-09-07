import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transport_model.dart';
export 'transport_model.dart';

class TransportWidget extends StatefulWidget {
  const TransportWidget({
    Key? key,
    this.actionRef,
    required this.category,
    required this.action,
  }) : super(key: key);

  final DocumentReference? actionRef;
  final String? category;
  final String? action;

  @override
  _TransportWidgetState createState() => _TransportWidgetState();
}

class _TransportWidgetState extends State<TransportWidget>
    with TickerProviderStateMixin {
  late TransportModel _model;

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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransportModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Transport'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRANSPORT_PAGE_Transport_ON_INIT_STATE');
      logFirebaseEvent('Transport_backend_call');
      _model.listOptions = await GetOptionsCall.call(
        category: widget.category,
        action: widget.action,
      );
      logFirebaseEvent('Transport_backend_call');
      _model.emissionFactor = await GetEmissionFactorCall.call(
        category: widget.category,
        action: widget.action,
      );
      logFirebaseEvent('Transport_update_app_state');
      setState(() {
        FFAppState().actionEmissionFactor = GetEmissionFactorCall.co2e(
          (_model.emissionFactor?.jsonBody ?? ''),
        );
      });
      logFirebaseEvent('Transport_update_app_state');
      setState(() {
        FFAppState().actionCO2e = functions.calculateActionCO2e(
            FFAppState().actionEmissionFactor,
            int.tryParse(_model.textController.text),
            1,
            1,
            valueOrDefault<String>(
              _model.passengersValue,
              '1',
            ));
      });
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

    return StreamBuilder<TransportActionsRecord>(
      stream: TransportActionsRecord.getDocument(widget.actionRef!),
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
        final transportTransportActionsRecord = snapshot.data!;
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
                                                'TRANSPORT_PAGE_Actions_ON_TAP');
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
                                                    'TRANSPORT_PAGE_Icon_zonjepev_ON_TAP');
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
                                                'TRANSPORT_PAGE_Stats_ON_TAP');
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
                                                'TRANSPORT_PAGE_Profil_ON_TAP');
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
                                                        if (!transportTransportActionsRecord
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
                                                              'Transports',
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
                                                        if (transportTransportActionsRecord
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
                                                              'Transport avec répétition',
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
                                                    Stack(
                                                      children: [
                                                        if (!transportTransportActionsRecord
                                                            .roundTrip)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Aller simple',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (transportTransportActionsRecord
                                                            .roundTrip)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Aller / Retour',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    if (transportTransportActionsRecord
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
                                                          'Le ${transportTransportActionsRecord.day}',
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
                                                  if (transportTransportActionsRecord
                                                          .transport ==
                                                      'car')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-car-01.svg',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-bus-02.svg',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-motor-03.svg',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/motorcycle.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-train-04.svg',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-metro-06.svg',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/aircraft.png',
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/trans-cycle-08.svg',
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
                                                  12.0, 0.0, 7.0, 0.0),
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
                                                      BorderRadius.circular(
                                                          40.0),
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
                                                    size: 20.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.menu,
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
                                                    await transportTransportActionsRecord
                                                        .reference
                                                        .update({
                                                      'roundTrip':
                                                          !transportTransportActionsRecord
                                                              .roundTrip,
                                                    });
                                                  },
                                                  value:
                                                      transportTransportActionsRecord
                                                          .roundTrip,
                                                  onIcon: Icon(
                                                    Icons
                                                        .compare_arrows_rounded,
                                                    color: Color(0xE6272D30),
                                                    size: 20.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.arrow_right_alt,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                            .textController ??=
                                                        TextEditingController(
                                                      text:
                                                          transportTransportActionsRecord
                                                              .distance,
                                                    ),
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController',
                                                      Duration(milliseconds: 0),
                                                      () async {
                                                        logFirebaseEvent(
                                                            'TRANSPORT_TextField_6hnfmxsj_ON_TEXTFIEL');
                                                        logFirebaseEvent(
                                                            'TextField_update_app_state');
                                                        setState(() {
                                                          FFAppState().actionCO2e = functions
                                                              .calculateActionCO2e(
                                                                  FFAppState()
                                                                      .actionEmissionFactor,
                                                                  int.tryParse(_model
                                                                      .textController
                                                                      .text),
                                                                  1,
                                                                  1,
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .passengersValue,
                                                                    '1',
                                                                  ));
                                                        });
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
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFF1F4F8),
                                                      suffixIcon: _model
                                                              .textController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                                logFirebaseEvent(
                                                                    'TRANSPORT_TextField_6hnfmxsj_ON_TEXTFIEL');
                                                                logFirebaseEvent(
                                                                    'TextField_update_app_state');
                                                                setState(() {
                                                                  FFAppState().actionCO2e = functions
                                                                      .calculateActionCO2e(
                                                                          FFAppState()
                                                                              .actionEmissionFactor,
                                                                          int.tryParse(_model
                                                                              .textController
                                                                              .text),
                                                                          1,
                                                                          1,
                                                                          valueOrDefault<
                                                                              String>(
                                                                            _model.passengersValue,
                                                                            '1',
                                                                          ));
                                                                });
                                                                setState(() {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: Color(
                                                                    0xFF757575),
                                                                size: 25.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .powertypeValueController ??=
                                                    FormFieldController<String>(
                                                  _model.powertypeValue ??=
                                                      transportTransportActionsRecord
                                                          .powertype,
                                                ),
                                                options:
                                                    (GetOptionsCall.options(
                                                  (_model.listOptions
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .powertypeValue = val);
                                                  logFirebaseEvent(
                                                      'TRANSPORT_powertype_ON_FORM_WIDGET_SELEC');
                                                  logFirebaseEvent(
                                                      'powertype_backend_call');
                                                  _model.calculationOption =
                                                      await GetEmissionFactorCall
                                                          .call(
                                                    category: widget.category,
                                                    action: widget.action,
                                                    option:
                                                        _model.powertypeValue,
                                                  );
                                                  logFirebaseEvent(
                                                      'powertype_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                            .actionEmissionFactor =
                                                        GetEmissionFactorCall
                                                            .co2e(
                                                      (_model.calculationOption
                                                              ?.jsonBody ??
                                                          ''),
                                                    );
                                                  });
                                                  logFirebaseEvent(
                                                      'powertype_update_app_state');
                                                  setState(() {
                                                    FFAppState().actionCO2e = functions
                                                        .calculateActionCO2e(
                                                            FFAppState()
                                                                .actionEmissionFactor,
                                                            int.tryParse(_model
                                                                .textController
                                                                .text),
                                                            1,
                                                            1,
                                                            valueOrDefault<
                                                                String>(
                                                              _model
                                                                  .passengersValue,
                                                              '1',
                                                            ));
                                                  });

                                                  setState(() {});
                                                },
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText: 'Type de transport',
                                                icon: Icon(
                                                  Icons
                                                      .electrical_services_rounded,
                                                  size: 15.0,
                                                ),
                                                fillColor: Color(0xFFFAFAFA),
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                borderWidth: 1.0,
                                                borderRadius: 100.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                          if (transportTransportActionsRecord
                                                  .transport ==
                                              'car')
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .passengersValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.passengersValue ??=
                                                        transportTransportActionsRecord
                                                            .passengers,
                                                  ),
                                                  options: functions
                                                      .getTransportPassengers(
                                                          transportTransportActionsRecord
                                                              .transport),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                        .passengersValue = val);
                                                    logFirebaseEvent(
                                                        'TRANSPORT_passengers_ON_FORM_WIDGET_SELE');
                                                    logFirebaseEvent(
                                                        'passengers_backend_call');

                                                    await transportTransportActionsRecord
                                                        .reference
                                                        .update(
                                                            createTransportActionsRecordData(
                                                      passengers: _model
                                                          .passengersValue,
                                                    ));
                                                    logFirebaseEvent(
                                                        'passengers_update_app_state');
                                                    setState(() {
                                                      FFAppState().actionCO2e = functions
                                                          .calculateActionCO2e(
                                                              FFAppState()
                                                                  .actionEmissionFactor,
                                                              int.tryParse(_model
                                                                  .textController
                                                                  .text),
                                                              1,
                                                              1,
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .passengersValue,
                                                                '1',
                                                              ));
                                                    });
                                                  },
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  hintText: 'Passagers',
                                                  icon: Icon(
                                                    Icons.family_restroom,
                                                    size: 15.0,
                                                  ),
                                                  fillColor: Color(0xFFFAFAFA),
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayLight,
                                                  borderWidth: 1.0,
                                                  borderRadius: 100.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
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
                                            transportTransportActionsRecord
                                                .createdTime,
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
                                        'containerOnPageLoadAnimation3']!),
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
                                            transportTransportActionsRecord
                                                .periodicity,
                                          ),
                                          wrapped: true,
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
                                                    'TRANSPORT_PAGE_delete_ON_TAP');
                                                logFirebaseEvent(
                                                    'delete_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = true;
                                                });
                                                logFirebaseEvent(
                                                    'delete_backend_call');
                                                await widget.actionRef!
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
                                                    'TRANSPORT_PAGE_modify_ON_TAP');
                                                logFirebaseEvent(
                                                    'modify_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = true;
                                                });
                                                if (transportTransportActionsRecord
                                                    .isPeriodic) {
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  await widget.actionRef!
                                                      .update({
                                                    ...createTransportActionsRecordData(
                                                      distance: _model
                                                          .textController.text,
                                                      powertype:
                                                          _model.powertypeValue,
                                                      passengers: _model
                                                          .passengersValue,
                                                      co2e: FFAppState()
                                                          .actionCO2e,
                                                    ),
                                                    'periodicity': _model
                                                        .periodicityValues,
                                                  });
                                                } else {
                                                  if (FFAppState()
                                                      .displayDays) {
                                                    logFirebaseEvent(
                                                        'modify_backend_call');

                                                    await TransportActionsRecord
                                                        .collection
                                                        .doc()
                                                        .set({
                                                      ...createTransportActionsRecordData(
                                                        transport:
                                                            transportTransportActionsRecord
                                                                .transport,
                                                        powertype: _model
                                                            .powertypeValue,
                                                        userId:
                                                            transportTransportActionsRecord
                                                                .userId,
                                                        co2e: FFAppState()
                                                            .actionCO2e,
                                                        passengers: _model
                                                            .passengersValue,
                                                        roundTrip:
                                                            transportTransportActionsRecord
                                                                .roundTrip,
                                                        isPeriodic: true,
                                                        distance: _model
                                                            .textController
                                                            .text,
                                                      ),
                                                      'periodicity': _model
                                                          .periodicityValues,
                                                    });
                                                  }
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  await widget.actionRef!.update(
                                                      createTransportActionsRecordData(
                                                    distance: _model
                                                        .textController.text,
                                                    powertype:
                                                        _model.powertypeValue,
                                                    userId: currentUserUid,
                                                    passengers:
                                                        _model.passengersValue,
                                                    day: functions
                                                        .timestampToDay(_model
                                                            .calendarSelectedDay
                                                            ?.start),
                                                    createdTime: _model
                                                        .calendarSelectedDay
                                                        ?.start,
                                                    isPeriodic: false,
                                                    co2e:
                                                        FFAppState().actionCO2e,
                                                  ));
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
