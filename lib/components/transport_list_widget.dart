import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transport_list_model.dart';
export 'transport_list_model.dart';

class TransportListWidget extends StatefulWidget {
  const TransportListWidget({Key? key}) : super(key: key);

  @override
  _TransportListWidgetState createState() => _TransportListWidgetState();
}

class _TransportListWidgetState extends State<TransportListWidget> {
  late TransportListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransportListModel());

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
          color: Color(0xCCFFFFFF),
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
                    'Transports',
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
                      logFirebaseEvent('TRANSPORT_LIST_COMP_close_ICN_ON_TAP');
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
                                  'TRANSPORT_LIST_Container_ug5dagzi_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(createTransportActionsRecordData(
                                transport: 'car',
                                userId: currentUserUid,
                              ));
                              _model.newCar =
                                  TransportActionsRecord.getDocumentFromData(
                                      createTransportActionsRecordData(
                                        transport: 'car',
                                        userId: currentUserUid,
                                      ),
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                                FFAppState().displayDates = false;
                              });
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Transport',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newCar?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'transport',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'car',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/trans-car-01.svg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Voiture',
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
                                  'TRANSPORT_LIST_Container_n7qgj70o_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(createTransportActionsRecordData(
                                transport: 'bus',
                                userId: currentUserUid,
                              ));
                              _model.newBus =
                                  TransportActionsRecord.getDocumentFromData(
                                      createTransportActionsRecordData(
                                        transport: 'bus',
                                        userId: currentUserUid,
                                      ),
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                                FFAppState().displayDates = false;
                              });
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Transport',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newBus?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'transport',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'bus',
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
                                    SvgPicture.asset(
                                      'assets/images/trans-bus-02.svg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Autobus',
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
                                  'TRANSPORT_LIST_Container_tyekub91_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(createTransportActionsRecordData(
                                transport: 'scooter',
                                userId: currentUserUid,
                              ));
                              _model.newScooter =
                                  TransportActionsRecord.getDocumentFromData(
                                      createTransportActionsRecordData(
                                        transport: 'scooter',
                                        userId: currentUserUid,
                                      ),
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                                FFAppState().displayDates = false;
                              });
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Transport',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newScooter?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'transport',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'scooter',
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
                                    SvgPicture.asset(
                                      'assets/images/trans-motor-03.svg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Scooter\n',
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
                                  'TRANSPORT_LIST_Container_ku2qonrh_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(createTransportActionsRecordData(
                                transport: 'moto',
                                userId: currentUserUid,
                              ));
                              _model.newMoto =
                                  TransportActionsRecord.getDocumentFromData(
                                      createTransportActionsRecordData(
                                        transport: 'moto',
                                        userId: currentUserUid,
                                      ),
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                                FFAppState().displayDates = false;
                              });
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Transport',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newMoto?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'transport',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'moto',
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
                                      'assets/images/motorcycle.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Moto',
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
                                  'TRANSPORT_LIST_Container_joxhzjb4_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(createTransportActionsRecordData(
                                transport: 'train',
                                userId: currentUserUid,
                              ));
                              _model.newTrain =
                                  TransportActionsRecord.getDocumentFromData(
                                      createTransportActionsRecordData(
                                        transport: 'train',
                                        userId: currentUserUid,
                                      ),
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                                FFAppState().displayDates = false;
                              });
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Transport',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newTrain?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'transport',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'train',
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
                                    SvgPicture.asset(
                                      'assets/images/trans-train-04.svg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Train / Tram',
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
                                  'TRANSPORT_LIST_Container_b62z2687_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(createTransportActionsRecordData(
                                transport: 'metro',
                                userId: currentUserUid,
                              ));
                              _model.newMetro =
                                  TransportActionsRecord.getDocumentFromData(
                                      createTransportActionsRecordData(
                                        transport: 'metro',
                                        userId: currentUserUid,
                                      ),
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayOptions = false;
                                FFAppState().displayDates = false;
                              });
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Transport',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newMetro?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'transport',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'metro',
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
                                    SvgPicture.asset(
                                      'assets/images/trans-metro-06.svg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Métro',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                            'TRANSPORT_LIST_Container_8hx7eqtt_ON_TAP');
                        logFirebaseEvent('Container_backend_call');

                        var transportActionsRecordReference =
                            TransportActionsRecord.collection.doc();
                        await transportActionsRecordReference
                            .set(createTransportActionsRecordData(
                          transport: 'flight',
                          userId: currentUserUid,
                        ));
                        _model.newFlight =
                            TransportActionsRecord.getDocumentFromData(
                                createTransportActionsRecordData(
                                  transport: 'flight',
                                  userId: currentUserUid,
                                ),
                                transportActionsRecordReference);
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().update(() {
                          FFAppState().displayOptions = false;
                          FFAppState().displayDates = false;
                        });
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().update(() {
                          FFAppState().displayDays = false;
                        });
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(
                          'Transport',
                          queryParameters: {
                            'actionRef': serializeParam(
                              _model.newFlight?.reference,
                              ParamType.DocumentReference,
                            ),
                            'category': serializeParam(
                              'transport',
                              ParamType.String,
                            ),
                            'action': serializeParam(
                              'flight',
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
                                'assets/images/aircraft.png',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Avion',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
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
                            'TRANSPORT_LIST_Container_nanmgc4h_ON_TAP');
                        logFirebaseEvent('Container_backend_call');

                        var transportActionsRecordReference =
                            TransportActionsRecord.collection.doc();
                        await transportActionsRecordReference
                            .set(createTransportActionsRecordData(
                          transport: 'bike',
                          userId: currentUserUid,
                        ));
                        _model.newBike =
                            TransportActionsRecord.getDocumentFromData(
                                createTransportActionsRecordData(
                                  transport: 'bike',
                                  userId: currentUserUid,
                                ),
                                transportActionsRecordReference);
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().update(() {
                          FFAppState().displayOptions = false;
                          FFAppState().displayDates = false;
                        });
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().update(() {
                          FFAppState().displayDays = false;
                        });
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(
                          'Transport',
                          queryParameters: {
                            'actionRef': serializeParam(
                              _model.newBike?.reference,
                              ParamType.DocumentReference,
                            ),
                            'category': serializeParam(
                              'transport',
                              ParamType.String,
                            ),
                            'action': serializeParam(
                              'bike',
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
                              SvgPicture.asset(
                                'assets/images/trans-cycle-08.svg',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Vélo',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
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
      ),
    );
  }
}
