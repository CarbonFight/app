import '/components/head_widget.dart';
import '/components/title_return_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'account_widget.dart' show AccountWidget;
import 'package:flutter/material.dart';

class AccountModel extends FlutterFlowModel<AccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for Title_return component.
  late TitleReturnModel titleReturnModel;
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
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
