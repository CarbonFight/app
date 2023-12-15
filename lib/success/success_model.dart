import '/components/head_widget.dart';
import '/components/title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'success_widget.dart' show SuccessWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SuccessModel extends FlutterFlowModel<SuccessWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for Title component.
  late TitleModel titleModel;
  // State field(s) for lodging widget.
  late ExpandableController lodgingController;

  // State field(s) for clothes widget.
  late ExpandableController clothesController;

  // State field(s) for appliance widget.
  late ExpandableController applianceController;

  // State field(s) for furniture widget.
  late ExpandableController furnitureController;

  // State field(s) for digital widget.
  late ExpandableController digitalController1;

  // State field(s) for digital widget.
  late ExpandableController digitalController2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
    titleModel = createModel(context, () => TitleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    titleModel.dispose();
    lodgingController.dispose();
    clothesController.dispose();
    applianceController.dispose();
    furnitureController.dispose();
    digitalController1.dispose();
    digitalController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
