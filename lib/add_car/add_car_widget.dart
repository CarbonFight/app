import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCarWidget extends StatefulWidget {
  const AddCarWidget({Key key}) : super(key: key);

  @override
  _AddCarWidgetState createState() => _AddCarWidgetState();
}

class _AddCarWidgetState extends State<AddCarWidget> {
  String ownershipValue;
  String powertypeValue;
  TextEditingController distanceController;
  int passengersValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    distanceController = TextEditingController(text: '0');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: Color(0xFFFEFEFE),
                    icon: Icon(
                      Icons.directions_car,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                Text(
                  'Car travel',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.secondaryColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: TextFormField(
                        onChanged: (_) => EasyDebounce.debounce(
                          'distanceController',
                          Duration(milliseconds: 200),
                          () => setState(() {}),
                        ),
                        controller: distanceController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF5E6572),
                          ),
                          hintText: 'Distance (Kms)',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF14181B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Must not be blank';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '',
                      icon: Icon(
                        Icons.sync,
                        size: 25,
                      ),
                      options: FFButtonOptions(
                        width: 50,
                        height: 60,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Add',
                      icon: Icon(
                        Icons.add,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 100,
                        height: 60,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Options',
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Ownership',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                      ),
                      FlutterFlowRadioButton(
                        options: ['Owner', 'Long rent', 'Short rent', 'Taxi'],
                        initialValue: 'Owner',
                        onChanged: (value) {
                          setState(() => ownershipValue = value);
                        },
                        optionHeight: 25,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                        selectedTextStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.secondaryColor,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.tertiaryColor,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Power Type',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                      ),
                      FlutterFlowRadioButton(
                        options: ['Thermic', 'Hybrid', 'Electricity'],
                        initialValue: 'Thermic',
                        onChanged: (value) {
                          setState(() => powertypeValue = value);
                        },
                        optionHeight: 25,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFFFCFCFC),
                        ),
                        selectedTextStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.secondaryColor,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.tertiaryColor,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Passengers',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFF9E9E9E),
                              width: 1,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.minus,
                              color: enabled
                                  ? FlutterFlowTheme.primaryColor
                                  : Color(0xFFEEEEEE),
                              size: 20,
                            ),
                            incrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.plus,
                              color: enabled
                                  ? FlutterFlowTheme.primaryColor
                                  : Color(0xFFEEEEEE),
                              size: 20,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            count: passengersValue ??= 1,
                            updateCount: (count) =>
                                setState(() => passengersValue = count),
                            stepSize: 1,
                            minimum: 1,
                            maximum: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
