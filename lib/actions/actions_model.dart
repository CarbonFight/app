import '/components/head_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'actions_widget.dart' show ActionsWidget;
import 'package:flutter/material.dart';

class ActionsModel extends FlutterFlowModel<ActionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
