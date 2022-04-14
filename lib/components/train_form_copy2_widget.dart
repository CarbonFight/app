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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainFormCopy2Widget extends StatefulWidget {
  const TrainFormCopy2Widget({
    Key key,
    this.cache,
    this.typeCache,
  }) : super(key: key);

  final ActionCacheRecord cache;
  final ActionTypeCacheRecord typeCache;

  @override
  _TrainFormCopy2WidgetState createState() => _TrainFormCopy2WidgetState();
}

class _TrainFormCopy2WidgetState extends State<TrainFormCopy2Widget> {
  String powertypeValue;
  TextEditingController textController;
  bool deleteValue;

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
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
          child: StreamBuilder<List<TransportActionsRecord>>(
            stream: queryTransportActionsRecord(
              queryBuilder: (transportActionsRecord) => transportActionsRecord
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
              List<TransportActionsRecord> columnTransportActionsRecordList =
                  snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final columnTransportActionsRecord =
                  columnTransportActionsRecordList.isNotEmpty
                      ? columnTransportActionsRecordList.first
                      : null;
              return SingleChildScrollView(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: SvgPicture.asset(
                                'assets/images/trans-train-04.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Trajet en train',
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
                                columnTransportActionsRecord.co2e.toString(),
                                '0',
                              )} g',
                              '+ 0 g',
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
                              controller: textController ??=
                                  TextEditingController(
                                text: columnTransportActionsRecord.distance
                                    .toString(),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Distance Parcourue (en km )',
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
                              initialOption: powertypeValue ??=
                                  columnTransportActionsRecord.powertype,
                              options: [
                                'TER',
                                'TGV',
                                'Intercites',
                                'RER',
                                'Transilien',
                                'Tramway'
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
                              hintText: 'Type de train',
                              icon: Icon(
                                Icons.train_sharp,
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
                    SwitchListTile(
                      value: deleteValue ??= false,
                      onChanged: (newValue) =>
                          setState(() => deleteValue = newValue),
                      title: Text(
                        'Supprimer',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      tileColor: FlutterFlowTheme.of(context).secondaryColor,
                      activeColor: Color(0xFFA10000),
                      activeTrackColor: Color(0xFFAD6161),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent('iconButton-ON_TAP');
                                logFirebaseEvent(
                                    'iconButton-Update-Local-State');
                                setState(() => FFAppState().actionCO2 =
                                    functions.transportActionsCO2e(
                                        int.parse(textController?.text ?? ''),
                                        '1',
                                        'null',
                                        valueOrDefault<String>(
                                          powertypeValue,
                                          'TER',
                                        ),
                                        'train'));
                                logFirebaseEvent('iconButton-Backend-Call');

                                final transportActionsUpdateData =
                                    createTransportActionsRecordData(
                                  co2e: FFAppState().actionCO2,
                                );
                                await columnTransportActionsRecord.reference
                                    .update(transportActionsUpdateData);
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
                                text: 'Calculer ',
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent('iconButton-ON_TAP');
                              logFirebaseEvent('iconButton-Update-Local-State');
                              setState(() => FFAppState().actionCO2 =
                                  functions.transportActionsCO2e(
                                      int.parse(textController?.text ?? ''),
                                      '1',
                                      'null',
                                      valueOrDefault<String>(
                                        powertypeValue,
                                        'TER',
                                      ),
                                      'train'));
                              if (deleteValue) {
                                logFirebaseEvent('iconButton-Backend-Call');
                                await columnTransportActionsRecord.reference
                                    .delete();
                                logFirebaseEvent('iconButton-Backend-Call');
                                await widget.typeCache.reference.delete();
                              } else {
                                logFirebaseEvent('iconButton-Backend-Call');

                                final transportActionsUpdateData =
                                    createTransportActionsRecordData(
                                  distance:
                                      int.parse(textController?.text ?? ''),
                                  powertype: powertypeValue,
                                  co2e: FFAppState().actionCO2,
                                );
                                await columnTransportActionsRecord.reference
                                    .update(transportActionsUpdateData);
                                logFirebaseEvent('iconButton-Backend-Call');

                                final actionCacheUpdateData =
                                    createActionCacheRecordData(
                                  co2e: FFAppState().actionCO2,
                                );
                                await widget.cache.reference
                                    .update(actionCacheUpdateData);
                              }

                              logFirebaseEvent('iconButton-Navigate-Back');
                              Navigator.pop(context);
                            },
                            child: IconButtonWidget(
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              fontColor:
                                  FlutterFlowTheme.of(context).tertiaryColor,
                              icon: Icon(
                                Icons.add_circle_outline,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 25,
                              ),
                              text: 'Modifier ',
                            ),
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
      ),
    );
  }
}