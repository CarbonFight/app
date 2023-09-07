import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'energy_list_model.dart';
export 'energy_list_model.dart';

class EnergyListWidget extends StatefulWidget {
  const EnergyListWidget({Key? key}) : super(key: key);

  @override
  _EnergyListWidgetState createState() => _EnergyListWidgetState();
}

class _EnergyListWidgetState extends State<EnergyListWidget> {
  late EnergyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnergyListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x25000000),
              offset: Offset(0.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Energies',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 46.0,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('ENERGY_LIST_COMP_close_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_close_dialog,_drawer,_etc');
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ENERGY_LIST_Container_5r5c5s62_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var energyActionsRecordReference =
                                  EnergyActionsRecord.collection.doc();
                              await energyActionsRecordReference
                                  .set(createEnergyActionsRecordData(
                                userId: currentUserUid,
                                isPeriodic: true,
                                energy: 'electricity',
                              ));
                              _model.newElectricity =
                                  EnergyActionsRecord.getDocumentFromData(
                                      createEnergyActionsRecordData(
                                        userId: currentUserUid,
                                        isPeriodic: true,
                                        energy: 'electricity',
                                      ),
                                      energyActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Energies',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newElectricity?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'energy',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'electricity',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/energy.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Electricité',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
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
                                  'ENERGY_LIST_Container_iugd5of2_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var energyActionsRecordReference =
                                  EnergyActionsRecord.collection.doc();
                              await energyActionsRecordReference
                                  .set(createEnergyActionsRecordData(
                                userId: currentUserUid,
                                isPeriodic: true,
                                energy: 'gas',
                              ));
                              _model.newGas =
                                  EnergyActionsRecord.getDocumentFromData(
                                      createEnergyActionsRecordData(
                                        userId: currentUserUid,
                                        isPeriodic: true,
                                        energy: 'gas',
                                      ),
                                      energyActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Energies',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newGas?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'energy',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'gas',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/gas.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Gaz',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ENERGY_LIST_Container_sy6f42xq_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var energyActionsRecordReference =
                                  EnergyActionsRecord.collection.doc();
                              await energyActionsRecordReference
                                  .set(createEnergyActionsRecordData(
                                userId: currentUserUid,
                                isPeriodic: true,
                                energy: 'water',
                              ));
                              _model.newWater =
                                  EnergyActionsRecord.getDocumentFromData(
                                      createEnergyActionsRecordData(
                                        userId: currentUserUid,
                                        isPeriodic: true,
                                        energy: 'water',
                                      ),
                                      energyActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Energies',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newWater?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'energy',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'water',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/water-drop.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Eau',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
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
