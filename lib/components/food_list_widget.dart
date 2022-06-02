import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../food/food_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({Key key}) : super(key: key);

  @override
  _FoodListWidgetState createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  FoodActionsRecord newBread;
  FoodActionsRecord newCheese;
  FoodActionsRecord newDesert;
  FoodActionsRecord newDrinks;
  FoodActionsRecord newMain;
  FoodActionsRecord newStarter;
  FoodActionsRecord newCoffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x25000000),
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nourriture',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 46,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('FOOD_LIST_COMP_close_ICON_ON_TAP');
                      logFirebaseEvent('IconButton_Navigate-Back');
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_ny9yoj7o_ON_TAP');
                              logFirebaseEvent('Container_Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container_Backend-Call');

                              final foodActionsCreateData = {
                                ...createFoodActionsRecordData(
                                  userId: currentUserUid,
                                  co2e: 0,
                                  createdTime: getCurrentTimestamp,
                                  day: dateTimeFormat(
                                      'yMd', getCurrentTimestamp),
                                  isPeriodic: false,
                                  isTemporary: true,
                                  isFavorite: false,
                                  food: 'starter',
                                  portions: 1,
                                ),
                                'sideComponent': ['null'],
                              };
                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(foodActionsCreateData);
                              newStarter =
                                  FoodActionsRecord.getDocumentFromData(
                                      foodActionsCreateData,
                                      foodActionsRecordReference);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: FoodWidget(
                                    actionRef: newStarter.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/canape_(1).png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Entrées',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_q1yosrnh_ON_TAP');
                              logFirebaseEvent('Container_Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container_Backend-Call');

                              final foodActionsCreateData =
                                  createFoodActionsRecordData(
                                userId: currentUserUid,
                                co2e: 0,
                                createdTime: getCurrentTimestamp,
                                day: dateTimeFormat('yMd', getCurrentTimestamp),
                                isPeriodic: false,
                                isTemporary: true,
                                isFavorite: false,
                                food: 'main',
                                portions: 1,
                              );
                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(foodActionsCreateData);
                              newMain = FoodActionsRecord.getDocumentFromData(
                                  foodActionsCreateData,
                                  foodActionsRecordReference);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: FoodWidget(
                                    actionRef: newMain.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/steak.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Plat',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_r0c1o7ht_ON_TAP');
                              logFirebaseEvent('Container_Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container_Backend-Call');

                              final foodActionsCreateData = {
                                ...createFoodActionsRecordData(
                                  userId: currentUserUid,
                                  co2e: 0,
                                  createdTime: getCurrentTimestamp,
                                  day: dateTimeFormat(
                                      'yMd', getCurrentTimestamp),
                                  isPeriodic: false,
                                  isTemporary: true,
                                  isFavorite: false,
                                  food: 'desert',
                                  portions: 1,
                                ),
                                'sideComponent': ['null'],
                              };
                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(foodActionsCreateData);
                              newDesert = FoodActionsRecord.getDocumentFromData(
                                  foodActionsCreateData,
                                  foodActionsRecordReference);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: FoodWidget(
                                    actionRef: newDesert.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/ice-cream.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Dessert',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_31uzdmwx_ON_TAP');
                              logFirebaseEvent('Container_Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container_Backend-Call');

                              final foodActionsCreateData = {
                                ...createFoodActionsRecordData(
                                  userId: currentUserUid,
                                  co2e: 0,
                                  createdTime: getCurrentTimestamp,
                                  day: dateTimeFormat(
                                      'yMd', getCurrentTimestamp),
                                  isPeriodic: false,
                                  isTemporary: true,
                                  isFavorite: false,
                                  food: 'drinks',
                                  portions: 1,
                                ),
                                'sideComponent': ['null'],
                              };
                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(foodActionsCreateData);
                              newDrinks = FoodActionsRecord.getDocumentFromData(
                                  foodActionsCreateData,
                                  foodActionsRecordReference);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: FoodWidget(
                                    actionRef: newDrinks.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/soft-drink.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Boissons',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_4dtnptq5_ON_TAP');
                              logFirebaseEvent('Container_Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container_Backend-Call');

                              final foodActionsCreateData = {
                                ...createFoodActionsRecordData(
                                  userId: currentUserUid,
                                  co2e: 0,
                                  createdTime: getCurrentTimestamp,
                                  day: dateTimeFormat(
                                      'yMd', getCurrentTimestamp),
                                  isPeriodic: false,
                                  isTemporary: true,
                                  isFavorite: false,
                                  food: 'cheese',
                                  portions: 1,
                                ),
                                'mainComponent': ['null'],
                                'sideComponent': ['null'],
                              };
                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(foodActionsCreateData);
                              newCheese = FoodActionsRecord.getDocumentFromData(
                                  foodActionsCreateData,
                                  foodActionsRecordReference);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: FoodWidget(
                                    actionRef: newCheese.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/cheeses.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Fromage',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'FOOD_LIST_COMP_Container_rbnj7k2p_ON_TAP');
                              logFirebaseEvent('Container_Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Container_Backend-Call');

                              final foodActionsCreateData = {
                                ...createFoodActionsRecordData(
                                  userId: currentUserUid,
                                  co2e: 0,
                                  createdTime: getCurrentTimestamp,
                                  day: dateTimeFormat(
                                      'yMd', getCurrentTimestamp),
                                  isPeriodic: false,
                                  isTemporary: true,
                                  isFavorite: false,
                                  food: 'bread',
                                  portions: 1,
                                ),
                                'mainComponent': ['null'],
                                'sideComponent': ['null'],
                              };
                              var foodActionsRecordReference =
                                  FoodActionsRecord.collection.doc();
                              await foodActionsRecordReference
                                  .set(foodActionsCreateData);
                              newBread = FoodActionsRecord.getDocumentFromData(
                                  foodActionsCreateData,
                                  foodActionsRecordReference);
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: FoodWidget(
                                    actionRef: newBread.reference,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 135,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 5, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/bread.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Pain',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'FOOD_LIST_COMP_Container_h1fkx9l7_ON_TAP');
                        logFirebaseEvent('Container_Navigate-Back');
                        Navigator.pop(context);
                        logFirebaseEvent('Container_Backend-Call');

                        final foodActionsCreateData = {
                          ...createFoodActionsRecordData(
                            userId: currentUserUid,
                            co2e: 0,
                            createdTime: getCurrentTimestamp,
                            day: dateTimeFormat('yMd', getCurrentTimestamp),
                            isPeriodic: false,
                            isTemporary: true,
                            isFavorite: false,
                            food: 'coffee',
                            portions: 1,
                          ),
                          'sideComponent': ['null'],
                        };
                        var foodActionsRecordReference =
                            FoodActionsRecord.collection.doc();
                        await foodActionsRecordReference
                            .set(foodActionsCreateData);
                        newCoffee = FoodActionsRecord.getDocumentFromData(
                            foodActionsCreateData, foodActionsRecordReference);
                        logFirebaseEvent('Container_Navigate-To');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: FoodWidget(
                              actionRef: newCoffee.reference,
                            ),
                          ),
                        );

                        setState(() {});
                      },
                      child: Container(
                        width: 135,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).grayLight,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/coffee.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    'Café',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
