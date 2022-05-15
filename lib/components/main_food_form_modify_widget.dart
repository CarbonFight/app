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

class MainFoodFormModifyWidget extends StatefulWidget {
  const MainFoodFormModifyWidget({
    Key key,
    this.typeCache,
  }) : super(key: key);

  final ActionTypeCacheRecord typeCache;

  @override
  _MainFoodFormModifyWidgetState createState() =>
      _MainFoodFormModifyWidgetState();
}

class _MainFoodFormModifyWidgetState extends State<MainFoodFormModifyWidget> {
  String mainComponentValue;
  String sideComponentValue;
  bool deleteValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: StreamBuilder<List<FoodActionsRecord>>(
        stream: queryFoodActionsRecord(
          queryBuilder: (foodActionsRecord) => foodActionsRecord
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
          List<FoodActionsRecord> containerFoodActionsRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final containerFoodActionsRecord =
              containerFoodActionsRecordList.isNotEmpty
                  ? containerFoodActionsRecordList.first
                  : null;
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
                              'assets/images/steak.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Plat principal',
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
                              functions
                                  .printScore(containerFoodActionsRecord.co2e),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
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
                              'Principal',
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
                                initiallySelected: mainComponentValue != null
                                    ? [mainComponentValue]
                                    : [
                                        containerFoodActionsRecord.mainComponent
                                      ],
                                options: [
                                  ChipData('Végétarien'),
                                  ChipData('Oeuf'),
                                  ChipData('Poisson'),
                                  ChipData('Viande rouge'),
                                  ChipData('Viande blanche')
                                ],
                                onChanged: (val) => setState(
                                    () => mainComponentValue = val.first),
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
                                initialized: mainComponentValue != null,
                                alignment: WrapAlignment.spaceEvenly,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
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
                              'Accompagnement',
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
                                initiallySelected: sideComponentValue != null
                                    ? [sideComponentValue]
                                    : [
                                        containerFoodActionsRecord.sideComponent
                                      ],
                                options: [
                                  ChipData('Riz'),
                                  ChipData('Pâtes'),
                                  ChipData('Blé'),
                                  ChipData('Légumes'),
                                  ChipData('Pommes de terre')
                                ],
                                onChanged: (val) => setState(
                                    () => sideComponentValue = val.first),
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
                                initialized: sideComponentValue != null,
                                alignment: WrapAlignment.spaceEvenly,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          value: deleteValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => deleteValue = newValue),
                          title: Text(
                            'Supprimer',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          activeColor: Color(0xFFA10000),
                          activeTrackColor: Color(0xFFAD6161),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
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
                                    functions.foodActionsCO2e(
                                        'main',
                                        mainComponentValue,
                                        sideComponentValue,
                                        1));
                                logFirebaseEvent('iconButton-Backend-Call');

                                final foodActionsUpdateData =
                                    createFoodActionsRecordData(
                                  co2e: FFAppState().actionCO2,
                                );
                                await containerFoodActionsRecord.reference
                                    .update(foodActionsUpdateData);
                              },
                              child: IconButtonWidget(
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
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
                                if (deleteValue) {
                                  logFirebaseEvent('iconButton-Backend-Call');
                                  await containerFoodActionsRecord.reference
                                      .delete();
                                  logFirebaseEvent('iconButton-Backend-Call');
                                  await widget.typeCache.reference.delete();
                                } else {
                                  logFirebaseEvent(
                                      'iconButton-Update-Local-State');
                                  setState(() => FFAppState().actionCO2 =
                                      functions.foodActionsCO2e(
                                          'main',
                                          mainComponentValue,
                                          sideComponentValue,
                                          1));
                                  logFirebaseEvent('iconButton-Backend-Call');

                                  final foodActionsUpdateData =
                                      createFoodActionsRecordData(
                                    co2e: FFAppState().actionCO2,
                                    mainComponent: mainComponentValue,
                                    sideComponent: sideComponentValue,
                                  );
                                  await containerFoodActionsRecord.reference
                                      .update(foodActionsUpdateData);
                                }

                                logFirebaseEvent('iconButton-Navigate-Back');
                                Navigator.pop(context);
                                logFirebaseEvent(
                                    'iconButton-Update-Local-State');
                                setState(() => FFAppState().loading = false);
                              },
                              child: IconButtonWidget(
                                fillColor: FlutterFlowTheme.of(context).orange,
                                fontColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
