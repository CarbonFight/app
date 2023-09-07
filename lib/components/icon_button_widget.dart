import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_button_model.dart';
export 'icon_button_model.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({
    Key? key,
    this.fillColor,
    this.fontColor,
    this.icon,
    this.text,
  }) : super(key: key);

  final Color? fillColor;
  final Color? fontColor;
  final Widget? icon;
  final String? text;

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  late IconButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: AlignmentDirectional(0.0, 1.0),
      children: [
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: widget.fillColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                color: Color(0x17000000),
                offset: Offset(0.0, 6.0),
              )
            ],
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: widget.fillColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x28000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(100.0),
          ),
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text!,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Montserrat',
                        color: widget.fontColor,
                      ),
                ),
                widget.icon!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
