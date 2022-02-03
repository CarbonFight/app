import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF100F0F),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: StreamBuilder<List<ActionsCarRecord>>(
          stream: queryActionsCarRecord(
            queryBuilder: (actionsCarRecord) =>
                actionsCarRecord.orderBy('date'),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitRipple(
                    color: FlutterFlowTheme.primaryColor,
                    size: 50,
                  ),
                ),
              );
            }
            List<ActionsCarRecord> gridViewActionsCarRecordList = snapshot.data;
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              scrollDirection: Axis.vertical,
              itemCount: gridViewActionsCarRecordList.length,
              itemBuilder: (context, gridViewIndex) {
                final gridViewActionsCarRecord =
                    gridViewActionsCarRecordList[gridViewIndex];
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Car',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          gridViewActionsCarRecord.co2e.toString(),
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          gridViewActionsCarRecord.date.toString(),
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            await gridViewActionsCarRecord.reference.delete();
                          },
                          child: Icon(
                            Icons.delete,
                            color: FlutterFlowTheme.secondaryColor,
                            size: 24,
                          ),
                        ),
                        Icon(
                          Icons.edit_rounded,
                          color: FlutterFlowTheme.secondaryColor,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
