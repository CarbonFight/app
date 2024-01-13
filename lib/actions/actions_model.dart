import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'actions_widget.dart' show ActionsWidget;
import 'package:flutter/material.dart';

class ActionsModel extends FlutterFlowModel<ActionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // State field(s) for actionType widget.
  String? actionTypeValue;
  FormFieldController<List<String>>? actionTypeValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
    titleBackModel = createModel(context, () => TitleBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    titleBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
