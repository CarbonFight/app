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
import 'package:google_fonts/google_fonts.dart';

class ElectricityWidget extends StatefulWidget {
  const ElectricityWidget({Key key}) : super(key: key);

  @override
  _ElectricityWidgetState createState() => _ElectricityWidgetState();
}

class _ElectricityWidgetState extends State<ElectricityWidget> {
  String peopleSharingValue;
  String powertypeValue;
  TextEditingController volumeController;

  @override
  void initState() {
    super.initState();
    volumeController = TextEditingController();
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
                          'assets/images/energy.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Electricité',
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
                      logFirebaseEvent('ELECTRICITY_COMP_close_ICON_ON_TAP');
                      logFirebaseEvent('IconButton_Navigate-Back');
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0x1CF77303),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x13F77303),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                          child: Text(
                            'Cette action est hebdomadaire',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context).redi,
                                      fontSize: 10,
                                    ),
                          ),
                        ),
                      ),
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
                              controller: volumeController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Consommation annuelle (KWH)',
                                hintText: 'Consommation annuelle (KWH)',
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
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
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
                                'Nucléaire',
                                'Éolienne (mer)',
                                'Éolienne (terre)',
                                'Hydroélectrique',
                                'Biomasse',
                                'Géothermique',
                                'Fioul',
                                'Charbon'
                              ],
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
                              icon: Icon(
                                Icons.flash_on,
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
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowDropDown(
                            options: ['1', '2', '3', '4', '5', '6', '7', '8'],
                            onChanged: (val) =>
                                setState(() => peopleSharingValue = val),
                            width: 180,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
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
                            borderColor: FlutterFlowTheme.of(context).grayLight,
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
                                  logFirebaseEvent(
                                      'ELECTRICITY_COMP_Container_x7yzplco_ON_TAP');
                                  logFirebaseEvent(
                                      'iconButton_Update-Local-State');
                                  setState(() => FFAppState().actionCO2 =
                                      functions.energyPeriodicsCO2e(
                                          'electricity',
                                          int.parse(volumeController.text),
                                          valueOrDefault<String>(
                                            powertypeValue,
                                            'Nucléaire',
                                          ),
                                          valueOrDefault<String>(
                                            peopleSharingValue,
                                            '1',
                                          )));
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
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ELECTRICITY_COMP_Container_3u31ya7y_ON_TAP');
                                  logFirebaseEvent(
                                      'iconButton_Update-Local-State');
                                  setState(() => FFAppState().actionCO2 =
                                      functions.energyPeriodicsCO2e(
                                          'electricity',
                                          int.parse(volumeController.text),
                                          valueOrDefault<String>(
                                            powertypeValue,
                                            'Nucléaire',
                                          ),
                                          valueOrDefault<String>(
                                            peopleSharingValue,
                                            '1',
                                          )));
                                  logFirebaseEvent('iconButton_Backend-Call');

                                  final energyActionsCreateData =
                                      createEnergyActionsRecordData(
                                    createdTime: getCurrentTimestamp,
                                    co2e: FFAppState().actionCO2,
                                    energy: 'electricity',
                                    volume: int.parse(volumeController.text),
                                    powertype: valueOrDefault<String>(
                                      powertypeValue,
                                      'Nucléaire',
                                    ),
                                    peopleSharing: peopleSharingValue,
                                    userId: currentUserUid,
                                    day: dateTimeFormat(
                                        'yMd', getCurrentTimestamp),
                                  );
                                  await EnergyActionsRecord.collection
                                      .doc()
                                      .set(energyActionsCreateData);
                                  logFirebaseEvent('iconButton_Navigate-Back');
                                  Navigator.pop(context);
                                },
                                child: IconButtonWidget(
                                  fillColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontColor: FlutterFlowTheme.of(context)
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
