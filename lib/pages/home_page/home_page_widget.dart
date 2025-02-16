import '/backend/supabase/supabase.dart';
import '/components/empty_have_widget.dart';
import '/components/empty_need_widget.dart';
import '/components/need_have_divider_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/nav_icon.png',
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Hopping List',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterFlowTheme.of(context).alwaysLight,
                      letterSpacing: 0.0,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData('Safeway'),
                      ChipData('Trader Joe\'s'),
                      ChipData('CVS'),
                      ChipData('Target')
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Space Grotesk',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      iconColor: Color(0x00000000),
                      iconSize: 0.0,
                      labelPadding: EdgeInsets.all(4.0),
                      elevation: 1.0,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Space Grotesk',
                                letterSpacing: 0.0,
                              ),
                      iconColor: Color(0x00000000),
                      iconSize: 0.0,
                      labelPadding: EdgeInsets.all(4.0),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    chipSpacing: 4.0,
                    rowSpacing: 4.0,
                    multiselect: false,
                    initialized: _model.choiceChipsValue != null,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      ['Safeway'],
                    ),
                    wrapped: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: FutureBuilder<List<ItemsRow>>(
                    future: ItemsTable().queryRows(
                      queryFn: (q) => q
                          .containsOrNull(
                            'locations',
                            '{${_model.choiceChipsValue}}',
                          )
                          .isFilter(
                            'needed',
                            true,
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
                              child: SpinKitRing(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ItemsRow> listViewNeedItemsRowList = snapshot.data!;

                      if (listViewNeedItemsRowList.isEmpty) {
                        return EmptyNeedWidget();
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNeedItemsRowList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 2.0),
                        itemBuilder: (context, listViewNeedIndex) {
                          final listViewNeedItemsRow =
                              listViewNeedItemsRowList[listViewNeedIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Opacity(
                              opacity: listViewNeedItemsRow.needed ? 1.0 : 0.4,
                              child: Material(
                                color: Colors.transparent,
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValueMap1[
                                            listViewNeedItemsRow] ??=
                                        !listViewNeedItemsRow.needed,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model
                                              .checkboxListTileValueMap1[
                                          listViewNeedItemsRow] = newValue!);
                                      if (newValue!) {
                                        // Mark Item As Needed
                                        await ItemsTable().update(
                                          data: {
                                            'needed': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            listViewNeedItemsRow.id,
                                          ),
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));

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
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            listViewNeedItemsRow.id,
                                          ),
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));

                                        safeSetState(() {});
                                      }
                                    },
                                    title: Text(
                                      listViewNeedItemsRow.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    subtitle: Text(
                                      listViewNeedItemsRow.notes!,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Space Grotesk',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                          );
                        },
                      ).animateOnActionTrigger(
                        animationsMap['listViewOnActionTriggerAnimation1']!,
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
                            '{${_model.choiceChipsValue}}',
                          )
                          .isFilter(
                            'needed',
                            false,
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
                              child: SpinKitRing(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ItemsRow> listViewHaveItemsRowList = snapshot.data!;

                      if (listViewHaveItemsRowList.isEmpty) {
                        return EmptyHaveWidget();
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewHaveItemsRowList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 2.0),
                        itemBuilder: (context, listViewHaveIndex) {
                          final listViewHaveItemsRow =
                              listViewHaveItemsRowList[listViewHaveIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Opacity(
                              opacity: listViewHaveItemsRow.needed ? 1.0 : 0.4,
                              child: Material(
                                color: Colors.transparent,
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValueMap2[
                                            listViewHaveItemsRow] ??=
                                        !listViewHaveItemsRow.needed,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model
                                              .checkboxListTileValueMap2[
                                          listViewHaveItemsRow] = newValue!);
                                      if (newValue!) {
                                        // Mark Item As Needed
                                        await ItemsTable().update(
                                          data: {
                                            'needed': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            listViewHaveItemsRow.id,
                                          ),
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));

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
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            listViewHaveItemsRow.id,
                                          ),
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));

                                        safeSetState(() {});
                                      }
                                    },
                                    title: Text(
                                      listViewHaveItemsRow.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    subtitle: Text(
                                      listViewHaveItemsRow.notes!,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Space Grotesk',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                          );
                        },
                      ).animateOnActionTrigger(
                        animationsMap['listViewOnActionTriggerAnimation2']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
