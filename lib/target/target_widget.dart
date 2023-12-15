import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/head_widget.dart';
import '/components/title_return_widget.dart';
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
                  child: HeadWidget(
                    displayName: currentUserDisplayName,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.titleReturnModel,
                updateCallback: () => setState(() {}),
                child: const TitleReturnWidget(
                  title: 'Mon objectif',
                  subtitle: 'Vos émissions CO2e',
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
                          FFLocalizations.of(context).getText(
                            'qahhilg1' /* En Tonnes par an */,
                          ),
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
                            FFLocalizations.of(context).getText(
                              'hvomtwpc' /* 0 */,
                            ),
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
                            FFLocalizations.of(context).getText(
                              'y2qbs45m' /* 10 */,
                            ),
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
                                    FFLocalizations.of(context).getText(
                                      'mh98qxc1' /* Objectif 0 Tonnes */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'mqhpyuia' /* 0 Kg de CO2e par jour */,
                                    ),
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
                                      text: FFLocalizations.of(context).getText(
                                        'l9nyr46d' /* Félicitations ! Vous voulez pa... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'g0l2v1ov' /*  C'est beau. */,
                                      ),
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
                                    FFLocalizations.of(context).getText(
                                      'mtfc9p6d' /* Objectif 2 Tonnes */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '9sjoo82w' /* 5,5 Kg de CO2e par jour */,
                                    ),
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
                                      text: FFLocalizations.of(context).getText(
                                        'y8du7bmu' /* Afin de limiter les effets du ... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'orfqo4ci' /* en-dessous de 2 degrés d’ici l... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'k4teag56' /* Pour y arriver, nous devons ré... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'hssfv10p' /* 2 tonnes équivalent CO2 par an... */,
                                      ),
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
                                    FFLocalizations.of(context).getText(
                                      '69awk3xn' /* Objectif 4 Tonnes */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'tmslm9wk' /* 11 Kg de CO2e par jour */,
                                    ),
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
                                      text: FFLocalizations.of(context).getText(
                                        'cllnbmxy' /* Un objectif de 4 Tonnes de  CO... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '9pa56q8p' /* 
C'est déjà pas mal ! 
 */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'xkmhp3u3' /* 
Encore 600 kg CO2e, et vous ê... */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '7pjbsdxp' /* le monde va se réchauffer entr... */,
                                      ),
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
                                    FFLocalizations.of(context).getText(
                                      '9vcffv6m' /* Objectif 6 Tonnes */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'lzgjd6ml' /* 16.5 Kg de CO2e par jour */,
                                    ),
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
                                      text: FFLocalizations.of(context).getText(
                                        'r3d63624' /* A 6 Tonnes de CO2e/an, vous ém... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'dzd61ikf' /* Vous êtes sur la bonne voie !
 */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '8ua9tbuj' /* 
Mais cela ne suffit toujours ... */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '08anyco7' /* un monde qui se réchaufferait ... */,
                                      ),
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
                                    FFLocalizations.of(context).getText(
                                      'mehah468' /* Objectif 8 Tonnes */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'fiu167qz' /* 22 Kg de CO2e par jour */,
                                    ),
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
                                      text: FFLocalizations.of(context).getText(
                                        'ov8zigjr' /* A 8 Tonnes de CO2e/an, vous mé... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'lmw491sy' /* Mais ça ne suffira pas !

 */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'pwrhzzrx' /* Avec une telle empreinte carbo... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'il5u00hj' /*  un monde qui se réchaufferait... */,
                                      ),
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
                                    FFLocalizations.of(context).getText(
                                      'a08g9fvn' /* Objectif 10 Tonnes */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'rvyfexgq' /* 27.5 Kg de CO2e par jour */,
                                    ),
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
                                      text: FFLocalizations.of(context).getText(
                                        'oact0k6j' /* Avec 10 Tonnes de CO2e/an, vou... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'b0u8i0k9' /* Là, c'est franchement pas poss... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'xqrs1w7h' /* 
Si tout le monde était comme ... */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '81ey4dsx' /* le monde se réchaufferait selo... */,
                                      ),
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
                        text: FFLocalizations.of(context).getText(
                          'fte7orbo' /* Valider */,
                        ),
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
