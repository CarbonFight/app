import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for retypepassword widget.
  TextEditingController? retypepasswordController;
  late bool retypepasswordVisibility;
  String? Function(BuildContext, String?)? retypepasswordControllerValidator;
  // Model for iconButton component.
  late IconButtonModel iconButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    retypepasswordVisibility = false;
    iconButtonModel = createModel(context, () => IconButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    retypepasswordController?.dispose();
    iconButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
