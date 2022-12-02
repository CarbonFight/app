import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EnergiesWidget extends StatefulWidget {
  const EnergiesWidget({
    Key? key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference? actionRef;

  @override
  _EnergiesWidgetState createState() => _EnergiesWidgetState();
}

class _EnergiesWidgetState extends State<EnergiesWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
  String? peopleSharingValue;
  String? powertypeValue;
  TextEditingController? volumeController;
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Energies'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    volumeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EnergyActionsRecord>(
      stream: EnergyActionsRecord.getDocument(widget.actionRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final energiesEnergyActionsRecord = snapshot.data!;
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
                                                'ENERGIES_PAGE_Actions_ON_TAP');
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
                                                    'ENERGIES_PAGE_Icon_noq30xx1_ON_TAP');
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
                                                'ENERGIES_PAGE_Stats_ON_TAP');
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
                                                'ENERGIES_PAGE_Profil_ON_TAP');
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
                                  child: StreamBuilder<
                                      List<EnergyCalculationRecord>>(
                                    stream: queryEnergyCalculationRecord(
                                      queryBuilder: (energyCalculationRecord) =>
                                          energyCalculationRecord.where(
                                              'energy',
                                              isEqualTo:
                                                  energiesEnergyActionsRecord
                                                      .energy),
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
                                      List<EnergyCalculationRecord>
                                          energiesDetailsEnergyCalculationRecordList =
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 4, 0, 4),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            'Énergies',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            'Consommation annuelle',
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
                                                      if (energiesEnergyActionsRecord
                                                              .energy ==
                                                          'electricity')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Image.asset(
                                                            'assets/images/energy.png',
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      if (energiesEnergyActionsRecord
                                                              .energy ==
                                                          'gas')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Image.asset(
                                                            'assets/images/gas.png',
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      if (energiesEnergyActionsRecord
                                                              .energy ==
                                                          'water')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Image.asset(
                                                            'assets/images/water-drop.png',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 8, 12, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller:
                                                          volumeController ??=
                                                              TextEditingController(
                                                        text:
                                                            energiesEnergyActionsRecord
                                                                .volume,
                                                      ),
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        'volumeController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'ENERGIES_PAGE_volume_ON_TEXTFIELD_CHANGE');
                                                          logFirebaseEvent(
                                                              'volume_backend_call');

                                                          final energyActionsUpdateData =
                                                              createEnergyActionsRecordData(
                                                            volume:
                                                                volumeController
                                                                        ?.text ??
                                                                    '',
                                                          );
                                                          await energiesEnergyActionsRecord
                                                              .reference
                                                              .update(
                                                                  energyActionsUpdateData);
                                                        },
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: functions
                                                            .getEnergyVolumeLabel(
                                                                energiesEnergyActionsRecord
                                                                    .energy),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayLight,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayLight,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        suffixIcon:
                                                            volumeController!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      volumeController
                                                                          ?.clear();
                                                                      logFirebaseEvent(
                                                                          'ENERGIES_PAGE_volume_ON_TEXTFIELD_CHANGE');
                                                                      logFirebaseEvent(
                                                                          'volume_backend_call');

                                                                      final energyActionsUpdateData =
                                                                          createEnergyActionsRecordData(
                                                                        volume:
                                                                            volumeController?.text ??
                                                                                '',
                                                                      );
                                                                      await energiesEnergyActionsRecord
                                                                          .reference
                                                                          .update(
                                                                              energyActionsUpdateData);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: Color(
                                                                          0xFF757575),
                                                                      size: 22,
                                                                    ),
                                                                  )
                                                                : null,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText2
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.number,
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
                                                              energiesEnergyActionsRecord
                                                                  .co2e),
                                                          '0',
                                                        )}',
                                                        '+ 0 g',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 20,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 8, 12, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        initialOption:
                                                            peopleSharingValue ??=
                                                                energiesEnergyActionsRecord
                                                                    .peopleSharing,
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
                                                          setState(() =>
                                                              peopleSharingValue =
                                                                  val);
                                                          logFirebaseEvent(
                                                              'ENERGIES_peopleSharing_ON_FORM_WIDGET_SE');
                                                          logFirebaseEvent(
                                                              'peopleSharing_backend_call');

                                                          final energyActionsUpdateData =
                                                              createEnergyActionsRecordData(
                                                            peopleSharing:
                                                                peopleSharingValue,
                                                          );
                                                          await energiesEnergyActionsRecord
                                                              .reference
                                                              .update(
                                                                  energyActionsUpdateData);
                                                        },
                                                        width: 100,
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
                                                            'Taille du foyer',
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
                                                  if (energiesEnergyActionsRecord
                                                          .energy !=
                                                      'water')
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          initialOption:
                                                              powertypeValue ??=
                                                                  energiesEnergyActionsRecord
                                                                      .powertype,
                                                          options:
                                                              energiesDetailsEnergyCalculationRecordList
                                                                  .map((e) => e
                                                                      .powertype!)
                                                                  .toList()
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            setState(() =>
                                                                powertypeValue =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'ENERGIES_powertype_ON_FORM_WIDGET_SELECT');
                                                            logFirebaseEvent(
                                                                'powertype_backend_call');

                                                            final energyActionsUpdateData =
                                                                createEnergyActionsRecordData(
                                                              powertype:
                                                                  powertypeValue,
                                                            );
                                                            await energiesEnergyActionsRecord
                                                                .reference
                                                                .update(
                                                                    energyActionsUpdateData);
                                                          },
                                                          width: 100,
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
                                                              'Type d\'énergie',
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .fire,
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
                                                                  .fromSTEB(12,
                                                                      4, 12, 4),
                                                          hidesUnderline: true,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!);
                                    },
                                  ),
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
                                                    'ENERGIES_PAGE_delete_ON_TAP');
                                                logFirebaseEvent(
                                                    'delete_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                logFirebaseEvent(
                                                    'delete_backend_call');
                                                await energiesEnergyActionsRecord
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
                                                    'ENERGIES_PAGE_modify_ON_TAP');
                                                logFirebaseEvent(
                                                    'modify_update_local_state');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                if (energiesEnergyActionsRecord
                                                        .isPeriodic ==
                                                    true) {
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  final energyActionsUpdateData =
                                                      createEnergyActionsRecordData(
                                                    powertype: powertypeValue,
                                                    peopleSharing:
                                                        peopleSharingValue,
                                                    volume: volumeController
                                                            ?.text ??
                                                        '',
                                                    isNew: false,
                                                  );
                                                  await energiesEnergyActionsRecord
                                                      .reference
                                                      .update(
                                                          energyActionsUpdateData);
                                                } else {
                                                  if (energiesEnergyActionsRecord
                                                      .isNew!) {
                                                    logFirebaseEvent(
                                                        'modify_backend_call');

                                                    final energyActionsCreateData =
                                                        createEnergyActionsRecordData(
                                                      powertype: powertypeValue,
                                                      userId:
                                                          energiesEnergyActionsRecord
                                                              .userId,
                                                      co2e: 0,
                                                      isPeriodic: true,
                                                      energy:
                                                          energiesEnergyActionsRecord
                                                              .energy,
                                                      peopleSharing:
                                                          peopleSharingValue,
                                                      volume: volumeController
                                                              ?.text ??
                                                          '',
                                                    );
                                                    await EnergyActionsRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            energyActionsCreateData);
                                                  }
                                                  logFirebaseEvent(
                                                      'modify_backend_call');

                                                  final energyActionsUpdateData =
                                                      createEnergyActionsRecordData(
                                                    powertype: powertypeValue,
                                                    peopleSharing:
                                                        peopleSharingValue,
                                                    volume: volumeController
                                                            ?.text ??
                                                        '',
                                                    isNew: false,
                                                  );
                                                  await energiesEnergyActionsRecord
                                                      .reference
                                                      .update(
                                                          energyActionsUpdateData);
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
