import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'declare_widget.dart' show DeclareWidget;
import 'package:flutter/material.dart';

class DeclareModel extends FlutterFlowModel<DeclareWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetActions)] action in declare widget.
  ApiCallResponse? getActionsResult;
  // Stores action output result for [Backend Call - API (GetOptions)] action in declare widget.
  ApiCallResponse? getStarters;
  // Stores action output result for [Backend Call - Read Document] action in declare widget.
  ActionsRecord? actionFields;
  // Stores action output result for [Backend Call - API (GetOptions)] action in declare widget.
  ApiCallResponse? getOptionsResult;
  // Model for head component.
  late HeadModel headModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // State field(s) for action widget.
  String? actionValue;
  FormFieldController<String>? actionValueController;
  // Stores action output result for [Backend Call - API (GetOptions)] action in action widget.
  ApiCallResponse? actionChangeOptions;
  // State field(s) for optionTrajets widget.
  String? optionTrajetsValue;
  FormFieldController<String>? optionTrajetsValueController;
  // State field(s) for volumeTrajets widget.
  FocusNode? volumeTrajetsFocusNode;
  TextEditingController? volumeTrajetsController;
  String? Function(BuildContext, String?)? volumeTrajetsControllerValidator;
  // State field(s) for passengers widget.
  int? passengersValue;
  // State field(s) for roundtrip widget.
  bool? roundtripValue;
  // State field(s) for isperiodic widget.
  bool? isperiodicValue;
  // State field(s) for periodicity widget.
  List<String>? periodicityValues;
  FormFieldController<List<String>>? periodicityValueController;
  // State field(s) for optionLodging widget.
  String? optionLodgingValue;
  FormFieldController<String>? optionLodgingValueController;
  // State field(s) for volumeLodging widget.
  FocusNode? volumeLodgingFocusNode;
  TextEditingController? volumeLodgingController;
  String? Function(BuildContext, String?)? volumeLodgingControllerValidator;
  // State field(s) for sharingLodging widget.
  int? sharingLodgingValue;
  // State field(s) for optionItem widget.
  String? optionItemValue;
  FormFieldController<String>? optionItemValueController;
  // State field(s) for volumeItem widget.
  FocusNode? volumeItemFocusNode;
  TextEditingController? volumeItemController;
  String? Function(BuildContext, String?)? volumeItemControllerValidator;
  // State field(s) for newBuy widget.
  bool? newBuyValue;
  // State field(s) for yearPurchase widget.
  String? yearPurchaseValue;
  FormFieldController<String>? yearPurchaseValueController;
  // State field(s) for starterchips widget.
  String? starterchipsValue;
  FormFieldController<List<String>>? starterchipsValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? addActionEnergy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? addActionClothes;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? addActionTrajets;

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
    volumeTrajetsFocusNode?.dispose();
    volumeTrajetsController?.dispose();

    volumeLodgingFocusNode?.dispose();
    volumeLodgingController?.dispose();

    volumeItemFocusNode?.dispose();
    volumeItemController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
