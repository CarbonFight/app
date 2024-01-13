import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'badge_model.dart';
export 'badge_model.dart';

class BadgeWidget extends StatefulWidget {
  const BadgeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.active,
    required this.id,
  });

  final Widget? icon;
  final String? title;
  final String? desc;
  final bool? active;
  final String? id;

  @override
  _BadgeWidgetState createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  late BadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgeModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon!,
                  ].divide(const SizedBox(height: 1.0)),
                ),
              ),
              Container(
                width: 195.0,
                height: 75.0,
                decoration: const BoxDecoration(),
                child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.title,
                          'Titre',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const TextSpan(
                        text: '\n\n',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.desc,
                          'Description',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ].divide(const SizedBox(width: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: FFButtonWidget(
            onPressed: !widget.active!
                ? null
                : () async {
                    await currentUserReference!.update(createUsersRecordData(
                      badge: widget.id,
                    ));
                  },
            text: 'Sélectionner',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).bodySmall,
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
              disabledColor: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
