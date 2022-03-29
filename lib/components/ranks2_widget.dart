import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Ranks2Widget extends StatefulWidget {
  const Ranks2Widget({Key key}) : super(key: key);

  @override
  _Ranks2WidgetState createState() => _Ranks2WidgetState();
}

class _Ranks2WidgetState extends State<Ranks2Widget> {
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
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
                              'assets/images/badge.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Classement',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                            child: Text(
                              'Top CarbonFighters ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
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
                          Container(
                            height: 200,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) => usersRecord
                                          .where('level', isEqualTo: 3)
                                          .orderBy('global_score'),
                                      limit: 5,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitRing(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          listViewUsersRecordList =
                                          snapshot.data;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewUsersRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUsersRecord =
                                              listViewUsersRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 2),
                                            child: Container(
                                              width: double.infinity,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF4F4F4),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 8, 12, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 20,
                                                          height: 20,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            '#${listViewUsersRecord.rank.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              listViewUsersRecord
                                                                  .displayName,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Score : ${listViewUsersRecord.globalScore.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
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
                                        },
                                      );
                                    },
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(90, 0, 90, 0),
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                            child: Text(
                              'Votre position',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                        ),
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
                        Container(
                          height: 200,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AuthUserStreamWidget(
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) => usersRecord
                                          .where('level',
                                              isEqualTo:
                                                  currentUserDocument?.level)
                                          .orderBy('global_score'),
                                      limit: 5,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitRing(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          listViewUsersRecordList =
                                          snapshot.data;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewUsersRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUsersRecord =
                                              listViewUsersRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 2),
                                            child: Container(
                                              width: double.infinity,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF4F4F4),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 8, 12, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 20,
                                                          height: 20,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            '#${listViewUsersRecord.rank.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              listViewUsersRecord
                                                                  .displayName,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Score : ${listViewUsersRecord.globalScore.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
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
                                        },
                                      );
                                    },
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
    );
  }
}
