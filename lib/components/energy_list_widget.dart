import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../energies/energies_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EnergyListWidget extends StatefulWidget {
  const EnergyListWidget({Key? key}) : super(key: key);

  @override
  _EnergyListWidgetState createState() => _EnergyListWidgetState();
}

class _EnergyListWidgetState extends State<EnergyListWidget> {
  EnergyActionsRecord? newElectricity;
  EnergyActionsRecord? newGas;
  EnergyActionsRecord? newWater;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x25000000),
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Energies',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 46,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('ENERGY_LIST_COMP_close_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_Navigate-Back');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ENERGY_LIST_Container_5r5c5s62_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final energyActionsCreateData =
                                  createEnergyActionsRecordData(
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                isPeriodic: false,
                                energy: 'electricity',
                                isNew: true,
                              );
                              var energyActionsRecordReference =
                                  EnergyActionsRecord.collection.doc();
                              await energyActionsRecordReference
                                  .set(energyActionsCreateData);
                              newElectricity =
                                  EnergyActionsRecord.getDocumentFromData(
                                      energyActionsCreateData,
                                      energyActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: EnergiesWidget(
                                    actionRef: newElectricity!.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/energy.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Electricité',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ENERGY_LIST_Container_iugd5of2_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final energyActionsCreateData =
                                  createEnergyActionsRecordData(
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                isPeriodic: false,
                                energy: 'gas',
                                isNew: true,
                              );
                              var energyActionsRecordReference =
                                  EnergyActionsRecord.collection.doc();
                              await energyActionsRecordReference
                                  .set(energyActionsCreateData);
                              newGas = EnergyActionsRecord.getDocumentFromData(
                                  energyActionsCreateData,
                                  energyActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: EnergiesWidget(
                                    actionRef: newGas!.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/gas.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Gaz',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ENERGY_LIST_Container_sy6f42xq_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final energyActionsCreateData =
                                  createEnergyActionsRecordData(
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                isPeriodic: false,
                                energy: 'water',
                                isNew: true,
                              );
                              var energyActionsRecordReference =
                                  EnergyActionsRecord.collection.doc();
                              await energyActionsRecordReference
                                  .set(energyActionsCreateData);
                              newWater =
                                  EnergyActionsRecord.getDocumentFromData(
                                      energyActionsCreateData,
                                      energyActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: EnergiesWidget(
                                    actionRef: newWater!.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/water-drop.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Eau',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
