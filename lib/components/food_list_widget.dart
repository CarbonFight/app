import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_list_model.dart';
export 'food_list_model.dart';

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({Key? key}) : super(key: key);

  @override
  _FoodListWidgetState createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  late FoodListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x25000000),
              offset: Offset(0.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nourriture',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 46.0,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('FOOD_LIST_COMP_close_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_ny9yoj7o_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(createFoodActionsRecordData(
                                userId: currentUserUid,
                                food: 'starter',
                              ));
                              _model.newStarter =
                                  FoodActionsRecord.getDocumentFromData(
                                      createFoodActionsRecordData(
                                        userId: currentUserUid,
                                        food: 'starter',
                                      ),
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDates = false;
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Food',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newStarter?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'food',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'starter',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/canape_(1).png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Entrées',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_q1yosrnh_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(createFoodActionsRecordData(
                                userId: currentUserUid,
                                food: 'main',
                              ));
                              _model.newMain =
                                  FoodActionsRecord.getDocumentFromData(
                                      createFoodActionsRecordData(
                                        userId: currentUserUid,
                                        food: 'main',
                                      ),
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDates = false;
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Food',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newMain?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'food',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'main',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/hot-pot.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Plat',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_r0c1o7ht_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(createFoodActionsRecordData(
                                userId: currentUserUid,
                                food: 'desert',
                              ));
                              _model.newDesert =
                                  FoodActionsRecord.getDocumentFromData(
                                      createFoodActionsRecordData(
                                        userId: currentUserUid,
                                        food: 'desert',
                                      ),
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDates = false;
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Food',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newDesert?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'food',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'desert',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/ice-cream.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Dessert',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_31uzdmwx_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(createFoodActionsRecordData(
                                userId: currentUserUid,
                                food: 'drinks',
                              ));
                              _model.newDrinks =
                                  FoodActionsRecord.getDocumentFromData(
                                      createFoodActionsRecordData(
                                        userId: currentUserUid,
                                        food: 'drinks',
                                      ),
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDates = false;
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Food',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newDrinks?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'food',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'drinks',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/soft-drink.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Boissons',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_4dtnptq5_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(createFoodActionsRecordData(
                                userId: currentUserUid,
                                food: 'cheese',
                              ));
                              _model.newCheese =
                                  FoodActionsRecord.getDocumentFromData(
                                      createFoodActionsRecordData(
                                        userId: currentUserUid,
                                        food: 'cheese',
                                      ),
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDates = false;
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Food',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newCheese?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'food',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'cheese',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/cheeses.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Fromage',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_rbnj7k2p_ON_TAP');
                              logFirebaseEvent('Container_backend_call');

                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(createFoodActionsRecordData(
                                userId: currentUserUid,
                                food: 'bread',
                              ));
                              _model.newBread =
                                  FoodActionsRecord.getDocumentFromData(
                                      createFoodActionsRecordData(
                                        userId: currentUserUid,
                                        food: 'bread',
                                      ),
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_update_app_state');
                              FFAppState().update(() {
                                FFAppState().displayDates = false;
                                FFAppState().displayDays = false;
                              });
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'Food',
                                queryParameters: {
                                  'actionRef': serializeParam(
                                    _model.newBread?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'category': serializeParam(
                                    'food',
                                    ParamType.String,
                                  ),
                                  'action': serializeParam(
                                    'bread',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/bread.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Pain',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FOOD_LIST_COMP_Container_h1fkx9l7_ON_TAP');
                        logFirebaseEvent('Container_backend_call');

                        var foodActionsRecordReference =
                            FoodActionsRecord.collection.doc();
                        await foodActionsRecordReference
                            .set(createFoodActionsRecordData(
                          userId: currentUserUid,
                          food: 'coffee',
                        ));
                        _model.newCoffee =
                            FoodActionsRecord.getDocumentFromData(
                                createFoodActionsRecordData(
                                  userId: currentUserUid,
                                  food: 'coffee',
                                ),
                                foodActionsRecordReference);
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().update(() {
                          FFAppState().displayDates = false;
                          FFAppState().displayDays = false;
                        });
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(
                          'Food',
                          queryParameters: {
                            'actionRef': serializeParam(
                              _model.newCoffee?.reference,
                              ParamType.DocumentReference,
                            ),
                            'category': serializeParam(
                              'food',
                              ParamType.String,
                            ),
                            'action': serializeParam(
                              'coffee',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      child: Container(
                        width: 135.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).grayLight,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/coffee.png',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Café',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
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
      ),
    );
  }
}
