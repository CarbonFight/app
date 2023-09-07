import '/auth/firebase_auth/auth_util.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // Model for iconButton component.
  late IconButtonModel iconButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    iconButtonModel = createModel(context, () => IconButtonModel());
  }

  void dispose() {
    emailController?.dispose();
    iconButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
