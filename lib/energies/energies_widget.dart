import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../drawer/drawer_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../profile/profile_widget.dart';
import '../statistiques/statistiques_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
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
  String? peopleSharingValue;
  String? powertypeValue;
  TextEditingController? volumeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Energies'});
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
              width: 2,
              height: 2,
              child: SpinKitRing(
                color: Colors.transparent,
                size: 2,
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
                                      logFirebaseEvent(
                                          'ENERGIES_PAGE_Container_at2m3b55_ON_TAP');
                                      logFirebaseEvent('Container_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 300),
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
                                            'ENERGIES_PAGE_Actions_ON_TAP');
                                        logFirebaseEvent('Actions_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
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
                                            color: FlutterFlowTheme.of(context)
                                                .grayLight,
                                            width: 1,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ENERGIES_PAGE_Icon_noq30xx1_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_Navigate-To');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                                reverseDuration:
                                                    Duration(milliseconds: 0),
                                                child: HomeWidget(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
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
                                        logFirebaseEvent('Stats_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
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
                                            color: FlutterFlowTheme.of(context)
                                                .grayLight,
                                            width: 1,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.stacked_bar_chart,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ENERGIES_PAGE_Profil_ON_TAP');
                                        logFirebaseEvent('Profil_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
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
                                          color: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        'Énergies',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        'Consommation annuelle',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
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
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
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
                                                              .fromSTEB(
                                                                  0, 0, 10, 0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 8, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                    Duration(milliseconds: 500),
                                                    () => setState(() {}),
                                                  ),
                                                  autofocus: true,
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
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayLight,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                    suffixIcon:
                                                        volumeController!
                                                                .text.isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  volumeController
                                                                      ?.clear();
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22,
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
                                                  12, 8, 12, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                                  child: FlutterFlowDropDown(
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
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            peopleSharingValue =
                                                                val),
                                                    width: 100,
                                                    height: 40,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintText: 'Taille du foyer',
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
                                                            .fromSTEB(
                                                                12, 4, 12, 4),
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
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: FlutterFlowDropDown(
                                                      initialOption:
                                                          powertypeValue ??=
                                                              energiesEnergyActionsRecord
                                                                  .powertype,
                                                      options: functions
                                                          .getEnergyPowertype(
                                                              energiesEnergyActionsRecord
                                                                  .energy)
                                                          .toList(),
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              powertypeValue =
                                                                  val),
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
                                                        FontAwesomeIcons.fire,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animated([
                                    animationsMap[
                                        'containerOnPageLoadAnimation']!
                                  ]),
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
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ENERGIES_PAGE_cancel_ON_TAP');
                                          logFirebaseEvent(
                                              'cancel_Update-Local-State');
                                          setState(() =>
                                              FFAppState().loading = false);
                                          logFirebaseEvent(
                                              'cancel_Navigate-To');
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child: HomeWidget(),
                                            ),
                                          );
                                        },
                                        child: IconButtonWidget(
                                          fillColor: Color(0x65A5A5A5),
                                          fontColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiaryColor,
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 20,
                                          ),
                                          text: 'Fermer',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ENERGIES_PAGE_cancel_ON_TAP');
                                          logFirebaseEvent(
                                              'cancel_Update-Local-State');
                                          setState(() => FFAppState()
                                                  .actionCO2 =
                                              functions.energyPeriodicsCO2e(
                                                  energiesEnergyActionsRecord
                                                      .energy,
                                                  volumeController?.text ?? '',
                                                  valueOrDefault<String>(
                                                    powertypeValue,
                                                    'Nucléaire',
                                                  ),
                                                  valueOrDefault<String>(
                                                    peopleSharingValue,
                                                    '1',
                                                  )));
                                          logFirebaseEvent(
                                              'cancel_Backend-Call');

                                          final energyActionsUpdateData =
                                              createEnergyActionsRecordData(
                                            co2e: FFAppState().actionCO2,
                                          );
                                          await energiesEnergyActionsRecord
                                              .reference
                                              .update(energyActionsUpdateData);
                                        },
                                        child: IconButtonWidget(
                                          fillColor: Color(0x5300A193),
                                          fontColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiaryColor,
                                          icon: Icon(
                                            Icons.sync_rounded,
                                            color: Color(0x6523D0C1),
                                            size: 20,
                                          ),
                                          text: 'Calculer ',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                                    'delete_Update-Local-State');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                logFirebaseEvent(
                                                    'delete_Backend-Call');
                                                await energiesEnergyActionsRecord
                                                    .reference
                                                    .delete();
                                                logFirebaseEvent(
                                                    'delete_Update-Local-State');
                                                setState(() => FFAppState()
                                                    .loading = false);
                                                logFirebaseEvent(
                                                    'delete_Navigate-To');
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
                                                    'modify_Update-Local-State');
                                                setState(() => FFAppState()
                                                    .loading = true);
                                                logFirebaseEvent(
                                                    'modify_Update-Local-State');
                                                setState(() => FFAppState()
                                                        .actionCO2 =
                                                    functions
                                                        .energyPeriodicsCO2e(
                                                            energiesEnergyActionsRecord
                                                                .energy,
                                                            volumeController
                                                                    ?.text ??
                                                                '',
                                                            valueOrDefault<
                                                                String>(
                                                              powertypeValue,
                                                              'Nucléaire',
                                                            ),
                                                            valueOrDefault<
                                                                String>(
                                                              peopleSharingValue,
                                                              '1',
                                                            )));
                                                if (energiesEnergyActionsRecord
                                                        .isPeriodic ==
                                                    true) {
                                                  logFirebaseEvent(
                                                      'modify_Backend-Call');

                                                  final energyActionsUpdateData =
                                                      createEnergyActionsRecordData(
                                                    powertype: powertypeValue,
                                                    co2e:
                                                        FFAppState().actionCO2,
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
                                                        'modify_Backend-Call');

                                                    final energyActionsCreateData =
                                                        createEnergyActionsRecordData(
                                                      powertype: powertypeValue,
                                                      userId:
                                                          energiesEnergyActionsRecord
                                                              .userId,
                                                      co2e: FFAppState()
                                                          .actionCO2,
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
                                                      'modify_Backend-Call');

                                                  final energyActionsUpdateData =
                                                      createEnergyActionsRecordData(
                                                    powertype: powertypeValue,
                                                    co2e:
                                                        FFAppState().actionCO2,
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
                                                    'modify_Update-Local-State');
                                                setState(() => FFAppState()
                                                    .loading = false);
                                                logFirebaseEvent(
                                                    'modify_Navigate-To');
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
