import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TransportsWidget extends StatefulWidget {
  const TransportsWidget({
    Key key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference actionRef;

  @override
  _TransportsWidgetState createState() => _TransportsWidgetState();
}

class _TransportsWidgetState extends State<TransportsWidget> {
  DateTimeRange calendarSelectedDay;
  List<String> periodicityValues;
  String passengersValue;
  String powertypeValue;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            if ((containerTransportActionsRecord.transport) ==
                                'car')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: SvgPicture.asset(
                                  'assets/images/trans-car-01.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'bus')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: SvgPicture.asset(
                                  'assets/images/trans-bus-02.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'scooter')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: SvgPicture.asset(
                                  'assets/images/trans-motor-03.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'moto')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Image.asset(
                                  'assets/images/motorcycle.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'train')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: SvgPicture.asset(
                                  'assets/images/trans-train-04.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'metro')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: SvgPicture.asset(
                                  'assets/images/trans-metro-06.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'flight')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Image.asset(
                                  'assets/images/aircraft.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if ((containerTransportActionsRecord.transport) ==
                                'bike')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: SvgPicture.asset(
                                  'assets/images/trans-cycle-08.svg',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                        Text(
                          'Ajouter un trajet',
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
                            logFirebaseEvent(
                                'TRANSPORTS_COMP_close_ICON_ON_TAP');
                            logFirebaseEvent('IconButton_Navigate-Back');
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              '+ ${valueOrDefault<String>(
                                functions.printScore(
                                    containerTransportActionsRecord.co2e),
                                '0',
                              )}',
                              '+ 0 g',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'TRANSPORTS_COMP_Icon_60mrqia3_ON_TAP');
                                logFirebaseEvent('Icon_Update-Local-State');
                                setState(() => FFAppState().actionCO2 =
                                    functions.transportActionsCO2e(
                                        int.parse(textController?.text ?? ''),
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
                                logFirebaseEvent('Icon_Backend-Call');

                                final transportActionsUpdateData =
                                    createTransportActionsRecordData(
                                  co2e: FFAppState().actionCO2,
                                );
                                await widget.actionRef
                                    .update(transportActionsUpdateData);
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController ??=
                                  TextEditingController(
                                text: containerTransportActionsRecord.distance
                                    .toString(),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: functions.getTransportDistanceLabel(
                                    containerTransportActionsRecord.transport),
                                hintText: 'Distance Parcourue (en km )',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                filled: true,
                                fillColor: Color(0x40EEF1F0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              if (!(FFAppState().optionsON) ?? true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'TRANSPORTS_COMP_DisplayOptions_ON_TAP');
                                    logFirebaseEvent(
                                        'DisplayOptions_Update-Local-State');
                                    setState(
                                        () => FFAppState().optionsON = true);
                                  },
                                  text: 'Options',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 25,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                              if (FFAppState().optionsON ?? true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'TRANSPORTS_COMP_HideOptions_ON_TAP');
                                    logFirebaseEvent(
                                        'HideOptions_Update-Local-State');
                                    setState(
                                        () => FFAppState().optionsON = false);
                                  },
                                  text: 'Options',
                                  icon: Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 25,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (FFAppState().optionsON ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if ((containerTransportActionsRecord.transport) ==
                                'car')
                              Expanded(
                                child: FlutterFlowDropDown(
                                  initialOption: powertypeValue ??=
                                      containerTransportActionsRecord.powertype,
                                  options: functions
                                      .getTransportPowerType(
                                          containerTransportActionsRecord
                                              .transport)
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => powertypeValue = val),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                      ),
                                  hintText: 'Type de transport',
                                  icon: Icon(
                                    Icons.electrical_services_rounded,
                                    size: 15,
                                  ),
                                  fillColor: Color(0xFFFAFAFA),
                                  elevation: 2,
                                  borderColor:
                                      FlutterFlowTheme.of(context).grayLight,
                                  borderWidth: 1,
                                  borderRadius: 100,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (FFAppState().optionsON ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: FlutterFlowDropDown(
                                initialOption: passengersValue ??=
                                    containerTransportActionsRecord.passengers,
                                options: functions
                                    .getTransportPassengers(
                                        containerTransportActionsRecord
                                            .transport)
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => passengersValue = val),
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                textStyle: FlutterFlowTheme.of(context)
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
                                    FlutterFlowTheme.of(context).grayLight,
                                borderWidth: 1,
                                borderRadius: 100,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().optionsON ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                            .update(transportActionsUpdateData);
                                      },
                                      value: containerTransportActionsRecord
                                          .roundTrip,
                                      onIcon: Icon(
                                        Icons.sync_alt_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 35,
                                      ),
                                      offIcon: Icon(
                                        Icons.arrow_right_alt_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        if (containerTransportActionsRecord
                                                .roundTrip ??
                                            true)
                                          Text(
                                            'Aller-retour',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 10,
                                                ),
                                          ),
                                        if (!(containerTransportActionsRecord
                                                .roundTrip) ??
                                            true)
                                          Text(
                                            'Aller simple',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                            .update(transportActionsUpdateData);
                                      },
                                      value: containerTransportActionsRecord
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        if (containerTransportActionsRecord
                                                .isPeriodic ??
                                            true)
                                          Text(
                                            'Récurrent',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 10,
                                                ),
                                          ),
                                        if (!(containerTransportActionsRecord
                                                .isPeriodic) ??
                                            true)
                                          Text(
                                            'Ponctuel',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                favorite:
                                                    !containerTransportActionsRecord
                                                        .favorite,
                                              );
                                              await containerTransportActionsRecord
                                                  .reference
                                                  .update(
                                                      transportActionsUpdateData);
                                            },
                                            value:
                                                containerTransportActionsRecord
                                                    .favorite,
                                            onIcon: Icon(
                                              Icons.favorite,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 0, 0),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Favoris',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().datesON ?? true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'TRANSPORTS_COMP_DisplayDates_ON_TAP');
                                    logFirebaseEvent(
                                        'DisplayDates_Update-Local-State');
                                    setState(() => FFAppState().datesON = true);
                                  },
                                  text: 'Dates',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 25,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                              if (FFAppState().datesON ?? true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'TRANSPORTS_COMP_HideDates_ON_TAP');
                                    logFirebaseEvent(
                                        'HideDates_Update-Local-State');
                                    setState(
                                        () => FFAppState().datesON = false);
                                  },
                                  text: 'Dates',
                                  icon: Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 25,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (FFAppState().datesON ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Container(
                          height: 130,
                          child: Stack(
                            children: [
                              if (!(containerTransportActionsRecord
                                      .isPeriodic) ??
                                  true)
                                FlutterFlowCalendar(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  weekFormat: true,
                                  weekStartsMonday: true,
                                  initialDate: containerTransportActionsRecord
                                      .createdTime,
                                  onChange: (DateTimeRange newSelectedDate) {
                                    setState(() =>
                                        calendarSelectedDay = newSelectedDate);
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
                                      FFLocalizations.of(context).languageCode,
                                ),
                              if (containerTransportActionsRecord.isPeriodic ??
                                  true)
                                FlutterFlowChoiceChips(
                                  initiallySelected: periodicityValues != null
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
                                  onChanged: (val) =>
                                      setState(() => periodicityValues = val),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xFF323B45),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    iconColor: Colors.white,
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF323B45),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    iconColor: Color(0xFF323B45),
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  chipSpacing: 10,
                                  rowSpacing: 5,
                                  multiselect: true,
                                  initialized: periodicityValues != null,
                                  alignment: WrapAlignment.spaceEvenly,
                                ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'TRANSPORTS_COMP_delete_ON_TAP');
                                  logFirebaseEvent('delete_Update-Local-State');
                                  setState(() => FFAppState().loading = true);
                                  logFirebaseEvent('delete_Backend-Call');
                                  await widget.actionRef.delete();
                                  logFirebaseEvent('delete_Navigate-Back');
                                  Navigator.pop(context);
                                  logFirebaseEvent('delete_Update-Local-State');
                                  setState(() => FFAppState().loading = false);
                                },
                                child: IconButtonWidget(
                                  fillColor: Color(0x98BC0909),
                                  fontColor: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 25,
                                  ),
                                  text: 'Supprimer',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                if (!(FFAppState().loading) ?? true)
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'TRANSPORTS_COMP_modify_ON_TAP');
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
                                                    calendarSelectedDay.start),
                                                createdTime:
                                                    calendarSelectedDay?.start,
                                              ),
                                              'periodicity': periodicityValues,
                                            };
                                            await widget.actionRef.update(
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
                                              size: 25,
                                            ),
                                            text: 'Valider',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (FFAppState().loading ?? true)
                                  Stack(
                                    children: [
                                      if (FFAppState().loading ?? true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TRANSPORTS_COMP_sync_ON_TAP');
                                              logFirebaseEvent(
                                                  'sync_Update-Local-State');
                                              setState(() =>
                                                  FFAppState().loading = true);
                                              logFirebaseEvent(
                                                  'sync_Update-Local-State');
                                              setState(() => FFAppState()
                                                      .actionCO2 =
                                                  functions.transportActionsCO2e(
                                                      containerTransportActionsRecord
                                                          .distance,
                                                      containerTransportActionsRecord
                                                          .passengers,
                                                      powertypeValue,
                                                      'car',
                                                      containerTransportActionsRecord
                                                          .roundTrip));
                                              logFirebaseEvent(
                                                  'sync_Backend-Call');

                                              final transportActionsCreateData =
                                                  createTransportActionsRecordData(
                                                transport: 'car',
                                                distance: int.parse(
                                                    textController?.text ?? ''),
                                                userId: currentUserUid,
                                                powertype: 'thermic',
                                                passengers:
                                                    valueOrDefault<String>(
                                                  passengersValue,
                                                  '1',
                                                ),
                                                createdTime:
                                                    getCurrentTimestamp,
                                                co2e: FFAppState().actionCO2,
                                                day: dateTimeFormat(
                                                    'yMd', getCurrentTimestamp),
                                              );
                                              await TransportActionsRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      transportActionsCreateData);
                                              logFirebaseEvent(
                                                  'sync_Navigate-Back');
                                              Navigator.pop(context);
                                              logFirebaseEvent(
                                                  'sync_Update-Local-State');
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
                                                Icons.sync,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 25,
                                              ),
                                              text: 'Ajouter',
                                            ),
                                          ),
                                        ),
                                    ],
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
        },
      ),
    );
  }
}
