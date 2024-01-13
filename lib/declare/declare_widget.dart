import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
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
      // Reset
      setState(() {
        FFAppState().actionCo2e = 0;
        FFAppState().actionFE = 0;
        FFAppState().actionHint = ' ';
        FFAppState().actionAmortization = 0;
        FFAppState().actionUnit = ' ';
        FFAppState().actionAmortizationLeft = 0;
      });
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
      if (widget.category == 'Repas') {
        _model.getStarters = await GetOptionsCall.call(
          category: 'Repas',
          action: 'Entrée',
        );
      }
      if (widget.actionRef != null) {
        _model.actionFields =
            await ActionsRecord.getDocumentOnce(widget.actionRef!);
        // Action
        setState(() {
          _model.actionValueController?.value = _model.actionFields!.action;
        });
        // get options
        _model.getOptionsResult = await GetOptionsCall.call(
          category: _model.actionFields?.category,
          action: _model.actionFields?.action,
        );
        if (widget.category == 'Logement') {
          // option
          setState(() {
            _model.optionLodgingValueController?.value =
                _model.actionFields!.option;
          });
          // volume
          setState(() {
            _model.volumeLodgingController?.text =
                _model.actionFields!.count.toString();
          });
          // sharing
          setState(() {
            _model.sharingLodgingValue = _model.actionFields!.peopleSharing;
          });
        }
        if ((widget.category == 'Habits') ||
            (widget.category == 'Mobilier') ||
            (widget.category == 'Electroménager') ||
            (widget.category == 'Numérique') ||
            (widget.category == 'Objets')) {
          // optionItem
          setState(() {
            _model.optionItemValueController?.value =
                _model.actionFields!.option;
          });
          // volumeItem
          setState(() {
            _model.volumeItemController?.text =
                _model.actionFields!.count.toString();
          });
          // yearPurchase
          setState(() {
            _model.yearPurchaseValueController?.value =
                _model.actionFields!.yearPurchase;
          });
          // newBuy
          setState(() {
            _model.newBuyValue = _model.actionFields!.newPurchase;
          });
        }
        if (widget.category == 'Trajets') {
          // option
          setState(() {
            _model.optionTrajetsValueController?.value =
                _model.actionFields!.option;
          });
          // volume
          setState(() {
            _model.volumeTrajetsController?.text =
                _model.actionFields!.count.toString();
          });
          // roundtrip
          setState(() {
            _model.roundtripValue = _model.actionFields!.roundtrip;
          });
          // isperiodic
          setState(() {
            _model.isperiodicValue = _model.actionFields!.isPeriodic;
          });
          // periodicity
          setState(() {
            _model.periodicityValueController?.value =
                _model.actionFields!.periodicity;
          });
          // passengers
          setState(() {
            _model.passengersValue = _model.actionFields!.peopleSharing;
          });
        }
        await Future.delayed(const Duration(milliseconds: 2000));
        // co2e & FE
        setState(() {
          FFAppState().actionCo2e = _model.actionFields!.co2e;
          FFAppState().actionFE = _model.actionFields!.emissionFactor;
        });
      } else {
        // Reset CO2e & FE
        setState(() {
          FFAppState().actionCo2e = 0;
          FFAppState().actionFE = 0;
        });
      }
    });

    _model.volumeTrajetsController ??= TextEditingController();
    _model.volumeTrajetsFocusNode ??= FocusNode();
    _model.volumeTrajetsFocusNode!.addListener(() => setState(() {}));
    _model.volumeLodgingController ??= TextEditingController();
    _model.volumeLodgingFocusNode ??= FocusNode();
    _model.volumeLodgingFocusNode!.addListener(() => setState(() {}));
    _model.volumeItemController ??= TextEditingController();
    _model.volumeItemFocusNode ??= FocusNode();
    _model.volumeItemFocusNode!.addListener(() => setState(() {}));
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
                  child: const HeadWidget(),
                ),
              ),
              wrapWithModel(
                model: _model.titleBackModel,
                updateCallback: () => setState(() {}),
                child: TitleBackWidget(
                  title: valueOrDefault<String>(
                    widget.category,
                    'Catégorie',
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
                    FlutterFlowDropDown<String>(
                      controller: _model.actionValueController ??=
                          FormFieldController<String>(null),
                      options: GetActionsCall.actions(
                        (_model.getActionsResult?.jsonBody ?? ''),
                      )!
                          .map((e) => e.toString())
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
                      hintText: 'Sélectionnez une action',
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
                      isOverButton: true,
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
                            FlutterFlowDropDown<String>(
                              controller:
                                  _model.optionTrajetsValueController ??=
                                      FormFieldController<String>(null),
                              options: widget.actionRef != null
                                  ? GetOptionsCall.options(
                                      (_model.getOptionsResult?.jsonBody ?? ''),
                                    )!
                                  : GetOptionsCall.options(
                                      (_model.actionChangeOptions?.jsonBody ??
                                          ''),
                                    )!,
                              onChanged: (val) async {
                                setState(() => _model.optionTrajetsValue = val);
                                await action_blocks.updateFEandCOE(
                                  context,
                                  category: widget.category,
                                  action: _model.actionValue,
                                  option: _model.optionTrajetsValue,
                                  count: int.tryParse(
                                      _model.volumeTrajetsController.text),
                                  multiplicator: _model.roundtripValue! ? 2 : 1,
                                  amortization: FFAppState().actionAmortization,
                                  shared: _model.passengersValue?.toString(),
                                );
                              },
                              width: 300.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Précisez une option',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
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
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.query_stats,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Distance',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        FFAppState().actionHint,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50.0,
                                          child: TextFormField(
                                            controller:
                                                _model.volumeTrajetsController,
                                            focusNode:
                                                _model.volumeTrajetsFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.volumeTrajetsController',
                                              const Duration(milliseconds: 0),
                                              () async {
                                                setState(() {
                                                  FFAppState().actionCo2e =
                                                      functions.calculateActionCO2e(
                                                          int.tryParse(_model
                                                              .volumeTrajetsController
                                                              .text),
                                                          _model.roundtripValue!
                                                              ? 2
                                                              : 1,
                                                          0,
                                                          _model.passengersValue
                                                              ?.toString(),
                                                          FFAppState()
                                                              .actionFE);
                                                });
                                              },
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Ajouter ',
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            validator: _model
                                                .volumeTrajetsControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[a-zA-Z0-9]'))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFAppState().actionUnit,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.info_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          'Options',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if ((_model.actionValue == 'Voiture') ||
                                      (_model.actionValue == 'Moto') ||
                                      (_model.actionValue == 'Scooter'))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Passagers',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Container(
                                              width: 130.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => FaIcon(
                                                  FontAwesomeIcons.minus,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 16.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 16.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                                count: _model
                                                    .passengersValue ??= 1,
                                                updateCount: (count) async {
                                                  setState(() => _model
                                                      .passengersValue = count);
                                                  setState(() {
                                                    FFAppState().actionCo2e =
                                                        functions.calculateActionCO2e(
                                                            int.tryParse(_model
                                                                .volumeTrajetsController
                                                                .text),
                                                            _model.roundtripValue!
                                                                ? 2
                                                                : 1,
                                                            0,
                                                            _model
                                                                .passengersValue
                                                                ?.toString(),
                                                            FFAppState()
                                                                .actionFE);
                                                  });
                                                },
                                                stepSize: 1,
                                                minimum: 1,
                                                maximum: 10,
                                                contentPadding:
                                                    const EdgeInsets.all(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Aller-retour',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      Switch.adaptive(
                                        value: _model.roundtripValue ??= false,
                                        onChanged: (newValue) async {
                                          setState(() => _model.roundtripValue =
                                              newValue);
                                          if (newValue) {
                                            setState(() {
                                              FFAppState().actionCo2e =
                                                  functions.calculateActionCO2e(
                                                      int.tryParse(_model
                                                          .volumeTrajetsController
                                                          .text),
                                                      _model.roundtripValue!
                                                          ? 2
                                                          : 1,
                                                      0,
                                                      _model.passengersValue
                                                          ?.toString(),
                                                      FFAppState().actionFE);
                                            });
                                          } else {
                                            setState(() {
                                              FFAppState().actionCo2e =
                                                  functions.calculateActionCO2e(
                                                      int.tryParse(_model
                                                          .volumeTrajetsController
                                                          .text),
                                                      _model.roundtripValue!
                                                          ? 2
                                                          : 1,
                                                      0,
                                                      _model.passengersValue
                                                          ?.toString(),
                                                      FFAppState().actionFE);
                                            });
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Répétition',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      Switch.adaptive(
                                        value: _model.isperiodicValue ??= false,
                                        onChanged: (newValue) async {
                                          setState(() => _model
                                              .isperiodicValue = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FlutterFlowChoiceChips(
                                            options: const [
                                              ChipData('L'),
                                              ChipData('Ma'),
                                              ChipData('Me'),
                                              ChipData('J'),
                                              ChipData('V'),
                                              ChipData('S'),
                                              ChipData('D')
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.periodicityValues = val),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
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
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
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
                                                _model.periodicityValues !=
                                                    null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .periodicityValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              _model.actionFields?.periodicity,
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
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
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            FFIcons.kleaf,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          'Emissions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Cette action émet ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              functions.pS(
                                                  functions.calculateActionCO2e(
                                                      int.tryParse(_model
                                                          .volumeTrajetsController
                                                          .text),
                                                      _model.roundtripValue!
                                                          ? 2
                                                          : 1,
                                                      0,
                                                      _model.passengersValue
                                                          ?.toString(),
                                                      FFAppState().actionFE)),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                          TextSpan(
                                            text: ' de co2e. \n',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    if ((_model.actionValue != null &&
                            _model.actionValue != '') &&
                        (widget.category == 'Logement'))
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller:
                                  _model.optionLodgingValueController ??=
                                      FormFieldController<String>(null),
                              options: widget.actionRef != null
                                  ? GetOptionsCall.options(
                                      (_model.getOptionsResult?.jsonBody ?? ''),
                                    )!
                                  : GetOptionsCall.options(
                                      (_model.actionChangeOptions?.jsonBody ??
                                          ''),
                                    )!,
                              onChanged: (val) async {
                                setState(() => _model.optionLodgingValue = val);
                                await action_blocks.updateFEandCOE(
                                  context,
                                  category: widget.category,
                                  action: _model.actionValue,
                                  option: _model.optionLodgingValue,
                                  count: int.tryParse(
                                      _model.volumeLodgingController.text),
                                  multiplicator: 1,
                                  amortization: FFAppState().actionAmortization,
                                  shared:
                                      _model.sharingLodgingValue?.toString(),
                                );
                              },
                              width: 300.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Précisez une option',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
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
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.query_stats,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Consommation',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        FFAppState().actionHint,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50.0,
                                          child: TextFormField(
                                            controller:
                                                _model.volumeLodgingController,
                                            focusNode:
                                                _model.volumeLodgingFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.volumeLodgingController',
                                              const Duration(milliseconds: 0),
                                              () async {
                                                FFAppState().actionCo2e =
                                                    functions.calculateActionCO2e(
                                                        int.tryParse(_model
                                                            .volumeLodgingController
                                                            .text),
                                                        1,
                                                        FFAppState()
                                                            .actionAmortization,
                                                        _model
                                                            .sharingLodgingValue
                                                            ?.toString(),
                                                        FFAppState().actionFE);
                                              },
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Ajouter ',
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                            textAlign: TextAlign.end,
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            validator: _model
                                                .volumeLodgingControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFAppState().actionUnit,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.info_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          'Options',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Taille du foyer',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Container(
                                            width: 130.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: FlutterFlowCountController(
                                              decrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.minus,
                                                color: enabled
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                size: 16.0,
                                              ),
                                              incrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.plus,
                                                color: enabled
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                size: 16.0,
                                              ),
                                              countBuilder: (count) => Text(
                                                count.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                              count: _model
                                                  .sharingLodgingValue ??= 1,
                                              updateCount: (count) async {
                                                setState(() =>
                                                    _model.sharingLodgingValue =
                                                        count);
                                                FFAppState().actionCo2e =
                                                    functions.calculateActionCO2e(
                                                        int.tryParse(_model
                                                            .volumeLodgingController
                                                            .text),
                                                        1,
                                                        FFAppState()
                                                            .actionAmortization,
                                                        _model
                                                            .sharingLodgingValue
                                                            ?.toString(),
                                                        FFAppState().actionFE);
                                              },
                                              stepSize: 1,
                                              minimum: 1,
                                              maximum: 10,
                                              contentPadding:
                                                  const EdgeInsets.all(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            FFIcons.kleaf,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          'Emissions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Cette action émet ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              functions
                                                  .pS(FFAppState().actionFE),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                          TextSpan(
                                            text: ' de co2e amortie sur \n',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          TextSpan(
                                            text: FFAppState()
                                                .actionAmortization
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                          const TextSpan(
                                            text: ' ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: FFAppState()
                                                        .actionAmortization ==
                                                    1
                                                ? 'an'
                                                : 'ans',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          TextSpan(
                                            text: '. Cela correspond à ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              functions
                                                  .pS(FFAppState().actionCo2e),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                          TextSpan(
                                            text: ' de co2e par jour.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
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
                            FlutterFlowDropDown<String>(
                              controller: _model.optionItemValueController ??=
                                  FormFieldController<String>(null),
                              options: widget.actionRef != null
                                  ? GetOptionsCall.options(
                                      (_model.getOptionsResult?.jsonBody ?? ''),
                                    )!
                                  : GetOptionsCall.options(
                                      (_model.actionChangeOptions?.jsonBody ??
                                          ''),
                                    )!,
                              onChanged: (val) async {
                                setState(() => _model.optionItemValue = val);
                                await action_blocks.updateFEandCOE(
                                  context,
                                  category: widget.category,
                                  action: _model.actionValue,
                                  option: _model.optionItemValue,
                                  count: int.tryParse(
                                      _model.volumeItemController.text),
                                  multiplicator: 1,
                                  amortization: FFAppState().actionAmortization,
                                );
                              },
                              width: 300.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Précisez une option',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
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
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.query_stats,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Quantité',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        FFAppState().actionHint,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50.0,
                                          child: TextFormField(
                                            controller:
                                                _model.volumeItemController,
                                            focusNode:
                                                _model.volumeItemFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.volumeItemController',
                                              const Duration(milliseconds: 0),
                                              () async {
                                                FFAppState().actionCo2e =
                                                    functions.calculateActionCO2e(
                                                        int.tryParse(_model
                                                            .volumeItemController
                                                            .text),
                                                        1,
                                                        FFAppState()
                                                            .actionAmortization,
                                                        '1',
                                                        FFAppState().actionFE);
                                              },
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Ajouter ',
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            validator: _model
                                                .volumeItemControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_model.actionValue != 'Cigarettes')
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
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Options',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Achat neuf',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          Switch.adaptive(
                                            value: _model.newBuyValue ??= true,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .newBuyValue = newValue);
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _model.newBuyValue!
                                                ? 'Année d\'achat'
                                                : 'Année d\'achat neuf',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .yearPurchaseValueController ??=
                                                FormFieldController<String>(
                                              _model.yearPurchaseValue ??=
                                                  '2024',
                                            ),
                                            options: const [
                                              '2024',
                                              '2023',
                                              '2022',
                                              '2021',
                                              '2020',
                                              '2019',
                                              '2018',
                                              '2017',
                                              '2016',
                                              '2015',
                                              '2014',
                                              '2013'
                                            ],
                                            onChanged: (val) async {
                                              setState(() => _model
                                                  .yearPurchaseValue = val);
                                              setState(() {
                                                FFAppState()
                                                        .actionAmortizationLeft =
                                                    functions.itemEndYear(
                                                        _model
                                                            .yearPurchaseValue!,
                                                        FFAppState()
                                                            .actionAmortization)[0];
                                              });
                                              setState(() {
                                                FFAppState().actionCo2e =
                                                    functions.calculateActionCO2e(
                                                        int.tryParse(_model
                                                            .volumeItemController
                                                            .text),
                                                        1,
                                                        FFAppState()
                                                            .actionAmortization,
                                                        '1',
                                                        FFAppState().actionFE);
                                              });
                                            },
                                            width: 100.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            hintText: 'Please select...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
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
                                    ),
                                  ],
                                ),
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
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            FFIcons.kleaf,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          'Emissions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().actionAmortizationLeft >= 1)
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Les émissions par unité sont de ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                functions
                                                    .pS(FFAppState().actionFE),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: ' de co2e amortie sur ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                  .actionAmortization
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            const TextSpan(
                                              text: ' ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                          .actionAmortization ==
                                                      1
                                                  ? 'an'
                                                  : 'ans',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            TextSpan(
                                              text: '. \nVous ajoutez ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                functions.pS(
                                                    FFAppState().actionCo2e),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' de co2e par jour sur une durée restante de  ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                  .actionAmortizationLeft
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            const TextSpan(
                                              text: ' ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                          .actionAmortizationLeft ==
                                                      1
                                                  ? 'an'
                                                  : 'ans',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            const TextSpan(
                                              text: '.',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  if (FFAppState().actionAmortizationLeft <= 0)
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Bonne nouvelle, le délai d\'amortissement de cet objet est ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            TextSpan(
                                              text: 'dépassé.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' Inutile de l\'ajouter. \n\n',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            TextSpan(
                                              text:
                                                  'Repoussez au maximum votre prochain achat.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    if (widget.category == 'Repas')
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
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
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              FFIcons.ktoolsKitchen,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Entrée',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: FutureBuilder<
                                                List<GetOptionsRow>>(
                                              future: SQLiteManager.instance
                                                  .getOptions(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final starterchipsGetOptionsRowList =
                                                    snapshot.data!;
                                                return FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Test',
                                                        Icons.train_outlined),
                                                    ChipData('test2')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .starterchipsValue =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 4.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  chipSpacing: 12.0,
                                                  rowSpacing: 12.0,
                                                  multiselect: false,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  controller: _model
                                                          .starterchipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 250.0,
                                      decoration: const BoxDecoration(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    if (widget.actionRef != null)
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Si la modification concerne uniquement la journée, sélectionnez l\'action ',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          TextSpan(
                                            text: 'ponctuelle',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                '. Sinon, sélectionnez l\'action ',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          TextSpan(
                                            text: 'récurrente',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          TextSpan(
                                            text: '.',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_model.actionValue != null && _model.actionValue != '')
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!(((widget.category == 'Habits') ||
                                    (widget.category == 'Mobilier') ||
                                    (widget.category == 'Electroménager') ||
                                    (widget.category == 'Numérique') ||
                                    (widget.category == 'Objets')) &&
                                (FFAppState().actionAmortizationLeft <= 0)))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: (FFAppState().actionCo2e == 0)
                                      ? null
                                      : () async {
                                          if (widget.actionRef != null) {
                                            if (widget.category == 'Logement') {
                                              // Lodging

                                              await widget.actionRef!.update(
                                                  createActionsRecordData(
                                                action: _model.actionValue,
                                                option:
                                                    _model.optionLodgingValue,
                                                co2e: FFAppState().actionCo2e,
                                                count: int.tryParse(_model
                                                    .volumeLodgingController
                                                    .text),
                                                emissionFactor:
                                                    FFAppState().actionFE,
                                                peopleSharing:
                                                    _model.sharingLodgingValue,
                                              ));
                                            }
                                            if ((widget.category == 'Habits') ||
                                                (widget.category ==
                                                    'Mobilier') ||
                                                (widget.category ==
                                                    'Electroménager') ||
                                                (widget.category ==
                                                    'Numérique') ||
                                                (widget.category == 'Objets')) {
                                              // Habits

                                              await widget.actionRef!.update(
                                                  createActionsRecordData(
                                                action: _model.actionValue,
                                                option: _model.optionItemValue,
                                                co2e: FFAppState().actionCo2e,
                                                count: int.tryParse(_model
                                                    .volumeItemController.text),
                                                emissionFactor:
                                                    FFAppState().actionFE,
                                                newPurchase: _model.newBuyValue,
                                                yearPurchase:
                                                    _model.yearPurchaseValue,
                                                yearEndPuchase:
                                                    functions.itemEndYear(
                                                        _model
                                                            .yearPurchaseValue!,
                                                        FFAppState()
                                                            .actionAmortizationLeft)[1],
                                              ));
                                            }
                                            if (widget.category == 'Trajets') {
                                              // Lodging

                                              await widget.actionRef!.update({
                                                ...createActionsRecordData(
                                                  action: _model.actionValue,
                                                  option:
                                                      _model.optionTrajetsValue,
                                                  co2e: FFAppState().actionCo2e,
                                                  count: int.tryParse(_model
                                                      .volumeTrajetsController
                                                      .text),
                                                  emissionFactor:
                                                      FFAppState().actionFE,
                                                  peopleSharing:
                                                      _model.passengersValue,
                                                  isPeriodic:
                                                      _model.isperiodicValue,
                                                  roundtrip:
                                                      _model.roundtripValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'periodicity': _model
                                                        .periodicityValues,
                                                  },
                                                ),
                                              });
                                            }
                                          } else {
                                            if (widget.category == 'Logement') {
                                              // Lodging

                                              var actionsRecordReference1 =
                                                  ActionsRecord.collection
                                                      .doc();
                                              await actionsRecordReference1
                                                  .set(createActionsRecordData(
                                                uid: currentUserUid,
                                                createdTime:
                                                    dateTimeFromSecondsSinceEpoch(
                                                        getCurrentTimestamp
                                                            .secondsSinceEpoch),
                                                country: 'FR',
                                                category: widget.category,
                                                action: _model.actionValue,
                                                option:
                                                    _model.optionLodgingValue,
                                                co2e: FFAppState().actionCo2e,
                                                count: int.tryParse(_model
                                                    .volumeLodgingController
                                                    .text),
                                                emissionFactor:
                                                    FFAppState().actionFE,
                                                peopleSharing:
                                                    _model.sharingLodgingValue,
                                                isPeriodic: true,
                                              ));
                                              _model.addActionEnergy =
                                                  ActionsRecord.getDocumentFromData(
                                                      createActionsRecordData(
                                                        uid: currentUserUid,
                                                        createdTime:
                                                            dateTimeFromSecondsSinceEpoch(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch),
                                                        country: 'FR',
                                                        category:
                                                            widget.category,
                                                        action:
                                                            _model.actionValue,
                                                        option: _model
                                                            .optionLodgingValue,
                                                        co2e: FFAppState()
                                                            .actionCo2e,
                                                        count: int.tryParse(_model
                                                            .volumeLodgingController
                                                            .text),
                                                        emissionFactor:
                                                            FFAppState()
                                                                .actionFE,
                                                        peopleSharing: _model
                                                            .sharingLodgingValue,
                                                        isPeriodic: true,
                                                      ),
                                                      actionsRecordReference1);
                                            }
                                            if ((widget.category == 'Habits') ||
                                                (widget.category ==
                                                    'Mobilier') ||
                                                (widget.category ==
                                                    'Electroménager') ||
                                                (widget.category ==
                                                    'Numérique') ||
                                                (widget.category == 'Objets')) {
                                              // Lodging

                                              var actionsRecordReference2 =
                                                  ActionsRecord.collection
                                                      .doc();
                                              await actionsRecordReference2
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
                                                count: int.tryParse(_model
                                                    .volumeItemController.text),
                                                emissionFactor:
                                                    FFAppState().actionFE,
                                                isPeriodic: true,
                                                newPurchase: _model.newBuyValue,
                                                yearPurchase:
                                                    _model.yearPurchaseValue,
                                                yearEndPuchase:
                                                    functions.itemEndYear(
                                                        _model
                                                            .yearPurchaseValue!,
                                                        FFAppState()
                                                            .actionAmortizationLeft)[1],
                                              ));
                                              _model.addActionClothes =
                                                  ActionsRecord.getDocumentFromData(
                                                      createActionsRecordData(
                                                        uid: currentUserUid,
                                                        createdTime:
                                                            dateTimeFromSecondsSinceEpoch(
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch),
                                                        country: 'FR',
                                                        category:
                                                            widget.category,
                                                        action:
                                                            _model.actionValue,
                                                        option: _model
                                                            .optionItemValue,
                                                        co2e: FFAppState()
                                                            .actionCo2e,
                                                        count: int.tryParse(_model
                                                            .volumeItemController
                                                            .text),
                                                        emissionFactor:
                                                            FFAppState()
                                                                .actionFE,
                                                        isPeriodic: true,
                                                        newPurchase:
                                                            _model.newBuyValue,
                                                        yearPurchase: _model
                                                            .yearPurchaseValue,
                                                        yearEndPuchase: functions
                                                            .itemEndYear(
                                                                _model
                                                                    .yearPurchaseValue!,
                                                                FFAppState()
                                                                    .actionAmortizationLeft)[1],
                                                      ),
                                                      actionsRecordReference2);
                                            }
                                            if (widget.category == 'Trajets') {
                                              // Lodging

                                              var actionsRecordReference3 =
                                                  ActionsRecord.collection
                                                      .doc();
                                              await actionsRecordReference3
                                                  .set({
                                                ...createActionsRecordData(
                                                  uid: currentUserUid,
                                                  createdTime:
                                                      dateTimeFromSecondsSinceEpoch(
                                                          getCurrentTimestamp
                                                              .secondsSinceEpoch),
                                                  country: 'FR',
                                                  category: widget.category,
                                                  action: _model.actionValue,
                                                  option:
                                                      _model.optionTrajetsValue,
                                                  co2e: FFAppState().actionCo2e,
                                                  count: int.tryParse(_model
                                                      .volumeTrajetsController
                                                      .text),
                                                  emissionFactor:
                                                      FFAppState().actionFE,
                                                  peopleSharing:
                                                      valueOrDefault<int>(
                                                    _model.passengersValue,
                                                    1,
                                                  ),
                                                  isPeriodic:
                                                      _model.isperiodicValue,
                                                  roundtrip:
                                                      _model.roundtripValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'periodicity': _model
                                                        .periodicityValues,
                                                  },
                                                ),
                                              });
                                              _model.addActionTrajets =
                                                  ActionsRecord
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
                                                  option:
                                                      _model.optionTrajetsValue,
                                                  co2e: FFAppState().actionCo2e,
                                                  count: int.tryParse(_model
                                                      .volumeTrajetsController
                                                      .text),
                                                  emissionFactor:
                                                      FFAppState().actionFE,
                                                  peopleSharing:
                                                      valueOrDefault<int>(
                                                    _model.passengersValue,
                                                    1,
                                                  ),
                                                  isPeriodic:
                                                      _model.isperiodicValue,
                                                  roundtrip:
                                                      _model.roundtripValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'periodicity': _model
                                                        .periodicityValues,
                                                  },
                                                ),
                                              }, actionsRecordReference3);
                                            }
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
                                      '${widget.actionRef != null ? 'Modifier ' : 'Ajouter '}${valueOrDefault<String>(
                                    functions.pS(FFAppState().actionCo2e),
                                    '0',
                                  )}${(widget.category == 'Habits') || (widget.category == 'Mobilier') || (widget.category == 'Electroménager') || (widget.category == 'Numérique') || (widget.category == 'Objets') || (widget.category == 'Logement') ? ' / jour' : ' '}',
                                  options: FFButtonOptions(
                                    width: 290.0,
                                    height: 40.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                            if (((widget.category == 'Habits') ||
                                    (widget.category == 'Mobilier') ||
                                    (widget.category == 'Electroménager') ||
                                    (widget.category == 'Numérique')) &&
                                (FFAppState().actionAmortizationLeft <= 0))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: (FFAppState().actionCo2e == 0)
                                      ? null
                                      : () async {
                                          context.pushNamed(
                                            'actions',
                                            queryParameters: {
                                              'category': serializeParam(
                                                widget.category,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                  text: 'Retour',
                                  options: FFButtonOptions(
                                    width: 290.0,
                                    height: 40.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                            if (widget.actionRef != null)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.actionRef!.delete();

                                    context.pushNamed(
                                      'actions',
                                      queryParameters: {
                                        'category': serializeParam(
                                          widget.category,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    'Supprimer',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                          ],
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
