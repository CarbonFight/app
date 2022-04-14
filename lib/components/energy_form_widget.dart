import '../backend/backend.dart';
import '../components/electricity_form_widget.dart';
import '../components/gaz_form_widget.dart';
import '../components/water_form_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EnergyFormWidget extends StatefulWidget {
  const EnergyFormWidget({
    Key key,
    this.actioncache,
  }) : super(key: key);

  final ActionCacheRecord actioncache;

  @override
  _EnergyFormWidgetState createState() => _EnergyFormWidgetState();
}

class _EnergyFormWidgetState extends State<EnergyFormWidget> {
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
                      logFirebaseEvent('IconButton-ON_TAP');
                      logFirebaseEvent('IconButton-Navigate-Back');
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
                              logFirebaseEvent('Container-ON_TAP');
                              logFirebaseEvent('Container-Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container-Update-Local-State');
                              setState(() => FFAppState().actionCO2 = 0);
                              logFirebaseEvent('Container-Bottom-Sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0xBF000000),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: 490,
                                      child: ElectricityFormWidget(
                                        cache: widget.actioncache,
                                      ),
                                    ),
                                  );
                                },
                              );
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
                              logFirebaseEvent('Container-ON_TAP');
                              logFirebaseEvent('Container-Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container-Update-Local-State');
                              setState(() => FFAppState().actionCO2 = 0);
                              logFirebaseEvent('Container-Bottom-Sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0xBF000000),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: 480,
                                      child: GazFormWidget(
                                        cache: widget.actioncache,
                                      ),
                                    ),
                                  );
                                },
                              );
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
                              logFirebaseEvent('Container-ON_TAP');
                              logFirebaseEvent('Container-Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container-Update-Local-State');
                              setState(() => FFAppState().actionCO2 = 0);
                              logFirebaseEvent('Container-Bottom-Sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0xBF000000),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: 450,
                                      child: WaterFormWidget(
                                        cache: widget.actioncache,
                                      ),
                                    ),
                                  );
                                },
                              );
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
