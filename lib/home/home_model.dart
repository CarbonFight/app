import '/backend/backend.dart';
import '/components/empty_actions_widget.dart';
import '/components/head_widget.dart';
import '/components/home_category_widget.dart';
import '/components/title_widget.dart';
import '/components/work_in_progress_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in home widget.
  StatsRecord? statsRead;
  // Model for head component.
  late HeadModel headModel;
  // Model for Title component.
  late TitleModel titleModel;
  // State field(s) for homeInfos widget.
  String? homeInfosValue;
  FormFieldController<List<String>>? homeInfosValueController;
  // Model for emptyActions component.
  late EmptyActionsModel emptyActionsModel;
  // Model for Transport.
  late HomeCategoryModel transportModel;
  // Model for lodging.
  late HomeCategoryModel lodgingModel;
  // Model for food.
  late HomeCategoryModel foodModel;
  // Model for Clothes.
  late HomeCategoryModel clothesModel;
  // Model for Furniture.
  late HomeCategoryModel furnitureModel;
  // Model for digital.
  late HomeCategoryModel digitalModel;
  // Model for electro.
  late HomeCategoryModel electroModel;
  // Model for Objects.
  late HomeCategoryModel objectsModel1;
  // Model for Objects.
  late HomeCategoryModel objectsModel2;
  // Model for workInProgress component.
  late WorkInProgressModel workInProgressModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
    titleModel = createModel(context, () => TitleModel());
    emptyActionsModel = createModel(context, () => EmptyActionsModel());
    transportModel = createModel(context, () => HomeCategoryModel());
    lodgingModel = createModel(context, () => HomeCategoryModel());
    foodModel = createModel(context, () => HomeCategoryModel());
    clothesModel = createModel(context, () => HomeCategoryModel());
    furnitureModel = createModel(context, () => HomeCategoryModel());
    digitalModel = createModel(context, () => HomeCategoryModel());
    electroModel = createModel(context, () => HomeCategoryModel());
    objectsModel1 = createModel(context, () => HomeCategoryModel());
    objectsModel2 = createModel(context, () => HomeCategoryModel());
    workInProgressModel = createModel(context, () => WorkInProgressModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    titleModel.dispose();
    emptyActionsModel.dispose();
    transportModel.dispose();
    lodgingModel.dispose();
    foodModel.dispose();
    clothesModel.dispose();
    furnitureModel.dispose();
    digitalModel.dispose();
    electroModel.dispose();
    objectsModel1.dispose();
    objectsModel2.dispose();
    workInProgressModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
