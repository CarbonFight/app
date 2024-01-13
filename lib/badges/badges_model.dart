import '/components/badge_widget.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/components/work_in_progress_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'badges_widget.dart' show BadgesWidget;
import 'package:flutter/material.dart';

class BadgesModel extends FlutterFlowModel<BadgesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // Model for workInProgress component.
  late WorkInProgressModel workInProgressModel;
  // Model for graine.
  late BadgeModel graineModel1;
  // Model for graine.
  late BadgeModel graineModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
    titleBackModel = createModel(context, () => TitleBackModel());
    workInProgressModel = createModel(context, () => WorkInProgressModel());
    graineModel1 = createModel(context, () => BadgeModel());
    graineModel2 = createModel(context, () => BadgeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    titleBackModel.dispose();
    workInProgressModel.dispose();
    graineModel1.dispose();
    graineModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
