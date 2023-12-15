import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'declare_model.dart';
export 'declare_model.dart';

class DeclareWidget extends StatefulWidget {
  const DeclareWidget({
    super.key,
    required this.category,
    this.actionRef,
  });

  final String? category;
  final DocumentReference? actionRef;

  @override
  _DeclareWidgetState createState() => _DeclareWidgetState();
}

class _DeclareWidgetState extends State<DeclareWidget> {
  late DeclareModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeclareModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getActionsResult = await GetActionsCall.call(
        category: widget.category,
      );
      if (!(_model.getActionsResult?.succeeded ?? true)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const Text(
                  'Il y a eu une erreur lors de la récupération de la liste des actions. Veuillez essayez ultérieurement..'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      }
      if (widget.actionRef != null) {
        _model.actionFields =
            await ActionsRecord.getDocumentOnce(widget.actionRef!);
        setState(() {
          _model.periodicityValueController?.value =
              _model.actionFields!.periodicity;
        });
        setState(() {
          _model.actionValueController?.value = _model.actionFields!.action;
        });
        setState(() {
          _model.distanceController?.text =
              _model.actionFields!.count.toString();
        });
        setState(() {
          _model.passengersValue = _model.actionFields!.peopleSharing;
        });
        setState(() {
          _model.roundtripValue = _model.actionFields!.roundtrip;
        });
        setState(() {
          _model.isperiodicValue = _model.actionFields!.isPeriodic;
        });
        setState(() {
          FFAppState().actionCo2e = _model.actionFields!.co2e;
          FFAppState().actionFE = _model.actionFields!.emissionFactor;
        });
        _model.loadAction = await GetOptionsCall.call(
          category: _model.actionFields?.category,
          action: _model.actionFields?.action,
        );
        setState(() {
          _model.optionValueController?.value = _model.actionFields!.option;
        });
        // ItemOption
        setState(() {
          _model.optionItemValueController?.value = _model.actionFields!.option;
        });
        // NewPurchase
        setState(() {
          _model.newBuyValue = _model.actionFields!.newPurchase;
        });
        // Yearpurchase
        setState(() {
          _model.yearPurchaseValueController?.value =
              _model.actionFields!.yearPurchase;
        });
        // PreviousPurchase
        setState(() {
          _model.yearPreviousPurchaseValueController?.value =
              _model.actionFields!.yearPreviousPurchase;
        });
        // QuantityItem
        setState(() {
          _model.quantityItemValue = _model.actionFields!.count;
        });
      } else {
        // Reset CO2e & FE
        setState(() {
          FFAppState().actionCo2e = 0;
          FFAppState().actionFE = 0.0;
        });
      }
    });

    _model.distanceController ??= TextEditingController();
    _model.distanceFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => wrapWithModel(
                  model: _model.headModel,
                  updateCallback: () => setState(() {}),
                  child: HeadWidget(
                    displayName: currentUserDisplayName,
                  ),
                ),
              ),
              Container(
                width: 360.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Container(
                                width: 40.0,
                                height: 30.0,
                                decoration: const BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.navigate_before_sharp,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.category,
                              'Catégorie',
                            ),
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Container(
                                width: 40.0,
                                height: 30.0,
                                decoration: const BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.actionValueController ??=
                          FormFieldController<String>(null),
                      options: (GetActionsCall.actions(
                        (_model.getActionsResult?.jsonBody ?? ''),
                      ) as List)
                          .map<String>((s) => s.toString())
                          .toList().map((e) => e.toString())
                          .toList(),
                      onChanged: (val) async {
                        setState(() => _model.actionValue = val);
                        if (!(widget.actionRef != null)) {
                          _model.actionChangeOptions =
                              await GetOptionsCall.call(
                            category: widget.category,
                            action: _model.actionValue,
                          );
                          if ((_model.actionChangeOptions?.succeeded ?? true)) {
                            await action_blocks.updateFEandCOE(
                              context,
                              category: widget.category,
                              action: _model.actionValue,
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Oups !'),
                                  content: const Text(
                                      'Il y a eu un problème lors de la récupération des options de l\'action'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }

                        setState(() {});
                      },
                      width: 300.0,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'ezm982kx' /* Sélectionnez une action */,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                    if ((_model.actionValue != null &&
                            _model.actionValue != '') &&
                        (widget.category == 'Trajets'))
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '6byteb6m' /* Distance parcourue */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: SizedBox(
                                    width: 100.0,
                                    child: TextFormField(
                                      controller: _model.distanceController,
                                      focusNode: _model.distanceFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.distanceController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          setState(() {
                                            FFAppState().actionCo2e =
                                                functions.calculateActionCO2e(
                                                    int.tryParse(_model
                                                        .distanceController
                                                        .text),
                                                    _model.roundtripValue!
                                                        ? 2
                                                        : 1,
                                                    1,
                                                    _model.passengersValue
                                                        ?.toString(),
                                                    FFAppState().actionFE);
                                          });
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '75gi91h0' /* Ajouter  */,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      textAlign: TextAlign.end,
                                      keyboardType: TextInputType.number,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      validator: _model
                                          .distanceControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'i0kcs37q' /* km */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'j0d3nrxy' /* Options */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 25.0)),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    're2wij26' /* Type d'énergie */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.optionValueController ??=
                                        FormFieldController<String>(null),
                                    options: widget.actionRef != null
                                        ? (GetOptionsCall.options(
                                            (_model.loadAction?.jsonBody ?? ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(): (GetOptionsCall.options(
                                            (_model.actionChangeOptions
                                                    ?.jsonBody ??
                                                ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(),
                                    onChanged: (val) async {
                                      setState(() => _model.optionValue = val);
                                      await action_blocks.updateFEandCOE(
                                        context,
                                        category: widget.category,
                                        action: _model.actionValue,
                                        option: _model.optionValue,
                                        count: int.tryParse(
                                            _model.distanceController.text),
                                        multiplicator:
                                            _model.roundtripValue! ? 2 : 1,
                                        shared:
                                            _model.passengersValue?.toString(),
                                      );
                                    },
                                    width: 180.0,
                                    height: 40.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      't5v24chj' /* Sélectionnez */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsets.all(10.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ncgoamt7' /* Passagers */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      width: 130.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 16.0,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 16.0,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                        count: _model.passengersValue ??= 1,
                                        updateCount: (count) => setState(() =>
                                            _model.passengersValue = count),
                                        stepSize: 1,
                                        minimum: 1,
                                        maximum: 10,
                                        contentPadding: const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'm9ist8ld' /* Aller-retour */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Switch.adaptive(
                                  value: _model.roundtripValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.roundtripValue = newValue);
                                    if (newValue) {
                                      setState(() {
                                        FFAppState().actionCo2e =
                                            functions.calculateActionCO2e(
                                                int.tryParse(_model
                                                    .distanceController.text),
                                                _model.roundtripValue! ? 2 : 1,
                                                1,
                                                _model.passengersValue
                                                    ?.toString(),
                                                FFAppState().actionFE);
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().actionCo2e =
                                            functions.calculateActionCO2e(
                                                int.tryParse(_model
                                                    .distanceController.text),
                                                _model.roundtripValue! ? 2 : 1,
                                                1,
                                                _model.passengersValue
                                                    ?.toString(),
                                                FFAppState().actionFE);
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ser08hli' /* Répétition */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Switch.adaptive(
                                  value: _model.isperiodicValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.isperiodicValue = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ],
                            ),
                            if (_model.isperiodicValue ?? true)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'lc5autez' /* L */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'iawtdj0h' /* Ma */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'uu95kg1b' /* Me */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'b0yrz9tx' /* J */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'ycjgbt2f' /* V */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'af7hyn0k' /* S */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'arrxv5hc' /* D */,
                                        ))
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.periodicityValues = val),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 16.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 12.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 10.0,
                                      multiselect: true,
                                      initialized:
                                          _model.periodicityValues != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.periodicityValueController ??=
                                              FormFieldController<List<String>>(
                                        _model.actionFields?.periodicity,
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: FFAppState().actionCo2e == 0
                                    ? null
                                    : () async {
                                        if (widget.actionRef != null) {
                                          await widget.actionRef!.update({
                                            ...createActionsRecordData(
                                              action: _model.actionValue,
                                              option: _model.optionValue,
                                              co2e: FFAppState().actionCo2e,
                                              count: int.tryParse(_model
                                                  .distanceController.text),
                                              emissionFactor:
                                                  FFAppState().actionFE,
                                              peopleSharing:
                                                  _model.passengersValue,
                                              roundtrip: _model.roundtripValue,
                                              isPeriodic:
                                                  _model.isperiodicValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'periodicity':
                                                    _model.periodicityValues,
                                              },
                                            ),
                                          });
                                        } else {
                                          var actionsRecordReference =
                                              ActionsRecord.collection.doc();
                                          await actionsRecordReference.set({
                                            ...createActionsRecordData(
                                              uid: currentUserUid,
                                              createdTime:
                                                  dateTimeFromSecondsSinceEpoch(
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch),
                                              country: 'FR',
                                              category: widget.category,
                                              action: _model.actionValue,
                                              option: _model.optionValue,
                                              co2e: FFAppState().actionCo2e,
                                              count: int.tryParse(_model
                                                  .distanceController.text),
                                              emissionFactor:
                                                  FFAppState().actionFE,
                                              peopleSharing:
                                                  _model.passengersValue,
                                              roundtrip: _model.roundtripValue,
                                              isPeriodic:
                                                  _model.isperiodicValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'periodicity':
                                                    _model.periodicityValues,
                                              },
                                            ),
                                          });
                                          _model.addAction = ActionsRecord
                                              .getDocumentFromData({
                                            ...createActionsRecordData(
                                              uid: currentUserUid,
                                              createdTime:
                                                  dateTimeFromSecondsSinceEpoch(
                                                      getCurrentTimestamp
                                                          .secondsSinceEpoch),
                                              country: 'FR',
                                              category: widget.category,
                                              action: _model.actionValue,
                                              option: _model.optionValue,
                                              co2e: FFAppState().actionCo2e,
                                              count: int.tryParse(_model
                                                  .distanceController.text),
                                              emissionFactor:
                                                  FFAppState().actionFE,
                                              peopleSharing:
                                                  _model.passengersValue,
                                              roundtrip: _model.roundtripValue,
                                              isPeriodic:
                                                  _model.isperiodicValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'periodicity':
                                                    _model.periodicityValues,
                                              },
                                            ),
                                          }, actionsRecordReference);
                                        }

                                        context.pushNamed(
                                          'actions',
                                          queryParameters: {
                                            'category': serializeParam(
                                              widget.category,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        setState(() {});
                                      },
                                text: 'Ajouter ${valueOrDefault<String>(
                                  functions.pS(FFAppState().actionCo2e),
                                  '0',
                                )}',
                                options: FFButtonOptions(
                                  width: 290.0,
                                  height: 40.0,
                                  padding: const EdgeInsets.all(0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle:
                                      FlutterFlowTheme.of(context).titleSmall,
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                  disabledColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if ((_model.actionValue != null &&
                            _model.actionValue != '') &&
                        ((widget.category == 'Habits') ||
                            (widget.category == 'Mobilier') ||
                            (widget.category == 'Numérique') ||
                            (widget.category == 'Electroménager') ||
                            (widget.category == 'Objets')))
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7q5vatf8' /* Type */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.optionItemValueController ??=
                                            FormFieldController<String>(null),
                                    options: widget.actionRef != null
                                        ? (GetOptionsCall.options(
                                            (_model.loadAction?.jsonBody ?? ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(): (GetOptionsCall.options(
                                            (_model.actionChangeOptions
                                                    ?.jsonBody ??
                                                ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(),
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.optionItemValue = val);
                                      await action_blocks.updateFEandCOE(
                                        context,
                                        category: widget.category,
                                        action: _model.actionValue,
                                        option: _model.optionItemValue,
                                        count: _model.quantityItemValue,
                                        multiplicator: 1,
                                        divider: functions
                                            .depreciationDaysCalculator(
                                                _model.yearPurchaseValue!,
                                                _model
                                                    .yearPreviousPurchaseValue,
                                                5)[0],
                                        shared: '1',
                                      );
                                    },
                                    width: 180.0,
                                    height: 40.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '4qnitu8l' /* Sélectionnez */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsets.all(10.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'xk78vqlb' /* Quantité */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Container(
                                    width: 130.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        size: 16.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        size: 16.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      count: _model.quantityItemValue ??= 1,
                                      updateCount: (count) async {
                                        setState(() =>
                                            _model.quantityItemValue = count);
                                        setState(() {
                                          FFAppState().actionCo2e =
                                              functions.calculateActionCO2e(
                                                  _model.quantityItemValue,
                                                  1,
                                                  functions.depreciationDaysCalculator(
                                                      _model.yearPurchaseValue!,
                                                      _model
                                                          .yearPreviousPurchaseValue,
                                                      5)[0],
                                                  '1',
                                                  FFAppState().actionFE);
                                        });
                                      },
                                      stepSize: 1,
                                      minimum: 1,
                                      maximum: 20,
                                      contentPadding: const EdgeInsets.all(10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'vxejlurr' /* Année d'achat */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.yearPurchaseValueController ??=
                                          FormFieldController<String>(
                                    _model.yearPurchaseValue ??=
                                        FFLocalizations.of(context).getText(
                                      'qbxmonfj' /* 2023 */,
                                    ),
                                  ),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      '6p8djvpd' /* 2024 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'gdz3mw7n' /* 2023 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'pgziao4p' /* 2022 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '38mgbquq' /* 2021 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'n3fjb0os' /* 2020 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'wxrwx697' /* 2019 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'ikdx9qon' /* 2018 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'dt4egfak' /* 2017 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'nwkr2n5d' /* 2016 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'vse2o31x' /* 2015 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '52ukpbon' /* 2014 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '66txgs91' /* 2013 */,
                                    )
                                  ],
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.yearPurchaseValue = val);
                                    setState(() {
                                      FFAppState().actionCo2e =
                                          functions.calculateActionCO2e(
                                              _model.quantityItemValue,
                                              1,
                                              functions.depreciationDaysCalculator(
                                                  _model.yearPurchaseValue!,
                                                  _model
                                                      .yearPreviousPurchaseValue,
                                                  5)[0],
                                              '1',
                                              FFAppState().actionFE);
                                    });
                                  },
                                  width: 100.0,
                                  height: 40.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  hintText: FFLocalizations.of(context).getText(
                                    '2dhp7sk3' /* Please select... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsets.all(10.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '1hwkra8l' /* Achat neuf */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Switch.adaptive(
                                  value: _model.newBuyValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.newBuyValue = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ],
                            ),
                            if (!_model.newBuyValue!)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ohw0nf13' /* Année de fabrication */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model
                                            .yearPreviousPurchaseValueController ??=
                                        FormFieldController<String>(
                                      _model.yearPreviousPurchaseValue ??=
                                          FFLocalizations.of(context).getText(
                                        '15rf1l8y' /* 2023 */,
                                      ),
                                    ),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        '9ft96uwq' /* 2024 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'titumonx' /* 2023 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'gpl9vlel' /* 2022 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vh8joni1' /* 2021 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '9yso4xf5' /* 2020 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'lt6gitjl' /* 2019 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'yo7mwwsu' /* 2018 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'btxn1zgw' /* 2017 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'gwswjlm4' /* 2016 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'n99qq044' /* 2015 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '27t7q7jp' /* 2014 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'w34zxxuc' /* 2013 */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      setState(() => _model
                                          .yearPreviousPurchaseValue = val);
                                      setState(() {
                                        FFAppState().actionCo2e =
                                            functions.calculateActionCO2e(
                                                _model.quantityItemValue,
                                                1,
                                                functions
                                                    .depreciationDaysCalculator(
                                                        _model
                                                            .yearPurchaseValue!,
                                                        _model
                                                            .yearPreviousPurchaseValue,
                                                        5)[0],
                                                '1',
                                                FFAppState().actionFE);
                                      });
                                    },
                                    width: 100.0,
                                    height: 40.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '2yfefqpp' /* Please select... */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsets.all(10.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                            Container(
                              width: 300.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'qmifyg1m' /* Ce type d'object émet un total... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          functions.pSFE(FFAppState().actionFE),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'iaidmvz3' /*  de co2e, amorti sur une durée... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ehajmgsv' /* 5 ans. */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9lme7jzz' /* 

Vous allez ajouter une émiss... */
                                          ,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          functions.pS(FFAppState().actionCo2e),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'pe0o4akd' /*  de co2e par jour pendant  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      TextSpan(
                                        text: functions
                                            .depreciationDaysCalculator(
                                                _model.yearPurchaseValue!,
                                                _model
                                                    .yearPreviousPurchaseValue,
                                                5)[1]
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9quk3a68' /*  ans. */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: FFAppState().actionCo2e == 0
                                    ? null
                                    : () async {
                                        if (widget.actionRef != null) {
                                          await widget.actionRef!
                                              .update(createActionsRecordData(
                                            action: _model.actionValue,
                                            option: _model.optionItemValue,
                                            co2e: FFAppState().actionCo2e,
                                            count: _model.quantityItemValue,
                                            emissionFactor:
                                                FFAppState().actionFE,
                                            isPeriodic: true,
                                            newPurchase: _model.newBuyValue,
                                            yearPurchase:
                                                _model.yearPurchaseValue,
                                            yearPreviousPurchase: _model
                                                .yearPreviousPurchaseValue,
                                            yearEndPurchase: functions
                                                .depreciationDaysCalculator(
                                                    _model.yearPurchaseValue!,
                                                    _model
                                                        .yearPreviousPurchaseValue,
                                                    5)[1]
                                                .toString(),
                                          ));
                                        } else {
                                          var actionsRecordReference =
                                              ActionsRecord.collection.doc();
                                          await actionsRecordReference
                                              .set(createActionsRecordData(
                                            uid: currentUserUid,
                                            createdTime:
                                                dateTimeFromSecondsSinceEpoch(
                                                    getCurrentTimestamp
                                                        .secondsSinceEpoch),
                                            country: 'FR',
                                            category: widget.category,
                                            action: _model.actionValue,
                                            option: _model.optionItemValue,
                                            co2e: FFAppState().actionCo2e,
                                            count: _model.quantityItemValue,
                                            emissionFactor:
                                                FFAppState().actionFE,
                                            isPeriodic: true,
                                            newPurchase: _model.newBuyValue,
                                            yearPurchase:
                                                _model.yearPurchaseValue,
                                            yearPreviousPurchase: _model
                                                .yearPreviousPurchaseValue,
                                            yearEndPurchase: functions
                                                .depreciationDaysCalculator(
                                                    _model.yearPurchaseValue!,
                                                    _model
                                                        .yearPreviousPurchaseValue,
                                                    5)[1]
                                                .toString(),
                                          ));
                                          _model.addActionItem =
                                              ActionsRecord.getDocumentFromData(
                                                  createActionsRecordData(
                                                    uid: currentUserUid,
                                                    createdTime:
                                                        dateTimeFromSecondsSinceEpoch(
                                                            getCurrentTimestamp
                                                                .secondsSinceEpoch),
                                                    country: 'FR',
                                                    category: widget.category,
                                                    action: _model.actionValue,
                                                    option:
                                                        _model.optionItemValue,
                                                    co2e:
                                                        FFAppState().actionCo2e,
                                                    count: _model
                                                        .quantityItemValue,
                                                    emissionFactor:
                                                        FFAppState().actionFE,
                                                    isPeriodic: true,
                                                    newPurchase:
                                                        _model.newBuyValue,
                                                    yearPurchase: _model
                                                        .yearPurchaseValue,
                                                    yearPreviousPurchase: _model
                                                        .yearPreviousPurchaseValue,
                                                    yearEndPurchase: functions
                                                        .depreciationDaysCalculator(
                                                            _model
                                                                .yearPurchaseValue!,
                                                            _model
                                                                .yearPreviousPurchaseValue,
                                                            5)[1]
                                                        .toString(),
                                                  ),
                                                  actionsRecordReference);
                                        }

                                        context.pushNamed(
                                          'actions',
                                          queryParameters: {
                                            'category': serializeParam(
                                              widget.category,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        setState(() {});
                                      },
                                text:
                                    'Ajouter ${functions.pS(FFAppState().actionCo2e)} / jour',
                                options: FFButtonOptions(
                                  width: 290.0,
                                  height: 40.0,
                                  padding: const EdgeInsets.all(0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle:
                                      FlutterFlowTheme.of(context).titleSmall,
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                  disabledColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
              Container(
                width: 300.0,
                height: 70.0,
                decoration: const BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
