import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../transport/transport_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TransportListWidget extends StatefulWidget {
  const TransportListWidget({Key key}) : super(key: key);

  @override
  _TransportListWidgetState createState() => _TransportListWidgetState();
}

class _TransportListWidgetState extends State<TransportListWidget> {
  TransportActionsRecord newBike;
  TransportActionsRecord newFlight;
  TransportActionsRecord newBus;
  TransportActionsRecord newCar;
  TransportActionsRecord newMoto;
  TransportActionsRecord newScooter;
  TransportActionsRecord newMetro;
  TransportActionsRecord newTrain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xCCFFFFFF),
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
                    'Transports',
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
                      logFirebaseEvent('TRANSPORT_LIST_COMP_close_ICN_ON_TAP');
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
                                  'TRANSPORT_LIST_Container_ug5dagzi_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final transportActionsCreateData =
                                  createTransportActionsRecordData(
                                transport: 'car',
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                roundTrip: false,
                                isPeriodic: false,
                                isFavorite: false,
                              );
                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(transportActionsCreateData);
                              newCar =
                                  TransportActionsRecord.getDocumentFromData(
                                      transportActionsCreateData,
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDates = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDays = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: TransportWidget(
                                    actionRef: newCar.reference,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/trans-car-01.svg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Voiture',
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
                                  'TRANSPORT_LIST_Container_n7qgj70o_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final transportActionsCreateData =
                                  createTransportActionsRecordData(
                                transport: 'bus',
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                roundTrip: false,
                                isPeriodic: false,
                                isFavorite: false,
                              );
                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(transportActionsCreateData);
                              newBus =
                                  TransportActionsRecord.getDocumentFromData(
                                      transportActionsCreateData,
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDates = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDays = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: TransportWidget(
                                    actionRef: newBus.reference,
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
                                    SvgPicture.asset(
                                      'assets/images/trans-bus-02.svg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Autobus',
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
                                  'TRANSPORT_LIST_Container_tyekub91_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final transportActionsCreateData =
                                  createTransportActionsRecordData(
                                transport: 'scooter',
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                roundTrip: false,
                                isPeriodic: false,
                                powertype: 'Thermique',
                                isFavorite: false,
                              );
                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(transportActionsCreateData);
                              newScooter =
                                  TransportActionsRecord.getDocumentFromData(
                                      transportActionsCreateData,
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDates = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDays = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: TransportWidget(
                                    actionRef: newScooter.reference,
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
                                    SvgPicture.asset(
                                      'assets/images/trans-motor-03.svg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Scooter\n',
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
                                  'TRANSPORT_LIST_Container_ku2qonrh_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final transportActionsCreateData =
                                  createTransportActionsRecordData(
                                transport: 'moto',
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                roundTrip: false,
                                isPeriodic: false,
                                powertype: 'Thermique',
                                isFavorite: false,
                              );
                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(transportActionsCreateData);
                              newMoto =
                                  TransportActionsRecord.getDocumentFromData(
                                      transportActionsCreateData,
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDates = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDays = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: TransportWidget(
                                    actionRef: newMoto.reference,
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
                                      'assets/images/motorcycle.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Moto',
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
                                  'TRANSPORT_LIST_Container_joxhzjb4_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final transportActionsCreateData =
                                  createTransportActionsRecordData(
                                transport: 'train',
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                roundTrip: false,
                                isPeriodic: false,
                                powertype: 'RER',
                                isFavorite: false,
                              );
                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(transportActionsCreateData);
                              newTrain =
                                  TransportActionsRecord.getDocumentFromData(
                                      transportActionsCreateData,
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDates = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDays = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: TransportWidget(
                                    actionRef: newTrain.reference,
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
                                    SvgPicture.asset(
                                      'assets/images/trans-train-04.svg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Train / Tram',
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
                                  'TRANSPORT_LIST_Container_b62z2687_ON_TAP');
                              logFirebaseEvent('Container_Backend-Call');

                              final transportActionsCreateData =
                                  createTransportActionsRecordData(
                                transport: 'metro',
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat(
                                    'd/M/y', getCurrentTimestamp),
                                roundTrip: false,
                                isPeriodic: false,
                                powertype: 'RATP',
                                isFavorite: false,
                              );
                              var transportActionsRecordReference =
                                  TransportActionsRecord.collection.doc();
                              await transportActionsRecordReference
                                  .set(transportActionsCreateData);
                              newMetro =
                                  TransportActionsRecord.getDocumentFromData(
                                      transportActionsCreateData,
                                      transportActionsRecordReference);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(
                                  () => FFAppState().displayOptions = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDates = false);
                              logFirebaseEvent('Container_Update-Local-State');
                              setState(() => FFAppState().displayDays = false);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: TransportWidget(
                                    actionRef: newMetro.reference,
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
                                    SvgPicture.asset(
                                      'assets/images/trans-metro-06.svg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Métro',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'TRANSPORT_LIST_Container_8hx7eqtt_ON_TAP');
                        logFirebaseEvent('Container_Backend-Call');

                        final transportActionsCreateData =
                            createTransportActionsRecordData(
                          transport: 'flight',
                          userId: currentUserUid,
                          co2e: 0,
                          createdTime: getCurrentTimestamp,
                          day: dateTimeFormat('d/M/y', getCurrentTimestamp),
                          roundTrip: false,
                          isPeriodic: false,
                          powertype: 'Avion commercial',
                          isFavorite: false,
                        );
                        var transportActionsRecordReference =
                            TransportActionsRecord.collection.doc();
                        await transportActionsRecordReference
                            .set(transportActionsCreateData);
                        newFlight = TransportActionsRecord.getDocumentFromData(
                            transportActionsCreateData,
                            transportActionsRecordReference);
                        logFirebaseEvent('Container_Update-Local-State');
                        setState(() => FFAppState().displayOptions = false);
                        logFirebaseEvent('Container_Update-Local-State');
                        setState(() => FFAppState().displayDates = false);
                        logFirebaseEvent('Container_Update-Local-State');
                        setState(() => FFAppState().displayDays = false);
                        logFirebaseEvent('Container_Navigate-To');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: TransportWidget(
                              actionRef: newFlight.reference,
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/aircraft.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    'Avion',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                            'TRANSPORT_LIST_Container_nanmgc4h_ON_TAP');
                        logFirebaseEvent('Container_Backend-Call');

                        final transportActionsCreateData =
                            createTransportActionsRecordData(
                          transport: 'bike',
                          userId: currentUserUid,
                          co2e: 0,
                          createdTime: getCurrentTimestamp,
                          day: dateTimeFormat('d/M/y', getCurrentTimestamp),
                          roundTrip: false,
                          isPeriodic: false,
                          powertype: 'Classique',
                          isFavorite: false,
                        );
                        var transportActionsRecordReference =
                            TransportActionsRecord.collection.doc();
                        await transportActionsRecordReference
                            .set(transportActionsCreateData);
                        newBike = TransportActionsRecord.getDocumentFromData(
                            transportActionsCreateData,
                            transportActionsRecordReference);
                        logFirebaseEvent('Container_Update-Local-State');
                        setState(() => FFAppState().displayOptions = false);
                        logFirebaseEvent('Container_Update-Local-State');
                        setState(() => FFAppState().displayDates = false);
                        logFirebaseEvent('Container_Update-Local-State');
                        setState(() => FFAppState().displayDays = false);
                        logFirebaseEvent('Container_Navigate-To');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: TransportWidget(
                              actionRef: newBike.reference,
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                'assets/images/trans-cycle-08.svg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    'Vélo',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
