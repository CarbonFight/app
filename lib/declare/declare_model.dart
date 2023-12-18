import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'declare_widget.dart' show DeclareWidget;
import 'package:flutter/material.dart';

class DeclareModel extends FlutterFlowModel<DeclareWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetActions)] action in declare widget.
  ApiCallResponse? getActionsResult;
  // Stores action output result for [Backend Call - Read Document] action in declare widget.
  ActionsRecord? actionFields;
  // Stores action output result for [Backend Call - API (GetOptions)] action in declare widget.
  ApiCallResponse? loadAction;
  // Model for head component.
  late HeadModel headModel;
  // State field(s) for action widget.
  String? actionValue;
  FormFieldController<String>? actionValueController;
  // Stores action output result for [Backend Call - API (GetOptions)] action in action widget.
  ApiCallResponse? actionChangeOptions;
  // State field(s) for distance widget.
  FocusNode? distanceFocusNode;
  TextEditingController? distanceController;
  String? Function(BuildContext, String?)? distanceControllerValidator;
  // State field(s) for option widget.
  String? optionValue1;
  FormFieldController<String>? optionValueController1;
  // State field(s) for passengers widget.
  int? passengersValue;
  // State field(s) for roundtrip widget.
  bool? roundtripValue;
  // State field(s) for isperiodic widget.
  bool? isperiodicValue;
  // State field(s) for periodicity widget.
  List<String>? periodicityValues;
  FormFieldController<List<String>>? periodicityValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? addAction;
  // State field(s) for volume widget.
  FocusNode? volumeFocusNode;
  TextEditingController? volumeController;
  String? Function(BuildContext, String?)? volumeControllerValidator;
  // State field(s) for option widget.
  String? optionValue2;
  FormFieldController<String>? optionValueController2;
  // State field(s) for sharingHome widget.
  int? sharingHomeValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? addActionEnergy;
  // State field(s) for optionItem widget.
  String? optionItemValue;
  FormFieldController<String>? optionItemValueController;
  // State field(s) for quantityItem widget.
  int? quantityItemValue;
  // State field(s) for yearPurchase widget.
  String? yearPurchaseValue;
  FormFieldController<String>? yearPurchaseValueController;
  // State field(s) for newBuy widget.
  bool? newBuyValue;
  // State field(s) for yearPreviousPurchase widget.
  String? yearPreviousPurchaseValue;
  FormFieldController<String>? yearPreviousPurchaseValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? addActionItem;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    distanceFocusNode?.dispose();
    distanceController?.dispose();

    volumeFocusNode?.dispose();
    volumeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
