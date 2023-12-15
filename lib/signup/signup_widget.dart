import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/title_return_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'signup_model.dart';
export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

    _model.lastnameController ??= TextEditingController();
    _model.lastnameFocusNode ??= FocusNode();

    _model.firstnameController ??= TextEditingController();
    _model.firstnameFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: const Color(0x00FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    image: Image.asset(
                      'assets/images/better_rounded_header.png',
                    ).image,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logoCF.png',
                        width: 100.0,
                        height: 80.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.titleReturnModel,
                updateCallback: () => setState(() {}),
                child: const TitleReturnWidget(
                  title: 'Création de compte',
                  subtitle: 'Inscription par email',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: SizedBox(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.lastnameController,
                                    focusNode: _model.lastnameFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'w69qzzr0' /* Nom */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      alignLabelWithHint: true,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '2tnijjhj' /* Saisissez votre nom */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .lastnameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.firstnameController,
                                  focusNode: _model.firstnameFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'i13bdk0x' /* Prénom */,
                                    ),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    alignLabelWithHint: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'lirexkpa' /* Saisissez votre prénom */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.firstnameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.emailController,
                                  focusNode: _model.emailFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'a7fi3kai' /* Email */,
                                    ),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    alignLabelWithHint: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'ez2uhgoo' /* Saisissez votre email */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model.emailControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.passwordController,
                                  focusNode: _model.passwordFocusNode,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'v285r1zu' /* Mot de passe */,
                                    ),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    alignLabelWithHint: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'i15ww280' /* Entrez votre mot de passe */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.passwordControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.standard,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.optinValue ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.optinValue = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).secondary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Container(
                            width: 240.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '9vrucev4' /* J'accepte les  */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '1uavm6jw' /* CGU */,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'pgv9lfau' /*  et la  */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'v9k4pwp9' /* politique de 
confidentialité */
                                      ,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '6xfxz6vk' /*  ainsi que  */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '44jggosg' /* les cookies */,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '3zjg6mdw' /*  à des fins statistiques. */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.0,
                                    ),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.optinValue == true) {
                                  GoRouter.of(context).prepareAuthEvent();

                                  final user =
                                      await authManager.createAccountWithEmail(
                                    context,
                                    _model.emailController.text,
                                    _model.passwordController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(createUsersRecordData(
                                        displayName:
                                            '${_model.firstnameController.text} ${_model.lastnameController.text}',
                                        createdTime: getCurrentTimestamp,
                                        lastName:
                                            _model.lastnameController.text,
                                        firstName:
                                            _model.firstnameController.text,
                                        sponsorshipCode:
                                            random_data.randomString(
                                          6,
                                          6,
                                          false,
                                          true,
                                          true,
                                        ),
                                        skipHowto: false,
                                        target: 2.0,
                                        email: _model.emailController.text,
                                      ));

                                  context.pushNamedAuth(
                                      'home', context.mounted);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Confirmation manquante'),
                                        content: const Text(
                                            'Pour créer un compte, vous devez accepter les CGU et politiques de confidentialité.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Compris !'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '2fk0kgou' /* Créer mon compte */,
                              ),
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
