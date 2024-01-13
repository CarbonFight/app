import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'target_widget.dart' show TargetWidget;
import 'package:flutter/material.dart';

class TargetModel extends FlutterFlowModel<TargetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // State field(s) for targetSlider widget.
  double? targetSliderValue;

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
