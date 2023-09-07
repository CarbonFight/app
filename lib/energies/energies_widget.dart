import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'energies_model.dart';
export 'energies_model.dart';

class EnergiesWidget extends StatefulWidget {
  const EnergiesWidget({
    Key? key,
    this.actionRef,
    required this.category,
    required this.action,
  }) : super(key: key);

  final DocumentReference? actionRef;
  final String? category;
  final String? action;

  @override
  _EnergiesWidgetState createState() => _EnergiesWidgetState();
}

class _EnergiesWidgetState extends State<EnergiesWidget>
    with TickerProviderStateMixin {
  late EnergiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => EnergiesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Energies'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ENERGIES_PAGE_Energies_ON_INIT_STATE');
      logFirebaseEvent('Energies_backend_call');
      _model.listOptions = await GetOptionsCall.call(
        category: widget.category,
        action: widget.action,
      );
      logFirebaseEvent('Energies_backend_call');
      _model.emissionFactor = await GetEmissionFactorCall.call(
        category: widget.category,
        action: widget.action,
      );
      logFirebaseEvent('Energies_update_app_state');
      setState(() {
        FFAppState().actionEmissionFactor = GetEmissionFactorCall.co2e(
          (_model.emissionFactor?.jsonBody ?? ''),
        );
      });
      logFirebaseEvent('Energies_update_app_state');
      setState(() {
        FFAppState().actionCO2e = functions.calculateActionCO2e(
            GetEmissionFactorCall.co2e(
              (_model.emissionFactor?.jsonBody ?? ''),
            ),
            int.tryParse(_model.volumeController.text),
            1,
            365,
            valueOrDefault<String>(
              _model.peopleSharingValue,
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

    return StreamBuilder<EnergyActionsRecord>(
      stream: EnergyActionsRecord.getDocument(widget.actionRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final energiesEnergyActionsRecord = snapshot.data!;
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
                                              'ENERGIES_PAGE_Container_at2m3b55_ON_TAP');
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
                                                'ENERGIES_PAGE_Actions_ON_TAP');
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
                                                    'ENERGIES_PAGE_Icon_noq30xx1_ON_TAP');
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
                                                'ENERGIES_PAGE_Stats_ON_TAP');
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
                                                'ENERGIES_PAGE_Profil_ON_TAP');
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Énergies',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF101213),
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Consommation annuelle',
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
                                                  if (energiesEnergyActionsRecord
                                                          .energy ==
                                                      'electricity')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/energy.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (energiesEnergyActionsRecord
                                                          .energy ==
                                                      'gas')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/gas.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (energiesEnergyActionsRecord
                                                          .energy ==
                                                      'water')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Image.asset(
                                                        'assets/images/water-drop.png',
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
                                                  12.0, 8.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                          .volumeController ??=
                                                      TextEditingController(
                                                    text:
                                                        energiesEnergyActionsRecord
                                                            .volume,
                                                  ),
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.volumeController',
                                                    Duration(milliseconds: 0),
                                                    () async {
                                                      logFirebaseEvent(
                                                          'ENERGIES_PAGE_volume_ON_TEXTFIELD_CHANGE');
                                                      logFirebaseEvent(
                                                          'volume_backend_call');

                                                      await energiesEnergyActionsRecord
                                                          .reference
                                                          .update(
                                                              createEnergyActionsRecordData(
                                                        volume: _model
                                                            .volumeController
                                                            .text,
                                                      ));
                                                      logFirebaseEvent(
                                                          'volume_update_app_state');
                                                      setState(() {
                                                        FFAppState().actionCO2e = functions
                                                            .calculateActionCO2e(
                                                                FFAppState()
                                                                    .actionEmissionFactor,
                                                                int.tryParse(_model
                                                                    .volumeController
                                                                    .text),
                                                                1,
                                                                365,
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .peopleSharingValue,
                                                                  '1',
                                                                ));
                                                      });
                                                    },
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: functions
                                                        .getEnergyVolumeLabel(
                                                            energiesEnergyActionsRecord
                                                                .energy),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayLight,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                          BorderRadius.circular(
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
                                                          BorderRadius.circular(
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
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    suffixIcon:
                                                        _model.volumeController!
                                                                .text.isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .volumeController
                                                                      ?.clear();
                                                                  logFirebaseEvent(
                                                                      'ENERGIES_PAGE_volume_ON_TEXTFIELD_CHANGE');
                                                                  logFirebaseEvent(
                                                                      'volume_backend_call');

                                                                  await energiesEnergyActionsRecord
                                                                      .reference
                                                                      .update(
                                                                          createEnergyActionsRecordData(
                                                                    volume: _model
                                                                        .volumeController
                                                                        .text,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'volume_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .actionCO2e =
                                                                        functions.calculateActionCO2e(
                                                                            FFAppState().actionEmissionFactor,
                                                                            int.tryParse(_model.volumeController.text),
                                                                            1,
                                                                            365,
                                                                            valueOrDefault<String>(
                                                                              _model.peopleSharingValue,
                                                                              '1',
                                                                            ));
                                                                  });
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22.0,
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
                                                      .volumeControllerValidator
                                                      .asValidator(context),
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
                                                  12.0, 8.0, 12.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .peopleSharingValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.peopleSharingValue ??=
                                                          energiesEnergyActionsRecord
                                                              .peopleSharing,
                                                    ),
                                                    options: [
                                                      '1',
                                                      '2',
                                                      '3',
                                                      '4',
                                                      '5',
                                                      '6',
                                                      '7',
                                                      '8'
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .peopleSharingValue =
                                                          val);
                                                      logFirebaseEvent(
                                                          'ENERGIES_peopleSharing_ON_FORM_WIDGET_SE');
                                                      logFirebaseEvent(
                                                          'peopleSharing_backend_call');

                                                      await energiesEnergyActionsRecord
                                                          .reference
                                                          .update(
                                                              createEnergyActionsRecordData(
                                                        peopleSharing: _model
                                                            .peopleSharingValue,
                                                      ));
                                                      logFirebaseEvent(
                                                          'peopleSharing_update_app_state');
                                                      setState(() {
                                                        FFAppState().actionCO2e = functions
                                                            .calculateActionCO2e(
                                                                FFAppState()
                                                                    .actionEmissionFactor,
                                                                int.tryParse(_model
                                                                    .volumeController
                                                                    .text),
                                                                1,
                                                                365,
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .peopleSharingValue,
                                                                  '1',
                                                                ));
                                                      });
                                                    },
                                                    width: 100.0,
                                                    height: 40.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintText: 'Taille du foyer',
                                                    icon: Icon(
                                                      Icons.family_restroom,
                                                      size: 15.0,
                                                    ),
                                                    fillColor:
                                                        Color(0xFFFAFAFA),
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .grayLight,
                                                    borderWidth: 1.0,
                                                    borderRadius: 100.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                              if (energiesEnergyActionsRecord
                                                      .energy !=
                                                  'water')
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .powertypeValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.powertypeValue ??=
                                                            energiesEnergyActionsRecord
                                                                .powertype,
                                                      ),
                                                      options: (GetOptionsCall
                                                              .options(
                                                        (_model.listOptions
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!,
                                                      onChanged: (val) async {
                                                        setState(() => _model
                                                                .powertypeValue =
                                                            val);
                                                        logFirebaseEvent(
                                                            'ENERGIES_powertype_ON_FORM_WIDGET_SELECT');
                                                        logFirebaseEvent(
                                                            'powertype_backend_call');

                                                        await energiesEnergyActionsRecord
                                                            .reference
                                                            .update(
                                                                createEnergyActionsRecordData(
                                                          powertype: _model
                                                              .powertypeValue,
                                                        ));
                                                        logFirebaseEvent(
                                                            'powertype_backend_call');
                                                        _model.calculationEnergyOption =
                                                            await GetEmissionFactorCall
                                                                .call(
                                                          category:
                                                              widget.category,
                                                          action: widget.action,
                                                          option: _model
                                                              .powertypeValue,
                                                        );
                                                        logFirebaseEvent(
                                                            'powertype_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .actionEmissionFactor =
                                                              GetEmissionFactorCall
                                                                  .co2e(
                                                            (_model.calculationEnergyOption
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
                                                                      .volumeController
                                                                      .text),
                                                                  1,
                                                                  365,
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .peopleSharingValue,
                                                                    '1',
                                                                  ));
                                                        });

                                                        setState(() {});
                                                      },
                                                      width: 100.0,
                                                      height: 40.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'Type d\'énergie',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.fire,
                                                      ),
                                                      fillColor:
                                                          Color(0xFFFAFAFA),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayLight,
                                                      borderWidth: 1.0,
                                                      borderRadius: 100.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
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
                                                    'ENERGIES_PAGE_delete_ON_TAP');
                                                logFirebaseEvent(
                                                    'delete_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = true;
                                                });
                                                logFirebaseEvent(
                                                    'delete_backend_call');
                                                await energiesEnergyActionsRecord
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
                                                    'ENERGIES_PAGE_modify_ON_TAP');
                                                logFirebaseEvent(
                                                    'modify_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().loading = true;
                                                });
                                                if (energiesEnergyActionsRecord
                                                        .isPeriodic ==
                                                    true) {
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  await energiesEnergyActionsRecord
                                                      .reference
                                                      .update(
                                                          createEnergyActionsRecordData(
                                                    powertype:
                                                        _model.powertypeValue,
                                                    peopleSharing: _model
                                                        .peopleSharingValue,
                                                    volume: _model
                                                        .volumeController.text,
                                                    isNew: false,
                                                    co2e:
                                                        FFAppState().actionCO2e,
                                                  ));
                                                } else {
                                                  if (energiesEnergyActionsRecord
                                                      .isNew) {
                                                    logFirebaseEvent(
                                                        'modify_backend_call');

                                                    await EnergyActionsRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createEnergyActionsRecordData(
                                                          powertype: _model
                                                              .powertypeValue,
                                                          userId:
                                                              energiesEnergyActionsRecord
                                                                  .userId,
                                                          co2e: FFAppState()
                                                              .actionCO2e,
                                                          isPeriodic: true,
                                                          energy:
                                                              energiesEnergyActionsRecord
                                                                  .energy,
                                                          peopleSharing: _model
                                                              .peopleSharingValue,
                                                          volume: _model
                                                              .volumeController
                                                              .text,
                                                        ));
                                                  }
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  await energiesEnergyActionsRecord
                                                      .reference
                                                      .update(
                                                          createEnergyActionsRecordData(
                                                    powertype:
                                                        _model.powertypeValue,
                                                    peopleSharing: _model
                                                        .peopleSharingValue,
                                                    volume: _model
                                                        .volumeController.text,
                                                    isNew: false,
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
