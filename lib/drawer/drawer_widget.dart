import '../auth/auth_util.dart';
import '../components/delete_account_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login/login_widget.dart';
import '../splash/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(1, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Drawer'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          InkWell(
            onTap: () async {
              logFirebaseEvent('DRAWER_PAGE_Container_sn7zgd2k_ON_TAP');
              logFirebaseEvent('Container_Navigate-Back');
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 70, 20, 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 400,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    color: Color(0x3D000000),
                    offset: Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 10, 0, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DRAWER_PAGE_Container_60vxfsrq_ON_TAP');
                                  logFirebaseEvent('Container_Navigate-Back');
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: SvgPicture.asset(
                                      'assets/images/arrow_back.svg',
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'DRAWER_PAGE_Row_rsn1mcit_ON_TAP');
                                logFirebaseEvent('Row_Navigate-Back');
                                Navigator.pop(context);
                                logFirebaseEvent('Row_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: SplashWidget(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/forward_green.svg',
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAWER_PAGE_Text_ii2hyxok_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-Back');
                                        Navigator.pop(context);
                                        logFirebaseEvent('Text_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
                                            child: SplashWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Bienvenue !',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 20,
                            endIndent: 140,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'DRAWER_PAGE_Row_9fn8a7ip_ON_TAP');
                                logFirebaseEvent('Row_Navigate-Back');
                                Navigator.pop(context);
                                logFirebaseEvent('Row_Launch-U-R-L');
                                await launchURL(
                                    'https://idees.carbonfight.app/application');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/forward_green.svg',
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAWER_PAGE_Text_v6f841f2_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-Back');
                                        Navigator.pop(context);
                                        logFirebaseEvent('Text_Launch-U-R-L');
                                        await launchURL(
                                            'https://idees.carbonfight.app/application');
                                      },
                                      child: Text(
                                        'Proposer une idée',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 20,
                            endIndent: 140,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'DRAWER_PAGE_Row_bp49j8dd_ON_TAP');
                                logFirebaseEvent('Row_Navigate-Back');
                                Navigator.pop(context);
                                logFirebaseEvent('Row_Launch-U-R-L');
                                await launchURL(
                                    'https://github.com/CarbonFight/app');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/forward_green.svg',
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAWER_PAGE_Text_hfgjhnx8_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-Back');
                                        Navigator.pop(context);
                                        logFirebaseEvent('Text_Launch-U-R-L');
                                        await launchURL(
                                            'https://github.com/CarbonFight/app');
                                      },
                                      child: Text(
                                        'Contribuer au code',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 20,
                            endIndent: 140,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'DRAWER_PAGE_Row_vel7kftr_ON_TAP');
                                logFirebaseEvent('Row_Navigate-Back');
                                Navigator.pop(context);
                                logFirebaseEvent('Row_Launch-U-R-L');
                                await launchURL(
                                    'https://github.com/CarbonFight/app/wiki');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/forward_green.svg',
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAWER_PAGE_Text_hndtb0cn_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-Back');
                                        Navigator.pop(context);
                                        logFirebaseEvent('Text_Launch-U-R-L');
                                        await launchURL(
                                            'https://github.com/CarbonFight/app/wiki');
                                      },
                                      child: Text(
                                        'Contribuer aux données',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 20,
                            endIndent: 140,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'DRAWER_PAGE_Row_hn9nctz4_ON_TAP');
                                logFirebaseEvent('Row_Navigate-Back');
                                Navigator.pop(context);
                                logFirebaseEvent('Row_Launch-U-R-L');
                                await launchURL(
                                    'https://discord.com/invite/tXRBhTGzG5');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/forward_green.svg',
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAWER_PAGE_Text_l6soz93q_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-Back');
                                        Navigator.pop(context);
                                        logFirebaseEvent('Text_Launch-U-R-L');
                                        await launchURL(
                                            'https://discord.com/invite/tXRBhTGzG5');
                                      },
                                      child: Text(
                                        'Discuter avec l\'équipe',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 20,
                            endIndent: 140,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0x1CE25606),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0x42E25606),
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'DRAWER_PAGE_Icon_uuebze8d_ON_TAP');
                                logFirebaseEvent('Icon_Auth');
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: LoginWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Icon(
                                Icons.power_settings_new,
                                color: FlutterFlowTheme.of(context).redi,
                                size: 24,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'CarbonFight Copyright 2022',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DRAWER_PAGE_Text_f4im2sln_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_Bottom-Sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: 405,
                                                        child:
                                                            DeleteAccountWidget(),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'Supprimer mon compte',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray,
                                                      fontSize: 11,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animated([animationsMap['containerOnPageLoadAnimation']!]),
          ),
        ],
      ),
    );
  }
}
