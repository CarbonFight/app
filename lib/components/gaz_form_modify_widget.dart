import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GazFormModifyWidget extends StatefulWidget {
  const GazFormModifyWidget({
    Key key,
    this.cache,
    this.typeCache,
  }) : super(key: key);

  final ActionCacheRecord cache;
  final ActionTypeCacheRecord typeCache;

  @override
  _GazFormModifyWidgetState createState() => _GazFormModifyWidgetState();
}

class _GazFormModifyWidgetState extends State<GazFormModifyWidget> {
  String peopleSharingValue;
  String powertypeValue;
  TextEditingController volumeController;

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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Image.asset(
                          'assets/images/gas.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Gaz',
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
              StreamBuilder<List<EnergyActionsRecord>>(
                stream: queryEnergyActionsRecord(
                  queryBuilder: (energyActionsRecord) => energyActionsRecord
                      .where('userId', isEqualTo: currentUserUid)
                      .where('created_time', isEqualTo: widget.typeCache.date),
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
                  List<EnergyActionsRecord> columnEnergyActionsRecordList =
                      snapshot.data;
                  final columnEnergyActionsRecord =
                      columnEnergyActionsRecordList.isNotEmpty
                          ? columnEnergyActionsRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              valueOrDefault<String>(
                                '+ ${valueOrDefault<String>(
                                  columnEnergyActionsRecord.co2e.toString(),
                                  '0',
                                )} / jour',
                                '+ 0 g / jour',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: volumeController ??=
                                    TextEditingController(
                                  text: columnEnergyActionsRecord.volume
                                      .toString(),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Consommation annuelle (KWH)',
                                  hintText: 'Consommation annuelle (KWH)',
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
                                    Icons.today_outlined,
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
                                initialOption: powertypeValue ??=
                                    columnEnergyActionsRecord.powertype,
                                options: [
                                  'Gaz naturel',
                                  'Gaz de cokerie',
                                  'Gaz de haut fourneau'
                                ].toList(),
                                onChanged: (val) =>
                                    setState(() => powertypeValue = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
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
                            child: FlutterFlowDropDown(
                              initialOption: peopleSharingValue ??=
                                  columnEnergyActionsRecord.peopleSharing,
                              options: ['1', '2', '3', '4', '5', '6', '7', '8']
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => peopleSharingValue = val),
                              width: 180,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintText: 'Taille du foyer',
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
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ],
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
                                        functions.energyPeriodicsCO2e(
                                            'gas',
                                            int.parse(
                                                volumeController?.text ?? ''),
                                            valueOrDefault<String>(
                                              powertypeValue,
                                              'Gaz Naturel',
                                            ),
                                            valueOrDefault<String>(
                                              peopleSharingValue,
                                              '1',
                                            )));
                                    logFirebaseEvent('iconButton-Backend-Call');

                                    final energyActionsUpdateData =
                                        createEnergyActionsRecordData(
                                      co2e: FFAppState().actionCO2,
                                    );
                                    await columnEnergyActionsRecord.reference
                                        .update(energyActionsUpdateData);
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
                            if ((FFAppState().loading) == false)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent('iconButton-ON_TAP');
                                      // loading
                                      logFirebaseEvent('iconButton-loading');
                                      setState(
                                          () => FFAppState().loading = true);
                                      logFirebaseEvent(
                                          'iconButton-Update-Local-State');
                                      setState(() => FFAppState().actionCO2 =
                                          functions.energyPeriodicsCO2e(
                                              'gas',
                                              int.parse(
                                                  volumeController?.text ?? ''),
                                              valueOrDefault<String>(
                                                powertypeValue,
                                                'Gaz naturel',
                                              ),
                                              valueOrDefault<String>(
                                                peopleSharingValue,
                                                '1',
                                              )));
                                      logFirebaseEvent(
                                          'iconButton-Backend-Call');

                                      final energyActionsUpdateData =
                                          createEnergyActionsRecordData(
                                        energy: 'gas',
                                        volume: int.parse(
                                            volumeController?.text ?? ''),
                                        powertype: valueOrDefault<String>(
                                          powertypeValue,
                                          'Gaz natural',
                                        ),
                                        peopleSharing: valueOrDefault<String>(
                                          peopleSharingValue,
                                          '1',
                                        ),
                                        co2e: FFAppState().actionCO2,
                                      );
                                      await columnEnergyActionsRecord.reference
                                          .update(energyActionsUpdateData);
                                      logFirebaseEvent(
                                          'iconButton-Backend-Call');

                                      final actionCacheUpdateData = {
                                        'co2e': FieldValue.increment(
                                            FFAppState().actionCO2),
                                      };
                                      await widget.cache.reference
                                          .update(actionCacheUpdateData);
                                      logFirebaseEvent(
                                          'iconButton-Navigate-Back');
                                      Navigator.pop(context);
                                      // loading
                                      logFirebaseEvent('iconButton-loading');
                                      setState(
                                          () => FFAppState().loading = false);
                                    },
                                    child: IconButtonWidget(
                                      fillColor:
                                          FlutterFlowTheme.of(context).orange,
                                      fontColor: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 25,
                                      ),
                                      text: 'Modifier',
                                    ),
                                  ),
                                ),
                              ),
                            if ((FFAppState().loading) == true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Image.asset(
                                  'assets/images/1484.gif',
                                  width: 150,
                                  height: 55,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
