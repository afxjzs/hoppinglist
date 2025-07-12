import '/backend/supabase/supabase.dart';
import '/components/empty_have/empty_have_widget.dart';
import '/components/empty_need/empty_need_widget.dart';
import '/components/main_home_app_bar_content_widget.dart';
import '/components/need_have_divider/need_have_divider_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_list_model.dart';
export 'main_list_model.dart';

class MainListWidget extends StatefulWidget {
  const MainListWidget({super.key});

  static String routeName = 'MainList';
  static String routePath = '/mainList';

  @override
  State<MainListWidget> createState() => _MainListWidgetState();
}

class _MainListWidgetState extends State<MainListWidget>
    with TickerProviderStateMixin {
  late MainListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(FFAppState().currentLocationName != '')) {
        _model.mostItems = await LocationItemCountsTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'group_id',
                FFAppState().groupid,
              )
              .order('item_count'),
        );
        FFAppState().currentLocationName = _model.mostItems!.firstOrNull!.name!;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'listViewOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'checkboxListTileOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.4,
          ),
        ],
      ),
      'checkboxListTileOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'listViewOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'checkboxListTileOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.4,
          ),
        ],
      ),
      'checkboxListTileOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<LocationsRow>>(
      stream: _model.mainListSupabaseStream ??= SupaFlow.client
          .from("locations")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'group_id',
            FFAppState().groupid,
          )
          .order('name', ascending: true)
          .map((list) => list.map((item) => LocationsRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<LocationsRow> mainListLocationsRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.mainHomeAppBarContentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MainHomeAppBarContentWidget(),
                    ),
                  ),
                ],
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/navbar_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.locationSelectorValueController ??=
                              FormFieldController<String>(
                            _model.locationSelectorValue ??=
                                FFAppState().currentLocationName,
                          ),
                          options: mainListLocationsRowList
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.locationSelectorValue = val);
                            FFAppState().currentLocationName =
                                _model.locationSelectorValue!;
                            safeSetState(() {});
                          },
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                          hintText: 'Select Location',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FutureBuilder<List<ItemsRow>>(
                          future: ItemsTable().queryRows(
                            queryFn: (q) => q
                                .containsOrNull(
                                  'locations',
                                  '{${_model.locationSelectorValue}}',
                                )
                                .isFilter(
                                  'needed',
                                  true,
                                )
                                .eqOrNull(
                                  'group_id',
                                  FFAppState().groupid,
                                )
                                .order('needed')
                                .order('last_needed_at')
                                .order('name', ascending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ItemsRow> listViewNeedItemsRowList =
                                snapshot.data!;

                            if (listViewNeedItemsRowList.isEmpty) {
                              return EmptyNeedWidget();
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewNeedItemsRowList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 2.0),
                              itemBuilder: (context, listViewNeedIndex) {
                                final listViewNeedItemsRow =
                                    listViewNeedItemsRowList[listViewNeedIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onLongPress: () async {
                                    context.pushNamed(
                                      EditItemWidget.routeName,
                                      queryParameters: {
                                        'itemId': serializeParam(
                                          listViewNeedItemsRow.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Opacity(
                                      opacity: listViewNeedItemsRow.needed
                                          ? 1.0
                                          : 0.4,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          child: CheckboxListTile(
                                            value:
                                                _model.checkboxListTileValueMap1[
                                                        listViewNeedItemsRow] ??=
                                                    !listViewNeedItemsRow
                                                        .needed,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.checkboxListTileValueMap1[
                                                          listViewNeedItemsRow] =
                                                      newValue!);
                                              if (newValue!) {
                                                // Mark Item As Needed
                                                await ItemsTable().update(
                                                  data: {
                                                    'needed': false,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    listViewNeedItemsRow.id,
                                                  ),
                                                );
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));

                                                safeSetState(() {});
                                              } else {
                                                // Mark Item As Aquired
                                                await ItemsTable().update(
                                                  data: {
                                                    'needed': true,
                                                    'last_needed_at':
                                                        supaSerialize<DateTime>(
                                                            getCurrentTimestamp),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    listViewNeedItemsRow.id,
                                                  ),
                                                );
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));

                                                safeSetState(() {});
                                              }
                                            },
                                            title: Text(
                                              listViewNeedItemsRow.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              listViewNeedItemsRow.notes!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .spaceGrotesk(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      )
                                          .animateOnPageLoad(animationsMap[
                                              'checkboxListTileOnPageLoadAnimation1']!)
                                          .animateOnActionTrigger(
                                            animationsMap[
                                                'checkboxListTileOnActionTriggerAnimation1']!,
                                          ),
                                    ),
                                  ),
                                );
                              },
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'listViewOnActionTriggerAnimation1']!,
                            );
                          },
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.needHaveDividerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NeedHaveDividerWidget(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FutureBuilder<List<ItemsRow>>(
                          future: ItemsTable().queryRows(
                            queryFn: (q) => q
                                .containsOrNull(
                                  'locations',
                                  '{${_model.locationSelectorValue}}',
                                )
                                .isFilter(
                                  'needed',
                                  false,
                                )
                                .eqOrNull(
                                  'group_id',
                                  FFAppState().groupid,
                                )
                                .order('needed')
                                .order('last_needed_at')
                                .order('name', ascending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ItemsRow> listViewHaveItemsRowList =
                                snapshot.data!;

                            if (listViewHaveItemsRowList.isEmpty) {
                              return EmptyHaveWidget();
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewHaveItemsRowList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 2.0),
                              itemBuilder: (context, listViewHaveIndex) {
                                final listViewHaveItemsRow =
                                    listViewHaveItemsRowList[listViewHaveIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onLongPress: () async {
                                    context.pushNamed(
                                      EditItemWidget.routeName,
                                      queryParameters: {
                                        'itemId': serializeParam(
                                          listViewHaveItemsRow.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Opacity(
                                      opacity: listViewHaveItemsRow.needed
                                          ? 1.0
                                          : 0.4,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          child: CheckboxListTile(
                                            value:
                                                _model.checkboxListTileValueMap2[
                                                        listViewHaveItemsRow] ??=
                                                    !listViewHaveItemsRow
                                                        .needed,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.checkboxListTileValueMap2[
                                                          listViewHaveItemsRow] =
                                                      newValue!);
                                              if (newValue!) {
                                                // Mark Item As Needed
                                                await ItemsTable().update(
                                                  data: {
                                                    'needed': false,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    listViewHaveItemsRow.id,
                                                  ),
                                                );
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));

                                                safeSetState(() {});
                                              } else {
                                                // Mark Item As Aquired
                                                await ItemsTable().update(
                                                  data: {
                                                    'needed': true,
                                                    'last_needed_at':
                                                        supaSerialize<DateTime>(
                                                            getCurrentTimestamp),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    listViewHaveItemsRow.id,
                                                  ),
                                                );
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));

                                                safeSetState(() {});
                                              }
                                            },
                                            title: Text(
                                              listViewHaveItemsRow.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              listViewHaveItemsRow.notes!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .spaceGrotesk(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      )
                                          .animateOnPageLoad(animationsMap[
                                              'checkboxListTileOnPageLoadAnimation2']!)
                                          .animateOnActionTrigger(
                                            animationsMap[
                                                'checkboxListTileOnActionTriggerAnimation2']!,
                                          ),
                                    ),
                                  ),
                                );
                              },
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'listViewOnActionTriggerAnimation2']!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
