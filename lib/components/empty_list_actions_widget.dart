import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_list_actions_model.dart';
export 'empty_list_actions_model.dart';

class EmptyListActionsWidget extends StatefulWidget {
  const EmptyListActionsWidget({super.key});

  @override
  _EmptyListActionsWidgetState createState() => _EmptyListActionsWidgetState();
}

class _EmptyListActionsWidgetState extends State<EmptyListActionsWidget> {
  late EmptyListActionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListActionsModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FFIcons.kbulb,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
              Expanded(
                child: Text(
                  'Vous n\'avez pas d\'actions dans cette catégorie',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
