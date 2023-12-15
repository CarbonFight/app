import '/components/head_widget.dart';
import '/components/title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'challenges_widget.dart' show ChallengesWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ChallengesModel extends FlutterFlowModel<ChallengesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for Title component.
  late TitleModel titleModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for Onboarding widget.
  late ExpandableController onboardingController;

  // State field(s) for Fidelisation widget.
  late ExpandableController fidelisationController;

  // State field(s) for Trajets widget.
  late ExpandableController trajetsController;

  // State field(s) for Repas widget.
  late ExpandableController repasController;

  // State field(s) for Communaut widget.
  late ExpandableController communautController;

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
    onboardingController.dispose();
    fidelisationController.dispose();
    trajetsController.dispose();
    repasController.dispose();
    communautController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
