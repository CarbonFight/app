import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({
    Key key,
    this.fillColor,
    this.fontColor,
    this.icon,
    this.text,
  }) : super(key: key);

  final Color fillColor;
  final Color fontColor;
  final Widget icon;
  final String text;

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(0, 1),
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: widget.fillColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Color(0x17000000),
                offset: Offset(0, 6),
              )
            ],
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: widget.fillColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x28000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Montserrat',
                    color: widget.fontColor,
                  ),
                ),
                widget.icon,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
