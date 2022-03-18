import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddActionFormWidget extends StatefulWidget {
  const AddActionFormWidget({
    Key key,
    this.actionName,
  }) : super(key: key);

  final String actionName;

  @override
  _AddActionFormWidgetState createState() => _AddActionFormWidgetState();
}

class _AddActionFormWidgetState extends State<AddActionFormWidget> {
  String energyValue;
  String ownershipValue;
  String passengersValue;
  TextEditingController textController;

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
                        'Add ${widget.actionName}',
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '6lo8d8h3' /* Distance Parcourue (en km ) */,
                              ),
                              hintText: FFLocalizations.of(context).getText(
                                '40yz93vs' /* Distance Parcourue (en km ) */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              filled: true,
                              fillColor: Color(0x40EEF1F0),
                              prefixIcon: Icon(
                                Icons.directions_walk,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 16,
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                            keyboardType: TextInputType.number,
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
                                FFLocalizations.of(context).getText(
                                  'adxea3ud' /* More Options */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
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
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown(
                              options: [
                                FFLocalizations.of(context).getText(
                                  'cdpfiikf' /* 1 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'a2l56pwj' /* 2 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6cb7z5jk' /* 3 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'kujyfgw9' /* 4 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'cn09p173' /* 5 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '50kkt56t' /* 6 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8n0r08az' /* 7 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ai0f1rbu' /* 8 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'y8br6d90' /* 9 */,
                                )
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
                              hintText: FFLocalizations.of(context).getText(
                                'v4wtf97t' /* Nombre de passagers */,
                              ),
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown(
                              options: [
                                FFLocalizations.of(context).getText(
                                  'nig8hali' /* Owner */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'cyve5fzh' /* Short rent */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8ufgtacr' /* Long rent */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'eisc92u4' /* Taxi */,
                                )
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
                              hintText: FFLocalizations.of(context).getText(
                                '0p2pexrg' /* Type d'utilisation */,
                              ),
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
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                                FFLocalizations.of(context).getText(
                                  'z0v14eq6' /* Option 1 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'im24654c' /* Option 2 */,
                                )
                              ].toList(),
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
                              hintText: FFLocalizations.of(context).getText(
                                'i1fd3kvi' /* Energie */,
                              ),
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
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                setState(() => FFAppState().actionCO2 =
                                    functions.transportActionsCO2e(
                                        int.parse(textController.text),
                                        passengersValue,
                                        ownershipValue,
                                        energyValue,
                                        'car'));

                                final transportActionsCreateData =
                                    createTransportActionsRecordData(
                                  transport: 'car',
                                  distance: int.parse(textController.text),
                                  userId: currentUserUid,
                                  powertype: 'electricity',
                                  passengers: 1,
                                  ownership: 'owner',
                                  createdTime: getCurrentTimestamp,
                                  co2e: FFAppState().actionCO2,
                                );
                                await TransportActionsRecord.collection
                                    .doc()
                                    .set(transportActionsCreateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Vous avez ajouté ${functions.printScore(FFAppState().actionCO2)}de CO2 à votre score.',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeWidget(),
                                  ),
                                );
                              },
                              child: IconButtonWidget(
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                icon: Icon(
                                  Icons.save_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 18,
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
      ),
    );
  }
}
