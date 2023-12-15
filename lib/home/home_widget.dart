import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/home_category_widget.dart';
import '/components/title_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().lastConnectionDay =
            (currentUserDocument?.connectionHistory.toList() ?? []).last;
      });
      if (dateTimeFormat(
            'd/M/y',
            FFAppState().lastConnectionDay,
            locale: FFLocalizations.of(context).languageCode,
          ) !=
          dateTimeFormat(
            'd/M/y',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )) {
        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'connection_history':
                  FieldValue.arrayUnion([getCurrentTimestamp]),
            },
          ),
        });
      }
    });

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

    return StreamBuilder<List<StatsRecord>>(
      stream: queryStatsRecord(
        queryBuilder: (statsRecord) => statsRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
            ),
          );
        }
        List<StatsRecord> homeStatsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homeStatsRecord =
            homeStatsRecordList.isNotEmpty ? homeStatsRecordList.first : null;
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
                  wrapWithModel(
                    model: _model.titleModel,
                    updateCallback: () => setState(() {}),
                    child: const TitleWidget(
                      title: 'Tableau de bord',
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
                        FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Journée'),
                            ChipData('Semaine'),
                            ChipData('Mois')
                          ],
                          onChanged: (val) => setState(
                              () => _model.choiceChipsValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            ['Journée'],
                          ),
                          wrapped: true,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        CircularPercentIndicator(
                                      percent: functions.pRatio(
                                          homeStatsRecord!.dayTotal,
                                          valueOrDefault(
                                              currentUserDocument?.target,
                                              0.0))!,
                                      radius: 40.0,
                                      lineWidth: 10.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      startAngle: 270.0,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        functions.pS(homeStatsRecord?.dayTotal),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'co2e ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('co2e ?'),
                                                  content: const Text(
                                                      'L’équivalent CO2, appelé aussi CO2e ou COeq, est une unité créée par le GIEC (groupe intergouvernemental d’experts sur l’évolution du climat). Il désigne les gaz à effet de serre (ou GES). Les principaux GES présents dans l\'atmosphère de la Terre sont la vapeur d\'eau, le dioxyde de carbone (CO2), le méthane (CH4), l\'oxyde nitreux (N2O) et l\'ozone.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.info_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 180.0,
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Objectif : ',
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
                                          text: valueOrDefault<String>(
                                            functions.pTargetDay(valueOrDefault(
                                                currentUserDocument?.target,
                                                0.0)),
                                            '5.5',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                        TextSpan(
                                          text: '\nActions : ',
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
                                          text: '8',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                        TextSpan(
                                          text: '\nRestant : ',
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
                                          text: '4.2 kg',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.transportModel,
                                updateCallback: () => setState(() {}),
                                child: HomeCategoryWidget(
                                  icon: Icon(
                                    Icons.directions_walk,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  co2e: homeStatsRecord!.dayTransport,
                                  category: 'Trajets',
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.lodgingModel,
                              updateCallback: () => setState(() {}),
                              child: HomeCategoryWidget(
                                icon: Icon(
                                  Icons.home_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                co2e: homeStatsRecord.dayLodging,
                                category: 'Logement',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.foodModel,
                              updateCallback: () => setState(() {}),
                              child: HomeCategoryWidget(
                                icon: Icon(
                                  Icons.fastfood_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                co2e: homeStatsRecord.dayFood,
                                category: 'Repas',
                              ),
                            ),
                          ].divide(const SizedBox(width: 20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.clothesModel,
                                updateCallback: () => setState(() {}),
                                child: HomeCategoryWidget(
                                  icon: FaIcon(
                                    FontAwesomeIcons.tshirt,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  co2e: homeStatsRecord.dayClothes,
                                  category: 'Habits',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.furnitureModel,
                                updateCallback: () => setState(() {}),
                                child: HomeCategoryWidget(
                                  icon: FaIcon(
                                    FontAwesomeIcons.couch,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  co2e: homeStatsRecord.dayFurniture,
                                  category: 'Mobilier',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.digitalModel,
                                updateCallback: () => setState(() {}),
                                child: HomeCategoryWidget(
                                  icon: Icon(
                                    Icons.phone_android,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  co2e: homeStatsRecord.dayDigital,
                                  category: 'Numérique',
                                ),
                              ),
                            ].divide(const SizedBox(width: 20.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.electroModel,
                                updateCallback: () => setState(() {}),
                                child: HomeCategoryWidget(
                                  icon: Icon(
                                    Icons.kitchen_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  co2e: homeStatsRecord.dayAppliance,
                                  category: 'Electroménager',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.objectsModel1,
                                updateCallback: () => setState(() {}),
                                child: HomeCategoryWidget(
                                  icon: Icon(
                                    Icons.label,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  co2e: homeStatsRecord.dayObjects,
                                  category: 'Objets',
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.objectsModel2,
                                  updateCallback: () => setState(() {}),
                                  child: HomeCategoryWidget(
                                    icon: FaIcon(
                                      FontAwesomeIcons.hospitalAlt,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    co2e: homeStatsRecord.dayServices,
                                    category: 'Services',
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 20.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('categories');
                                  },
                                  text: 'Ajouter',
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    size: 25.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 290.0,
                                    height: 50.0,
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
                ].divide(const SizedBox(height: 10.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
