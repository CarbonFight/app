import '/components/head_signin_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for headSignin component.
  late HeadSigninModel headSigninModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headSigninModel = createModel(context, () => HeadSigninModel());
    titleBackModel = createModel(context, () => TitleBackModel());
  }

  @override
  void dispose() {
    headSigninModel.dispose();
    titleBackModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
