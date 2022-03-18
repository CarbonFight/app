import '../auth/auth_util.dart';
import '../components/forgot_password_widget.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';
import '../signup/signup_widget.dart';
import '../splash/splash_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/images/mobile_cover.jpg',
            ).image,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xBE23D0C1), Color(0x0023D0C1)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 80, 60, 80),
                      child: Image.asset(
                        'assets/images/logo_light.png',
                        width: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x27000000),
                              offset: Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: emailAddressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'agtsd4a4' /* Email Address */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .gronyLight,
                                      size: 18,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x27000000),
                              offset: Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'l6e78onj' /* Password */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                    prefixIcon: Icon(
                                      Icons.vpn_key_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .gronyLight,
                                      size: 18,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility =
                                            !passwordVisibility,
                                      ),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .gronyLighter,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0xBF000000),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: 375,
                                    child: ForgotPasswordWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bvbpxghp' /* Forgot Password ? */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final user = await signInWithEmail(
                                  context,
                                  emailAddressController.text,
                                  passwordController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                if (!(currentUserEmailVerified)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('E-mail non vérifié'),
                                        content: Text(
                                            'Merci de valider votre compte en cliquant sur le lien reçu par mail.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                if (FFAppState().showSplash) {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SplashWidget(),
                                    ),
                                  );
                                } else {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeWidget(),
                                    ),
                                  );
                                }
                              },
                              child: IconButtonWidget(
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                icon: Icon(
                                  Icons.login_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 26,
                                ),
                                text: 'Login',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          FFLocalizations.of(context).getText(
                                            'jq7dkcmx' /* Or Use Social Login */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color:
                                              FlutterFlowTheme.of(context).blue,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: FaIcon(
                                              FontAwesomeIcons.facebookF,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            final user =
                                                await signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            if (FFAppState().showSplash) {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SplashWidget(),
                                                ),
                                              );
                                            } else {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeWidget(),
                                                ),
                                              );
                                            }
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .orange,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 60,
                                              icon: FaIcon(
                                                FontAwesomeIcons.google,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: FaIcon(
                                            FontAwesomeIcons.apple,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupWidget(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '6iqjwn33' /* Don't have an account ? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignupWidget(),
                                          ),
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'yf3iogt3' /* Register */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 90,
                                        height: 30,
                                        color: Color(0x00FFFFFF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gronyLight,
                                            ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 0,
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
