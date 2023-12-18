import '/components/head_widget.dart';
import '/components/title_return_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'badges_widget.dart' show BadgesWidget;
import 'package:flutter/material.dart';

class BadgesModel extends FlutterFlowModel<BadgesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for Title_return component.
  late TitleReturnModel titleReturnModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
    titleReturnModel = createModel(context, () => TitleReturnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    titleReturnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}