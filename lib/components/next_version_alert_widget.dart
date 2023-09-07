import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'next_version_alert_model.dart';
export 'next_version_alert_model.dart';

class NextVersionAlertWidget extends StatefulWidget {
  const NextVersionAlertWidget({Key? key}) : super(key: key);

  @override
  _NextVersionAlertWidgetState createState() => _NextVersionAlertWidgetState();
}

class _NextVersionAlertWidgetState extends State<NextVersionAlertWidget> {
  late NextVersionAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NextVersionAlertModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x25000000),
              offset: Offset(0.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
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
                      Text(
                        'Bientôt disponible !',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ],
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 46.0,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'NEXT_VERSION_ALERT_COMP_close_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Désolé , cette fonctionnalité n\'est pas encore disponible.\n\nSi vous voyez cette fenêtre, la fonctionnalité est déjà listée pour la prochaine version.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'NEXT_VERSION_ALERT_Container_etc6i9og_ON');
                            logFirebaseEvent('iconButton_navigate_back');
                            context.pop();
                          },
                          child: wrapWithModel(
                            model: _model.iconButtonModel,
                            updateCallback: () => setState(() {}),
                            child: IconButtonWidget(
                              fillColor: Color(0xA10B1E1B),
                              fontColor: FlutterFlowTheme.of(context).tertiary,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 25.0,
                              ),
                              text: 'Fermer ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
