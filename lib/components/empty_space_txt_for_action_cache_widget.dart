import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptySpaceTxtForActionCacheWidget extends StatefulWidget {
  const EmptySpaceTxtForActionCacheWidget({Key key}) : super(key: key);

  @override
  _EmptySpaceTxtForActionCacheWidgetState createState() =>
      _EmptySpaceTxtForActionCacheWidgetState();
}

class _EmptySpaceTxtForActionCacheWidgetState
    extends State<EmptySpaceTxtForActionCacheWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Text(
        'Je ne me souviens pas',
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).subtitle1.override(
              fontFamily: 'Montserrat',
              color: FlutterFlowTheme.of(context).tertiaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
