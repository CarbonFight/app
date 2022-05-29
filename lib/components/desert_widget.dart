import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DesertWidget extends StatefulWidget {
  const DesertWidget({
    Key key,
    this.cache,
  }) : super(key: key);

  final ActionCacheRecord cache;

  @override
  _DesertWidgetState createState() => _DesertWidgetState();
}

class _DesertWidgetState extends State<DesertWidget> {
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
                      logFirebaseEvent('DESERT_COMP_close_ICON_ON_TAP');
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(90, 0, 90, 0),
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Text(
                          'Type de dessert',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 300,
                          constraints: BoxConstraints(
                            maxWidth: 300,
                          ),
                          decoration: BoxDecoration(),
                          child: FlutterFlowChoiceChips(
                            initiallySelected: [mainComponentValue],
                            options: [
                              ChipData('Fruits'),
                              ChipData('Fruits transformés'),
                              ChipData('Yaourt'),
                              ChipData('Pâtisserie'),
                              ChipData('Glace'),
                              ChipData('Crême dessert')
                            ],
                            onChanged: (val) =>
                                setState(() => mainComponentValue = val.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF323B45),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF323B45),
                                  ),
                              iconColor: Color(0xFF323B45),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 10,
                            multiselect: false,
                            alignment: WrapAlignment.spaceEvenly,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'DESERT_COMP_Container_9vhz2mtj_ON_TAP');
                            logFirebaseEvent('iconButton_Update-Local-State');
                            setState(() => FFAppState().actionCO2 =
                                functions.foodActionsCO2e(
                                    'desert', mainComponentValue, 'null', 1));
                          },
                          child: IconButtonWidget(
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            fontColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            icon: Icon(
                              Icons.sync,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 18,
                            ),
                            text: 'Calculer',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'DESERT_COMP_Container_vtxdj7ga_ON_TAP');
                            logFirebaseEvent('iconButton_Update-Local-State');
                            setState(() => FFAppState().loading = true);
                            logFirebaseEvent('iconButton_Update-Local-State');
                            setState(() => FFAppState().actionCO2 =
                                functions.foodActionsCO2e(
                                    'desert', mainComponentValue, 'null', 1));
                            logFirebaseEvent('iconButton_Backend-Call');

                            final foodActionsCreateData =
                                createFoodActionsRecordData(
                              createdTime: getCurrentTimestamp,
                              co2e: FFAppState().actionCO2,
                              food: 'desert',
                              mainComponent: mainComponentValue,
                              sideComponent: 'null',
                              userId: currentUserUid,
                              day: dateTimeFormat('yMd', getCurrentTimestamp),
                              portions: 1,
                            );
                            await FoodActionsRecord.collection
                                .doc()
                                .set(foodActionsCreateData);
                            logFirebaseEvent('iconButton_Navigate-Back');
                            Navigator.pop(context);
                            logFirebaseEvent('iconButton_Update-Local-State');
                            setState(() => FFAppState().loading = false);
                          },
                          child: IconButtonWidget(
                            fillColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            fontColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
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
    );
  }
}
