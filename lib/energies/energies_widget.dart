import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EnergiesWidget extends StatefulWidget {
  const EnergiesWidget({
    Key key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference actionRef;

  @override
  _EnergiesWidgetState createState() => _EnergiesWidgetState();
}

class _EnergiesWidgetState extends State<EnergiesWidget> {
  String peopleSharingValue;
  String powertypeValue;
  TextEditingController volumeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Energies'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EnergyActionsRecord>(
      stream: EnergyActionsRecord.getDocument(widget.actionRef),
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
        final energiesEnergyActionsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: Container(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ENERGIES_PAGE_Container_x1h8lbj7_ON_TAP');
                                    if ((energiesEnergyActionsRecord
                                            .isTemporary) ==
                                        true) {
                                      logFirebaseEvent(
                                          'Container_Backend-Call');
                                      await widget.actionRef.delete();
                                    }
                                    logFirebaseEvent('Container_Navigate-Back');
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ajouter un contrat',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xACEEEEEE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Stack(
                                          children: [
                                            if ((energiesEnergyActionsRecord
                                                    .energy) ==
                                                'electricity')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/energy.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((energiesEnergyActionsRecord
                                                    .energy) ==
                                                'gas')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/gas.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((energiesEnergyActionsRecord
                                                    .energy) ==
                                                'water')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/water-drop.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Text(
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
                                          style: FlutterFlowTheme.of(context)
                                              .title2,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ENERGIES_PAGE_Icon_ehjvb7c0_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_Update-Local-State');
                                              setState(() => FFAppState()
                                                      .actionCO2 =
                                                  functions.energyPeriodicsCO2e(
                                                      energiesEnergyActionsRecord
                                                          .energy,
                                                      int.parse(volumeController
                                                              ?.text ??
                                                          ''),
                                                      powertypeValue,
                                                      peopleSharingValue));
                                              logFirebaseEvent(
                                                  'Icon_Backend-Call');

                                              final energyActionsUpdateData =
                                                  createEnergyActionsRecordData(
                                                co2e: FFAppState().actionCO2,
                                              );
                                              await widget.actionRef.update(
                                                  energyActionsUpdateData);
                                            },
                                            child: Icon(
                                              Icons.sync_sharp,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: volumeController ??=
                                                TextEditingController(
                                              text: energiesEnergyActionsRecord
                                                  .volume
                                                  .toString(),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Consommation annuelle (KWH)',
                                              hintText:
                                                  'Consommation annuelle (KWH)',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              prefixIcon: Icon(
                                                Icons.today_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                size: 16,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if ((energiesEnergyActionsRecord
                                                .energy) !=
                                            'water')
                                          Expanded(
                                            child: FlutterFlowDropDown(
                                              initialOption: powertypeValue ??=
                                                  energiesEnergyActionsRecord
                                                      .powertype,
                                              options: functions
                                                  .getEnergyPowertype(
                                                      energiesEnergyActionsRecord
                                                          .energy)
                                                  .toList(),
                                              onChanged: (val) => setState(
                                                  () => powertypeValue = val),
                                              width: 180,
                                              height: 50,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              hintText: 'Type d\'énergie',
                                              icon: FaIcon(
                                                FontAwesomeIcons.fire,
                                              ),
                                              fillColor: Color(0xFFFAFAFA),
                                              elevation: 2,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                              borderWidth: 1,
                                              borderRadius: 100,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
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
                                            onChanged: (val) => setState(
                                                () => peopleSharingValue = val),
                                            width: 180,
                                            height: 50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            hintText: 'Taille du foyer',
                                            icon: Icon(
                                              Icons.family_restroom,
                                              size: 15,
                                            ),
                                            fillColor: Color(0xFFFAFAFA),
                                            elevation: 2,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .grayLight,
                                            borderWidth: 1,
                                            borderRadius: 100,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.9),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: [
                                      if (!(energiesEnergyActionsRecord
                                              .isTemporary) ??
                                          true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ENERGIES_PAGE_delete_ON_TAP');
                                            logFirebaseEvent(
                                                'delete_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'delete_Backend-Call');
                                            await widget.actionRef.delete();
                                            logFirebaseEvent(
                                                'delete_Navigate-Back');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'delete_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = false);
                                          },
                                          child: IconButtonWidget(
                                            fillColor: Color(0x98BC0909),
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
                                      if (energiesEnergyActionsRecord
                                              .isTemporary ??
                                          true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ENERGIES_PAGE_cancel_ON_TAP');
                                            logFirebaseEvent(
                                                'cancel_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'cancel_Backend-Call');
                                            await widget.actionRef.delete();
                                            logFirebaseEvent(
                                                'cancel_Navigate-Back');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'cancel_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = false);
                                          },
                                          child: IconButtonWidget(
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .gray,
                                            fontColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Annuler ',
                                          ),
                                        ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      if (!(FFAppState().loading) ?? true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ENERGIES_PAGE_modify_ON_TAP');
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() => FFAppState()
                                                    .actionCO2 =
                                                functions.energyPeriodicsCO2e(
                                                    energiesEnergyActionsRecord
                                                        .energy,
                                                    int.parse(volumeController
                                                            ?.text ??
                                                        ''),
                                                    powertypeValue,
                                                    peopleSharingValue));
                                            logFirebaseEvent(
                                                'modify_Backend-Call');

                                            final energyActionsUpdateData =
                                                createEnergyActionsRecordData(
                                              powertype: powertypeValue,
                                              userId: currentUserUid,
                                              co2e: FFAppState().actionCO2,
                                              isTemporary: false,
                                              volume: int.parse(
                                                  volumeController?.text ?? ''),
                                              peopleSharing: peopleSharingValue,
                                            );
                                            await widget.actionRef.update(
                                                energyActionsUpdateData);
                                            logFirebaseEvent(
                                                'modify_Navigate-Back');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = false);
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Valider ',
                                          ),
                                        ),
                                      if (FFAppState().loading ?? true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: IconButtonWidget(
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .gray,
                                            fontColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            icon: Icon(
                                              Icons.sync,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Valider',
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
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
        );
      },
    );
  }
}
