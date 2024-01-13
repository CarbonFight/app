import '/components/dark_widget.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'account_widget.dart' show AccountWidget;
import 'package:flutter/material.dart';

class AccountModel extends FlutterFlowModel<AccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstnameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for sponsor widget.
  FocusNode? sponsorFocusNode;
  TextEditingController? sponsorController;
  String? Function(BuildContext, String?)? sponsorControllerValidator;
  // Model for dark component.
  late DarkModel darkModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headModel = createModel(context, () => HeadModel());
    titleBackModel = createModel(context, () => TitleBackModel());
    darkModel = createModel(context, () => DarkModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headModel.dispose();
    titleBackModel.dispose();
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameController?.dispose();

    firstnameFocusNode?.dispose();
    firstnameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    sponsorFocusNode?.dispose();
    sponsorController?.dispose();

    darkModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
