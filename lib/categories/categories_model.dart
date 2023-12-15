import '/components/head_widget.dart';
import '/components/title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for Title component.
  late TitleModel titleModel;

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
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
