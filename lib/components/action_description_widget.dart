import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'action_description_model.dart';
export 'action_description_model.dart';

class ActionDescriptionWidget extends StatefulWidget {
  const ActionDescriptionWidget({
    super.key,
    this.date,
    required this.action,
    this.option,
    this.co2e,
    required this.category,
    required this.ref,
  });

  final String? date;
  final String? action;
  final String? option;
  final int? co2e;
  final String? category;
  final DocumentReference? ref;

  @override
  _ActionDescriptionWidgetState createState() =>
      _ActionDescriptionWidgetState();
}

class _ActionDescriptionWidgetState extends State<ActionDescriptionWidget>
    with TickerProviderStateMixin {
  late ActionDescriptionModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 70.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionDescriptionModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'declare',
            queryParameters: {
              'category': serializeParam(
                widget.category,
                ParamType.String,
              ),
              'actionRef': serializeParam(
                widget.ref,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 40.0,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    children: [
                      if (widget.category == 'Trajets')
                        Icon(
                          FFIcons.kwalk,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Logement')
                        Icon(
                          FFIcons.khome,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Repas')
                        Icon(
                          FFIcons.ktoolsKitchen,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Habits')
                        Icon(
                          FFIcons.khanger,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Mobilier')
                        Icon(
                          FFIcons.karmchair2,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Numérique')
                        Icon(
                          FFIcons.kdeviceTv,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Electroménager')
                        Icon(
                          FFIcons.kwashMachine,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Objets')
                        Icon(
                          FFIcons.kboxSeam,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.category == 'Services')
                        Icon(
                          FFIcons.kbuilding,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.date,
                          '1/1/2024',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                      TextSpan(
                        text: '\n',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.action,
                          'action',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      TextSpan(
                        text: '\n',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      TextSpan(
                        text: widget.option!,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      const TextSpan(
                        text: '\n',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          functions.pS(widget.co2e),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Icon(
                    FFIcons.karrowRight3,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
