import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CarFormWidget extends StatefulWidget {
  const CarFormWidget({
    Key key,
    this.cache,
  }) : super(key: key);

  final ActionCacheRecord cache;

  @override
  _CarFormWidgetState createState() => _CarFormWidgetState();
}

class _CarFormWidgetState extends State<CarFormWidget> {
  List<String> choiceChipsValues;
  String energyValue;
  String ownershipValue;
  String passengersValue;
  TextEditingController textController;
  bool recurringValue;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                          child: SvgPicture.asset(
                            'assets/images/trans-car-01.svg',
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Trajet en voiture',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
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
                        logFirebaseEvent('IconButton-ON_TAP');
                        logFirebaseEvent('IconButton-Navigate-Back');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        valueOrDefault<String>(
                          '+ ${valueOrDefault<String>(
                            functions.printScore(FFAppState().actionCO2),
                            '0',
                          )}',
                          '+ 0 g',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Distance Parcourue (en km )',
                                  hintText: 'Distance Parcourue (en km )',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x40EEF1F0),
                                  prefixIcon: Icon(
                                    Icons.directions_walk,
                                    color: FlutterFlowTheme.of(context)
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
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(90, 0, 90, 0),
                              child: Container(
                                width: double.infinity,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                ),
                                child: Text(
                                  ' Options',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).subtitle2,
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
                          children: [
                            Expanded(
                              child: FlutterFlowDropDown(
                                options: [
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9'
                                ].toList(),
                                onChanged: (val) =>
                                    setState(() => passengersValue = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Nombre de passagers',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FlutterFlowDropDown(
                                options: [
                                  'Propriétaire',
                                  'Location courte',
                                  'Location longue',
                                  'Taxi'
                                ].toList(),
                                onChanged: (val) =>
                                    setState(() => ownershipValue = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Type d\'utilisation',
                                icon: Icon(
                                  Icons.car_rental,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FlutterFlowDropDown(
                                options: ['Thermique', 'Hybride', 'Électrique']
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => energyValue = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Energie',
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SwitchListTile(
                              value: recurringValue ??= false,
                              onChanged: (newValue) =>
                                  setState(() => recurringValue = newValue),
                              title: Text(
                                'Trajet récurrent',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                        ],
                      ),
                      if (recurringValue ?? true)
                        FlutterFlowChoiceChips(
                          initiallySelected: choiceChipsValues != null
                              ? choiceChipsValues
                              : [],
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
                              setState(() => choiceChipsValues = val),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: Color(0xFF323B45),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                            iconColor: Colors.white,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF323B45),
                                      fontSize: 13,
                                    ),
                            iconColor: Color(0xFF323B45),
                            iconSize: 18,
                            elevation: 4,
                          ),
                          chipSpacing: 10,
                          rowSpacing: 2,
                          multiselect: true,
                          initialized: choiceChipsValues != null,
                          alignment: WrapAlignment.spaceBetween,
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('iconButton-ON_TAP');
                                    logFirebaseEvent(
                                        'iconButton-Update-Local-State');
                                    setState(() => FFAppState().actionCO2 =
                                        functions.transportActionsCO2e(
                                            int.parse(textController.text),
                                            valueOrDefault<String>(
                                              passengersValue,
                                              '1',
                                            ),
                                            valueOrDefault<String>(
                                              ownershipValue,
                                              'owner',
                                            ),
                                            valueOrDefault<String>(
                                              energyValue,
                                              'Thermique',
                                            ),
                                            'car'));
                                  },
                                  child: IconButtonWidget(
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontColor: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    icon: Icon(
                                      Icons.sync,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      size: 18,
                                    ),
                                    text: 'Calculer',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  if (!(FFAppState().loading) ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent('add-ON_TAP');
                                          logFirebaseEvent(
                                              'add-Update-Local-State');
                                          setState(() =>
                                              FFAppState().loading = true);
                                          logFirebaseEvent(
                                              'add-Update-Local-State');
                                          setState(() => FFAppState()
                                                  .actionCO2 =
                                              functions.transportActionsCO2e(
                                                  int.parse(
                                                      textController.text),
                                                  valueOrDefault<String>(
                                                    passengersValue,
                                                    '1',
                                                  ),
                                                  valueOrDefault<String>(
                                                    ownershipValue,
                                                    'owner',
                                                  ),
                                                  valueOrDefault<String>(
                                                    energyValue,
                                                    'Thermique',
                                                  ),
                                                  'car'));
                                          logFirebaseEvent(
                                              'add-Update-Local-State');
                                          setState(() => FFAppState().time =
                                              getCurrentTimestamp);
                                          if (recurringValue) {
                                            logFirebaseEvent(
                                                'add-Backend-Call');

                                            final transportPeriodicsCreateData =
                                                {
                                              ...createTransportPeriodicsRecordData(
                                                uid: currentUserUid,
                                                transport: 'car',
                                                distance: int.parse(
                                                    textController.text),
                                                powertype: energyValue,
                                                ownership: ownershipValue,
                                                createdTime: FFAppState().time,
                                                passengers: passengersValue,
                                                co2e: FFAppState().actionCO2,
                                              ),
                                              'periodicity': choiceChipsValues,
                                            };
                                            await TransportPeriodicsRecord
                                                .collection
                                                .doc()
                                                .set(
                                                    transportPeriodicsCreateData);
                                          }
                                          logFirebaseEvent('add-Backend-Call');

                                          final transportActionsCreateData =
                                              createTransportActionsRecordData(
                                            transport: 'car',
                                            distance:
                                                int.parse(textController.text),
                                            userId: currentUserUid,
                                            powertype: 'thermic',
                                            passengers: valueOrDefault<String>(
                                              passengersValue,
                                              '1',
                                            ),
                                            ownership: 'owner',
                                            createdTime: FFAppState().time,
                                            co2e: FFAppState().actionCO2,
                                            day: dateTimeFormat(
                                                'yMd', getCurrentTimestamp),
                                          );
                                          await TransportActionsRecord
                                              .collection
                                              .doc()
                                              .set(transportActionsCreateData);
                                          logFirebaseEvent('add-Backend-Call');

                                          final actionTypeCacheCreateData =
                                              createActionTypeCacheRecordData(
                                            actionCache: widget.cache.reference,
                                            actionType: 'car',
                                            date: FFAppState().time,
                                          );
                                          await ActionTypeCacheRecord.collection
                                              .doc()
                                              .set(actionTypeCacheCreateData);
                                          logFirebaseEvent('add-Navigate-Back');
                                          Navigator.pop(context);
                                          logFirebaseEvent(
                                              'add-Update-Local-State');
                                          setState(() =>
                                              FFAppState().loading = false);
                                        },
                                        child: IconButtonWidget(
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          fontColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiaryColor,
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 25,
                                          ),
                                          text: 'Ajouter',
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().loading ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent('sync-ON_TAP');
                                          logFirebaseEvent(
                                              'sync-Update-Local-State');
                                          setState(() =>
                                              FFAppState().loading = true);
                                          logFirebaseEvent(
                                              'sync-Update-Local-State');
                                          setState(() => FFAppState()
                                                  .actionCO2 =
                                              functions.transportActionsCO2e(
                                                  int.parse(
                                                      textController.text),
                                                  valueOrDefault<String>(
                                                    passengersValue,
                                                    '1',
                                                  ),
                                                  valueOrDefault<String>(
                                                    ownershipValue,
                                                    'owner',
                                                  ),
                                                  valueOrDefault<String>(
                                                    energyValue,
                                                    'Thermique',
                                                  ),
                                                  'car'));
                                          logFirebaseEvent(
                                              'sync-Update-Local-State');
                                          setState(() => FFAppState().time =
                                              getCurrentTimestamp);
                                          logFirebaseEvent('sync-Backend-Call');

                                          final transportActionsCreateData =
                                              createTransportActionsRecordData(
                                            transport: 'car',
                                            distance:
                                                int.parse(textController.text),
                                            userId: currentUserUid,
                                            powertype: 'thermic',
                                            passengers: valueOrDefault<String>(
                                              passengersValue,
                                              '1',
                                            ),
                                            ownership: 'owner',
                                            createdTime: FFAppState().time,
                                            co2e: FFAppState().actionCO2,
                                            day: dateTimeFormat(
                                                'yMd', getCurrentTimestamp),
                                          );
                                          await TransportActionsRecord
                                              .collection
                                              .doc()
                                              .set(transportActionsCreateData);
                                          logFirebaseEvent('sync-Backend-Call');

                                          final actionTypeCacheCreateData =
                                              createActionTypeCacheRecordData(
                                            actionCache: widget.cache.reference,
                                            actionType: 'car',
                                            date: FFAppState().time,
                                          );
                                          await ActionTypeCacheRecord.collection
                                              .doc()
                                              .set(actionTypeCacheCreateData);
                                          logFirebaseEvent(
                                              'sync-Navigate-Back');
                                          Navigator.pop(context);
                                          logFirebaseEvent(
                                              'sync-Update-Local-State');
                                          setState(() =>
                                              FFAppState().loading = false);
                                        },
                                        child: IconButtonWidget(
                                          fillColor:
                                              FlutterFlowTheme.of(context).gray,
                                          fontColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiaryColor,
                                          icon: Icon(
                                            Icons.sync,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 25,
                                          ),
                                          text: 'Ajouter',
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
        ),
      ),
    );
  }
}
