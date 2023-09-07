import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/icon_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransportModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetOptions)] action in Transport widget.
  ApiCallResponse? listOptions;
  // Stores action output result for [Backend Call - API (GetEmissionFactor)] action in Transport widget.
  ApiCallResponse? emissionFactor;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for powertype widget.
  String? powertypeValue;
  FormFieldController<String>? powertypeValueController;
  // Stores action output result for [Backend Call - API (GetEmissionFactor)] action in powertype widget.
  ApiCallResponse? calculationOption;
  // State field(s) for passengers widget.
  String? passengersValue;
  FormFieldController<String>? passengersValueController;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for periodicity widget.
  List<String>? periodicityValues;
  FormFieldController<List<String>>? periodicityValueController;
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
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    deleteModel = createModel(context, () => IconButtonModel());
    deleteWaitModel = createModel(context, () => IconButtonModel());
    modifyModel = createModel(context, () => IconButtonModel());
    modifyWaitModel = createModel(context, () => IconButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    deleteModel.dispose();
    deleteWaitModel.dispose();
    modifyModel.dispose();
    modifyWaitModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
