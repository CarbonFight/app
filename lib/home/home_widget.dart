import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'CarbonFight',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.secondaryColor,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 1,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/background.png',
            ).image,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '1.45',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.secondaryColor,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'TCO2e',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
