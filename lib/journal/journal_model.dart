import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'journal_widget.dart' show JournalWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class JournalModel extends FlutterFlowModel<JournalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for head component.
  late HeadModel headModel;
  // Model for TitleBack component.
  late TitleBackModel titleBackModel;
  // State field(s) for actionType widget.
  String? actionTypeValue;
  FormFieldController<List<String>>? actionTypeValueController;
  // State field(s) for action widget.

  PagingController<DocumentSnapshot?, ActionsRecord>? actionPagingController;
  Query? actionPagingQuery;
  List<StreamSubscription?> actionStreamSubscriptions = [];

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
    for (var s in actionStreamSubscriptions) {
      s?.cancel();
    }
    actionPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ActionsRecord> setActionController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    actionPagingController ??= _createActionController(query, parent);
    if (actionPagingQuery != query) {
      actionPagingQuery = query;
      actionPagingController?.refresh();
    }
    return actionPagingController!;
  }

  PagingController<DocumentSnapshot?, ActionsRecord> _createActionController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ActionsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryActionsRecordPage(
          queryBuilder: (_) => actionPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: actionStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
