import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_button_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({
    Key key,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference actionRef;

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  DateTimeRange calendarSelectedDay;
  List<String> periodicityValues;
  List<String> mainComponentValues;
  List<String> sideComponentValues;
  int portionsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Food'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FoodActionsRecord>(
      stream: FoodActionsRecord.getDocument(widget.actionRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 2,
              height: 2,
              child: SpinKitRing(
                color: Colors.transparent,
                size: 2,
              ),
            ),
          );
        }
        final foodFoodActionsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 1,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Final_Concept_1.jpg',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0F86D9), Color(0x0023D0C1)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x0000A193), Color(0xCB0EBAA1)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'FOOD_PAGE_Container_r5xuupr3_ON_TAP');
                                    if ((foodFoodActionsRecord.isTemporary) ==
                                        true) {
                                      logFirebaseEvent(
                                          'Container_Backend-Call');
                                      await widget.actionRef.delete();
                                    }
                                    logFirebaseEvent('Container_Navigate-Back');
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ajouter un repas',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xACEEEEEE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Stack(
                                          children: [
                                            if ((foodFoodActionsRecord.food) ==
                                                'starter')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/canape_(1).png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((foodFoodActionsRecord.food) ==
                                                'main')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/steak.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((foodFoodActionsRecord.food) ==
                                                'desert')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/ice-cream.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((foodFoodActionsRecord.food) ==
                                                'drinks')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/soft-drink.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((foodFoodActionsRecord.food) ==
                                                'cheese')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/cheeses.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((foodFoodActionsRecord.food) ==
                                                'bread')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/bread.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if ((foodFoodActionsRecord.food) ==
                                                'coffee')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Image.asset(
                                                  'assets/images/coffee.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            '+ ${valueOrDefault<String>(
                                              functions.printScore(
                                                  foodFoodActionsRecord.co2e),
                                              '0',
                                            )}',
                                            '+ 0 g',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title2,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'FOOD_PAGE_Icon_eehg5j9k_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_Update-Local-State');
                                              setState(() =>
                                                  FFAppState().actionCO2 =
                                                      functions.foodActionsCO2e(
                                                          foodFoodActionsRecord
                                                              .food,
                                                          mainComponentValues
                                                              .toList(),
                                                          sideComponentValues
                                                              .toList(),
                                                          portionsValue));
                                              logFirebaseEvent(
                                                  'Icon_Backend-Call');

                                              final foodActionsUpdateData =
                                                  createFoodActionsRecordData(
                                                co2e: FFAppState().actionCO2,
                                              );
                                              await widget.actionRef.update(
                                                  foodActionsUpdateData);
                                            },
                                            child: Icon(
                                              Icons.sync_sharp,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: FlutterFlowChoiceChips(
                                            initiallySelected:
                                                mainComponentValues != null
                                                    ? mainComponentValues
                                                    : foodFoodActionsRecord
                                                        .mainComponent
                                                        .toList(),
                                            options: (functions
                                                        .getFoodMainComponents(
                                                            foodFoodActionsRecord
                                                                .food) ??
                                                    [])
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) => setState(() =>
                                                mainComponentValues = val),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFF323B45),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                      ),
                                              iconColor: Colors.white,
                                              iconSize: 18,
                                              elevation: 4,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF323B45),
                                                  ),
                                              iconColor: Color(0xFF323B45),
                                              iconSize: 18,
                                              elevation: 4,
                                            ),
                                            chipSpacing: 20,
                                            multiselect: true,
                                            initialized:
                                                mainComponentValues != null,
                                            alignment: WrapAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: FlutterFlowChoiceChips(
                                            initiallySelected:
                                                sideComponentValues != null
                                                    ? sideComponentValues
                                                    : foodFoodActionsRecord
                                                        .sideComponent
                                                        .toList(),
                                            options: (functions
                                                        .getFoodSideComponents(
                                                            foodFoodActionsRecord
                                                                .food) ??
                                                    [])
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) => setState(() =>
                                                sideComponentValues = val),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFF323B45),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                      ),
                                              iconColor: Colors.white,
                                              iconSize: 18,
                                              elevation: 4,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF323B45),
                                                  ),
                                              iconColor: Color(0xFF323B45),
                                              iconSize: 18,
                                              elevation: 4,
                                            ),
                                            chipSpacing: 20,
                                            multiselect: true,
                                            initialized:
                                                sideComponentValues != null,
                                            alignment: WrapAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFF9E9E9E),
                                              width: 1,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? Color(0xDD000000)
                                                  : Color(0xFFEEEEEE),
                                              size: 15,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryColor
                                                  : Color(0xFFEEEEEE),
                                              size: 15,
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
                                            count: portionsValue ??=
                                                foodFoodActionsRecord.portions,
                                            updateCount: (count) => setState(
                                                () => portionsValue = count),
                                            stepSize: 1,
                                            minimum: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 15),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final foodActionsUpdateData =
                                                        createFoodActionsRecordData(
                                                      isPeriodic:
                                                          !foodFoodActionsRecord
                                                              .isPeriodic,
                                                    );
                                                    await foodFoodActionsRecord
                                                        .reference
                                                        .update(
                                                            foodActionsUpdateData);
                                                  },
                                                  value: foodFoodActionsRecord
                                                      .isPeriodic,
                                                  onIcon: Icon(
                                                    Icons.update,
                                                    color: Colors.black,
                                                    size: 35,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.date_range,
                                                    color: Colors.black,
                                                    size: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (foodFoodActionsRecord
                                                            .isPeriodic ??
                                                        true)
                                                      Text(
                                                        'Récurrent',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                    if (!(foodFoodActionsRecord
                                                            .isPeriodic) ??
                                                        true)
                                                      Text(
                                                        'Ponctuel',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 10,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (!(foodFoodActionsRecord
                                                            .isPeriodic) ??
                                                        true)
                                                      ToggleIcon(
                                                        onPressed: () async {
                                                          final foodActionsUpdateData =
                                                              createFoodActionsRecordData(
                                                            isFavorite:
                                                                !foodFoodActionsRecord
                                                                    .isFavorite,
                                                          );
                                                          await foodFoodActionsRecord
                                                              .reference
                                                              .update(
                                                                  foodActionsUpdateData);
                                                        },
                                                        value:
                                                            foodFoodActionsRecord
                                                                .isFavorite,
                                                        onIcon: Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          size: 35,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.black,
                                                          size: 35,
                                                        ),
                                                      ),
                                                    if (foodFoodActionsRecord
                                                            .isPeriodic ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 8, 0, 0),
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray,
                                                          size: 35,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Favoris',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 10,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Container(
                                      height: 130,
                                      child: Stack(
                                        children: [
                                          if (foodFoodActionsRecord
                                                  .isPeriodic ??
                                              true)
                                            FlutterFlowChoiceChips(
                                              initiallySelected:
                                                  periodicityValues != null
                                                      ? periodicityValues
                                                      : foodFoodActionsRecord
                                                          .periodicity
                                                          .toList(),
                                              options: [
                                                ChipData('Lundi'),
                                                ChipData('Mardi'),
                                                ChipData('Mercredi'),
                                                ChipData('Jeudi'),
                                                ChipData('Vendredi'),
                                                ChipData('Samedi'),
                                                ChipData('Dimanche')
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  periodicityValues = val),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF323B45),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 18,
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF323B45),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                iconColor: Color(0xFF323B45),
                                                iconSize: 18,
                                                elevation: 4,
                                              ),
                                              chipSpacing: 10,
                                              rowSpacing: 5,
                                              multiselect: true,
                                              initialized:
                                                  periodicityValues != null,
                                              alignment:
                                                  WrapAlignment.spaceEvenly,
                                            ),
                                          if (!(foodFoodActionsRecord
                                                  .isPeriodic) ??
                                              true)
                                            FlutterFlowCalendar(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              weekFormat: true,
                                              weekStartsMonday: true,
                                              initialDate: foodFoodActionsRecord
                                                  .createdTime,
                                              onChange: (DateTimeRange
                                                  newSelectedDate) {
                                                setState(() =>
                                                    calendarSelectedDay =
                                                        newSelectedDate);
                                              },
                                              titleStyle: TextStyle(),
                                              dayOfWeekStyle: TextStyle(),
                                              dateStyle: TextStyle(),
                                              selectedDateStyle: TextStyle(),
                                              inactiveDateStyle: TextStyle(),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.9),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: [
                                      if (!(foodFoodActionsRecord
                                              .isTemporary) ??
                                          true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_PAGE_delete_ON_TAP');
                                            logFirebaseEvent(
                                                'delete_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'delete_Backend-Call');
                                            await widget.actionRef.delete();
                                            logFirebaseEvent(
                                                'delete_Navigate-Back');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'delete_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = false);
                                          },
                                          child: IconButtonWidget(
                                            fillColor: Color(0x98BC0909),
                                            fontColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Supprimer ',
                                          ),
                                        ),
                                      if (foodFoodActionsRecord.isTemporary ??
                                          true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_PAGE_cancel_ON_TAP');
                                            logFirebaseEvent(
                                                'cancel_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'cancel_Backend-Call');
                                            await widget.actionRef.delete();
                                            logFirebaseEvent(
                                                'cancel_Navigate-Back');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'cancel_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = false);
                                          },
                                          child: IconButtonWidget(
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .gray,
                                            fontColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Annuler ',
                                          ),
                                        ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      if (!(FFAppState().loading) ?? true)
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_PAGE_modify_ON_TAP');
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = true);
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() => FFAppState()
                                                    .actionCO2 =
                                                functions.foodActionsCO2e(
                                                    foodFoodActionsRecord.food,
                                                    mainComponentValues
                                                        .toList(),
                                                    sideComponentValues
                                                        .toList(),
                                                    portionsValue));
                                            logFirebaseEvent(
                                                'modify_Backend-Call');

                                            final foodActionsUpdateData = {
                                              ...createFoodActionsRecordData(
                                                userId: currentUserUid,
                                                co2e: FFAppState().actionCO2,
                                                day: functions.timestampToDay(
                                                    calendarSelectedDay?.start),
                                                createdTime:
                                                    calendarSelectedDay?.start,
                                                isTemporary: false,
                                                portions: portionsValue,
                                              ),
                                              'periodicity': periodicityValues,
                                              'mainComponent':
                                                  mainComponentValues,
                                              'sideComponent':
                                                  sideComponentValues,
                                            };
                                            await widget.actionRef
                                                .update(foodActionsUpdateData);
                                            logFirebaseEvent(
                                                'modify_Navigate-Back');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'modify_Update-Local-State');
                                            setState(() =>
                                                FFAppState().loading = false);
                                          },
                                          child: IconButtonWidget(
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryColor,
                                            fontColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Valider ',
                                          ),
                                        ),
                                      if (FFAppState().loading ?? true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: IconButtonWidget(
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .gray,
                                            fontColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            icon: Icon(
                                              Icons.sync,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 20,
                                            ),
                                            text: 'Valider',
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
      },
    );
  }
}
