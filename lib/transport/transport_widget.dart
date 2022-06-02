import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TransportWidget extends StatefulWidget {
  const TransportWidget({
    Key key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference actionRef;

  @override
  _TransportWidgetState createState() => _TransportWidgetState();
}

class _TransportWidgetState extends State<TransportWidget> {
  DateTimeRange calendarSelectedDay;
  List<String> periodicityValues;
  String passengersValue;
  String powertypeValue;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Transport'});
  }

  @override
  Widget build(BuildContext context) {
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
              child: StreamBuilder<TransportActionsRecord>(
                stream: TransportActionsRecord.getDocument(widget.actionRef),
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
                  final containerTransportActionsRecord = snapshot.data;
                  return Container(
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
                                        'TRANSPORT_PAGE_Container_fzfptdud_ON_TAP');
                                    if ((containerTransportActionsRecord
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
                                  'Ajouter un trajet',
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
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'car')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-car-01.svg',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'bus')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-bus-02.svg',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'scooter')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-motor-03.svg',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'moto')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/motorcycle.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'train')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-train-04.svg',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'metro')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-metro-06.svg',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'flight')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/aircraft.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((containerTransportActionsRecord
                                                    .transport) ==
                                                'bike')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: SvgPicture.asset(
                                                  'assets/images/trans-cycle-08.svg',
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
                                                  containerTransportActionsRecord
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
                                                  'TRANSPORT_PAGE_Icon_qjvrsapj_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_Update-Local-State');
                                              setState(() => FFAppState()
                                                      .actionCO2 =
                                                  functions
                                                      .transportActionsCO2e(
                                                          int.parse(
                                                              textController
                                                                      ?.text ??
                                                                  ''),
                                                          valueOrDefault<
                                                              String>(
                                                            passengersValue,
                                                            '1',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            powertypeValue,
                                                            'thermic',
                                                          ),
                                                          containerTransportActionsRecord
                                                              .transport,
                                                          containerTransportActionsRecord
                                                              .roundTrip));
                                              logFirebaseEvent(
                                                  'Icon_Backend-Call');

                                              final transportActionsUpdateData =
                                                  createTransportActionsRecordData(
                                                co2e: FFAppState().actionCO2,
                                              );
                                              await containerTransportActionsRecord
                                                  .reference
                                                  .update(
                                                      transportActionsUpdateData);
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
                                            controller: textController ??=
                                                TextEditingController(
                                              text:
                                                  containerTransportActionsRecord
                                                      .distance
                                                      .toString(),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: functions
                                                  .getTransportDistanceLabel(
                                                      containerTransportActionsRecord
                                                          .transport),
                                              hintText:
                                                  'Distance Parcourue (en km )',
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
                                              suffixIcon: Icon(
                                                Icons.follow_the_signs_outlined,
                                                color: Color(0xFF757575),
                                                size: 22,
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
                                        Expanded(
                                          child: FlutterFlowDropDown(
                                            initialOption: powertypeValue ??=
                                                containerTransportActionsRecord
                                                    .powertype,
                                            options: functions
                                                .getTransportPowerType(
                                                    containerTransportActionsRecord
                                                        .transport)
                                                .toList(),
                                            onChanged: (val) => setState(
                                                () => powertypeValue = val),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 40,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            hintText: 'Type de transport',
                                            icon: Icon(
                                              Icons.electrical_services_rounded,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if ((containerTransportActionsRecord
                                                .transport) ==
                                            'car')
                                          Expanded(
                                            child: FlutterFlowDropDown(
                                              initialOption: passengersValue ??=
                                                  containerTransportActionsRecord
                                                      .passengers,
                                              options: functions
                                                  .getTransportPassengers(
                                                      containerTransportActionsRecord
                                                          .transport)
                                                  .toList(),
                                              onChanged: (val) => setState(
                                                  () => passengersValue = val),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              hintText: 'Passagers',
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
                                        0, 10, 0, 15),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final transportActionsUpdateData =
                                                        createTransportActionsRecordData(
                                                      roundTrip:
                                                          !containerTransportActionsRecord
                                                              .roundTrip,
                                                    );
                                                    await containerTransportActionsRecord
                                                        .reference
                                                        .update(
                                                            transportActionsUpdateData);
                                                  },
                                                  value:
                                                      containerTransportActionsRecord
                                                          .roundTrip,
                                                  onIcon: Icon(
                                                    Icons.sync_alt_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 35,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .arrow_right_alt_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (containerTransportActionsRecord
                                                            .roundTrip ??
                                                        true)
                                                      Text(
                                                        'Aller-retour',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                    if (!(containerTransportActionsRecord
                                                            .roundTrip) ??
                                                        true)
                                                      Text(
                                                        'Aller simple',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final transportActionsUpdateData =
                                                        createTransportActionsRecordData(
                                                      isPeriodic:
                                                          !containerTransportActionsRecord
                                                              .isPeriodic,
                                                    );
                                                    await containerTransportActionsRecord
                                                        .reference
                                                        .update(
                                                            transportActionsUpdateData);
                                                  },
                                                  value:
                                                      containerTransportActionsRecord
                                                          .isPeriodic,
                                                  onIcon: Icon(
                                                    Icons.update,
                                                    color: Colors.black,
                                                    size: 35,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.date_range,
                                                    color: Colors.black,
                                                    size: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (containerTransportActionsRecord
                                                            .isPeriodic ??
                                                        true)
                                                      Text(
                                                        'Récurrent',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                    if (!(containerTransportActionsRecord
                                                            .isPeriodic) ??
                                                        true)
                                                      Text(
                                                        'Ponctuel',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (!(containerTransportActionsRecord
                                                            .isPeriodic) ??
                                                        true)
                                                      ToggleIcon(
                                                        onPressed: () async {
                                                          final transportActionsUpdateData =
                                                              createTransportActionsRecordData(
                                                            isFavorite:
                                                                !containerTransportActionsRecord
                                                                    .isFavorite,
                                                          );
                                                          await containerTransportActionsRecord
                                                              .reference
                                                              .update(
                                                                  transportActionsUpdateData);
                                                        },
                                                        value:
                                                            containerTransportActionsRecord
                                                                .isFavorite,
                                                        onIcon: Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          size: 35,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.black,
                                                          size: 35,
                                                        ),
                                                      ),
                                                    if (containerTransportActionsRecord
                                                            .isPeriodic ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 8, 0, 0),
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray,
                                                          size: 35,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Favoris',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 10,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Container(
                                      height: 130,
                                      child: Stack(
                                        children: [
                                          if (!(containerTransportActionsRecord
                                                  .isPeriodic) ??
                                              true)
                                            FlutterFlowCalendar(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              weekFormat: true,
                                              weekStartsMonday: true,
                                              initialDate:
                                                  containerTransportActionsRecord
                                                      .createdTime,
                                              onChange: (DateTimeRange
                                                  newSelectedDate) {
                                                setState(() =>
                                                    calendarSelectedDay =
                                                        newSelectedDate);
                                              },
                                              titleStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                              dayOfWeekStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                              dateStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                              selectedDateStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                              inactiveDateStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                          if (containerTransportActionsRecord
                                                  .isPeriodic ??
                                              true)
                                            FlutterFlowChoiceChips(
                                              initiallySelected:
                                                  periodicityValues != null
                                                      ? periodicityValues
                                                      : containerTransportActionsRecord
                                                          .periodicity
                                                          .toList(),
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
                                                  periodicityValues = val),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF323B45),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 18,
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF323B45),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                iconColor: Color(0xFF323B45),
                                                iconSize: 18,
                                                elevation: 4,
                                              ),
                                              chipSpacing: 10,
                                              rowSpacing: 5,
                                              multiselect: true,
                                              initialized:
                                                  periodicityValues != null,
                                              alignment:
                                                  WrapAlignment.spaceEvenly,
                                            ),
                                        ],
                                      ),
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
                                      if (!(containerTransportActionsRecord
                                              .isTemporary) ??
                                          true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'TRANSPORT_PAGE_delete_ON_TAP');
                                            logFirebaseEvent(
                                                'delete_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'delete_Backend-Call');
                                            await containerTransportActionsRecord
                                                .reference
                                                .delete();
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
                                      if (containerTransportActionsRecord
                                              .isTemporary ??
                                          true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'TRANSPORT_PAGE_cancel_ON_TAP');
                                            logFirebaseEvent(
                                                'cancel_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'cancel_Backend-Call');
                                            await containerTransportActionsRecord
                                                .reference
                                                .delete();
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
                                                'TRANSPORT_PAGE_modify_ON_TAP');
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() => FFAppState()
                                                    .actionCO2 =
                                                functions.transportActionsCO2e(
                                                    int.parse(
                                                        textController?.text ??
                                                            ''),
                                                    valueOrDefault<String>(
                                                      passengersValue,
                                                      '1',
                                                    ),
                                                    valueOrDefault<String>(
                                                      powertypeValue,
                                                      'thermic',
                                                    ),
                                                    containerTransportActionsRecord
                                                        .transport,
                                                    containerTransportActionsRecord
                                                        .roundTrip));
                                            logFirebaseEvent(
                                                'modify_Backend-Call');

                                            final transportActionsUpdateData = {
                                              ...createTransportActionsRecordData(
                                                distance: int.parse(
                                                    textController?.text ?? ''),
                                                powertype: powertypeValue,
                                                userId: currentUserUid,
                                                co2e: FFAppState().actionCO2,
                                                passengers: passengersValue,
                                                day: functions.timestampToDay(
                                                    calendarSelectedDay?.start),
                                                createdTime:
                                                    calendarSelectedDay?.start,
                                                isTemporary: false,
                                              ),
                                              'periodicity': periodicityValues,
                                            };
                                            await containerTransportActionsRecord
                                                .reference
                                                .update(
                                                    transportActionsUpdateData);
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
