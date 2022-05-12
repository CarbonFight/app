import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MetroFormModifyWidget extends StatefulWidget {
  const MetroFormModifyWidget({
    Key key,
    this.typeCache,
  }) : super(key: key);

  final ActionTypeCacheRecord typeCache;

  @override
  _MetroFormModifyWidgetState createState() => _MetroFormModifyWidgetState();
}

class _MetroFormModifyWidgetState extends State<MetroFormModifyWidget> {
  bool deleteValue;
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
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
          List<TransportActionsRecord> containerTransportActionsRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final containerTransportActionsRecord =
              containerTransportActionsRecordList.isNotEmpty
                  ? containerTransportActionsRecordList.first
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
                            child: SvgPicture.asset(
                              'assets/images/trans-metro-06.svg',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Trajet en métro',
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
                                  controller: textController ??=
                                      TextEditingController(
                                    text: containerTransportActionsRecord
                                        .distance
                                        .toString(),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nombre de stations',
                                    hintText: 'Nombre de stations',
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
                                      Icons.traffic,
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
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent('iconButton-ON_TAP');
                                      logFirebaseEvent(
                                          'iconButton-Update-Local-State');
                                      setState(() => FFAppState().actionCO2 =
                                          functions.transportActionsCO2e(
                                              int.parse(
                                                  textController?.text ?? ''),
                                              '1',
                                              'null',
                                              'null',
                                              'metro'));
                                      logFirebaseEvent(
                                          'iconButton-Backend-Call');

                                      final transportActionsUpdateData =
                                          createTransportActionsRecordData(
                                        co2e: FFAppState().actionCO2,
                                      );
                                      await containerTransportActionsRecord
                                          .reference
                                          .update(transportActionsUpdateData);
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent('iconButton-ON_TAP');
                                      logFirebaseEvent(
                                          'iconButton-Update-Local-State');
                                      setState(
                                          () => FFAppState().loading = true);
                                      if (deleteValue) {
                                        logFirebaseEvent(
                                            'iconButton-Backend-Call');
                                        await containerTransportActionsRecord
                                            .reference
                                            .delete();
                                        logFirebaseEvent(
                                            'iconButton-Backend-Call');
                                        await widget.typeCache.reference
                                            .delete();
                                      } else {
                                        logFirebaseEvent(
                                            'iconButton-Update-Local-State');
                                        setState(() => FFAppState().actionCO2 =
                                            functions.transportActionsCO2e(
                                                int.parse(
                                                    textController?.text ?? ''),
                                                '1',
                                                'null',
                                                'null',
                                                'metro'));
                                        logFirebaseEvent(
                                            'iconButton-Backend-Call');

                                        final transportActionsUpdateData =
                                            createTransportActionsRecordData(
                                          distance: int.parse(
                                              textController?.text ?? ''),
                                          co2e: FFAppState().actionCO2,
                                        );
                                        await containerTransportActionsRecord
                                            .reference
                                            .update(transportActionsUpdateData);
                                      }

                                      logFirebaseEvent(
                                          'iconButton-Navigate-Back');
                                      Navigator.pop(context);
                                      logFirebaseEvent(
                                          'iconButton-Update-Local-State');
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
                            ],
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
