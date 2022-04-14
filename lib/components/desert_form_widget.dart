import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DesertFormWidget extends StatefulWidget {
  const DesertFormWidget({
    Key key,
    this.cache,
  }) : super(key: key);

  final ActionCacheRecord cache;

  @override
  _DesertFormWidgetState createState() => _DesertFormWidgetState();
}

class _DesertFormWidgetState extends State<DesertFormWidget> {
  String mainComponentValue;

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
                          'assets/images/ice-cream.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Desserts',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: FlutterFlowRadioButton(
                          options: [
                            'Fruit',
                            'Fruit transformé',
                            'Yahourt',
                            'Pâtisserie',
                            'Glace',
                            'Crême dessert'
                          ].toList(),
                          initialValue: 'Fruit',
                          onChanged: (value) {
                            setState(() => mainComponentValue = value);
                          },
                          optionHeight: 25,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor: Colors.blue,
                          inactiveRadioButtonColor: Color(0x8A000000),
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
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
                                        functions.foodActionsCO2e('desert',
                                            mainComponentValue, 'null'));
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
                                    logFirebaseEvent('iconButton-ON_TAP');
                                    logFirebaseEvent(
                                        'iconButton-Update-Local-State');
                                    setState(() => FFAppState().loading = true);
                                    logFirebaseEvent(
                                        'iconButton-Update-Local-State');
                                    setState(() => FFAppState().actionCO2 =
                                        functions.foodActionsCO2e('desert',
                                            mainComponentValue, 'null'));
                                    logFirebaseEvent(
                                        'iconButton-Update-Local-State');
                                    setState(() => FFAppState().time =
                                        getCurrentTimestamp);
                                    logFirebaseEvent('iconButton-Backend-Call');

                                    final foodActionsCreateData =
                                        createFoodActionsRecordData(
                                      createdTime: getCurrentTimestamp,
                                      co2e: FFAppState().actionCO2,
                                      food: 'desert',
                                      mainComponent: mainComponentValue,
                                      sideComponent: 'null',
                                      userId: currentUserUid,
                                    );
                                    await FoodActionsRecord.collection
                                        .doc()
                                        .set(foodActionsCreateData);
                                    logFirebaseEvent('iconButton-Backend-Call');

                                    final actionTypeCacheCreateData =
                                        createActionTypeCacheRecordData(
                                      actionCache: widget.cache.reference,
                                      actionType: 'desert',
                                      date: FFAppState().time,
                                    );
                                    await ActionTypeCacheRecord.collection
                                        .doc()
                                        .set(actionTypeCacheCreateData);
                                    logFirebaseEvent(
                                        'iconButton-Navigate-Back');
                                    Navigator.pop(context);
                                    logFirebaseEvent(
                                        'iconButton-Update-Local-State');
                                    setState(
                                        () => FFAppState().loading = false);
                                  },
                                  child: IconButtonWidget(
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
