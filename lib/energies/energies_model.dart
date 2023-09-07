import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnergiesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetOptions)] action in Energies widget.
  ApiCallResponse? listOptions;
  // Stores action output result for [Backend Call - API (GetEmissionFactor)] action in Energies widget.
  ApiCallResponse? emissionFactor;
  // State field(s) for volume widget.
  TextEditingController? volumeController;
  String? Function(BuildContext, String?)? volumeControllerValidator;
  // State field(s) for peopleSharing widget.
  String? peopleSharingValue;
  FormFieldController<String>? peopleSharingValueController;
  // State field(s) for powertype widget.
  String? powertypeValue;
  FormFieldController<String>? powertypeValueController;
  // Stores action output result for [Backend Call - API (GetEmissionFactor)] action in powertype widget.
  ApiCallResponse? calculationEnergyOption;
  // Model for delete.
  late IconButtonModel deleteModel;
  // Model for deleteWait.
  late IconButtonModel deleteWaitModel;
  // Model for modify.
  late IconButtonModel modifyModel;
  // Model for modifyWait.
  late IconButtonModel modifyWaitModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    deleteModel = createModel(context, () => IconButtonModel());
    deleteWaitModel = createModel(context, () => IconButtonModel());
    modifyModel = createModel(context, () => IconButtonModel());
    modifyWaitModel = createModel(context, () => IconButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    volumeController?.dispose();
    deleteModel.dispose();
    deleteWaitModel.dispose();
    modifyModel.dispose();
    modifyWaitModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
