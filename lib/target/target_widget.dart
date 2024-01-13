import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/title_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'target_model.dart';
export 'target_model.dart';

class TargetWidget extends StatefulWidget {
  const TargetWidget({super.key});

  @override
  _TargetWidgetState createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  late TargetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TargetModel());

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
                child: const TitleBackWidget(
                  title: 'Mon objectif',
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'En Tonnes par an',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      width: 300.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => SizedBox(
                              width: 250.0,
                              child: Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 10.0,
                                value: _model.targetSliderValue ??=
                                    valueOrDefault<double>(
                                  valueOrDefault(
                                      currentUserDocument?.target, 0.0),
                                  2.0,
                                ),
                                label: _model.targetSliderValue.toString(),
                                divisions: 5,
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(2));
                                  setState(() =>
                                      _model.targetSliderValue = newValue);
                                },
                              ),
                            ),
                          ),
                          Text(
                            '10',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    if (_model.targetSliderValue == 0.0)
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Objectif 0 Tonnes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '0 Kg de CO2e par jour',
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ],
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Félicitations ! Vous voulez passer en dessous des 2 Tonnes ?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: ' C\'est beau.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    if (_model.targetSliderValue == 2.0)
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Objectif 2 Tonnes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '5,5 Kg de CO2e par jour',
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ],
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Afin de limiter les effets du changement climatique, l’Accord de Paris (2015) a fixé un objectif : limiter la hausse de la température ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          'en-dessous de 2 degrés d’ici la fin du siècle.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Pour y arriver, nous devons réduire nos émissions de gaz à effet de serre, et notamment passer à ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          '2 tonnes équivalent CO2 par an et par habitant d’ici 2050.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    if (_model.targetSliderValue == 4.0)
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Objectif 4 Tonnes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '11 Kg de CO2e par jour',
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ],
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Un objectif de 4 Tonnes de  CO2e/an, c\'est l’équivalent d’un citoyen d’Arménie, de République Dominicaine, de Guinée, du Liberia, du Pérou ou encore de la Tanzanie.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: '\nC\'est déjà pas mal ! \n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          '\nEncore 600 kg CO2e, et vous êtes à la moyenne Africaine. Bel effort, cependant, ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          'le monde va se réchauffer entre 2 et 2,8°C.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    if (_model.targetSliderValue == 6.0)
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Objectif 6 Tonnes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '16.5 Kg de CO2e par jour',
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ],
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'A 6 Tonnes de CO2e/an, vous émettez autant qu’un citoyen d’Angola, des Îles Vierges Brittaniques,  de la République Démocratique du Congo, du Liban, du Nicaragua,  du Panama, ou encore du Vietnam.\n\nC\'est un objectif juste en dessous de la moyenne mondiale de 7 Tonnes de CO2e/an et vous êtes aux environs de la moyenne asiatique. \n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: 'Vous êtes sur la bonne voie !\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          '\nMais cela ne suffit toujours pas : avec une telle empreinte carbone et si tout le monde faisait comme vous, vous contribueriez à ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          'un monde qui se réchaufferait entre 2,8°C et 3,2°C.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    if (_model.targetSliderValue == 8.0)
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Objectif 8 Tonnes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '22 Kg de CO2e par jour',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ],
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'A 8 Tonnes de CO2e/an, vous méttez autant qu\'un citoyen  du Botswana, d’Israel, d’Indonésie ou de Lettonie.\n\nRéduisez encore d’ 1 Tonne de CO2e/an et vous êtes à la moyenne mondiale actuelle.\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: 'Mais ça ne suffira pas !\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Avec une telle empreinte carbone et si tout le monde faisait comme vous, vous contribueriez à',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          ' un monde qui se réchaufferait entre 3,2°C et 3,6°C.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    if (_model.targetSliderValue == 10.0)
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Objectif 10 Tonnes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '27.5 Kg de CO2e par jour',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ],
                              ),
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Avec 10 Tonnes de CO2e/an, vous émettez autant qu\'un citoyen de Biélorussie, de Bolivie, du Brésil, d’Estonie, d’Iran, de Libye ou de Pologne.\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          'Là, c\'est franchement pas possible. Vous pouvez faire mieux.\n',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          '\nSi tout le monde était comme vous, ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          'le monde se réchaufferait selon les pires prévisions du GIEC entre 3,6°C et 4,4°C.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            target: _model.targetSliderValue,
                          ));

                          context.pushNamed('profil');
                        },
                        text: 'Valider',
                        options: FFButtonOptions(
                          width: 290.0,
                          height: 40.0,
                          padding: const EdgeInsets.all(0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall,
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 5.0)),
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
