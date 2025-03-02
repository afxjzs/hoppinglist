import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'primary_checklist_model.dart';
export 'primary_checklist_model.dart';

/// the actual list with the db query
class PrimaryChecklistWidget extends StatefulWidget {
  const PrimaryChecklistWidget({
    super.key,
    required this.needed,
    this.needed2,
    this.name,
    this.notes,
    this.id,
    this.locations,
  });

  final bool? needed;
  final bool? needed2;
  final String? name;
  final String? notes;
  final int? id;
  final List<String>? locations;

  @override
  State<PrimaryChecklistWidget> createState() => _PrimaryChecklistWidgetState();
}

class _PrimaryChecklistWidgetState extends State<PrimaryChecklistWidget>
    with TickerProviderStateMixin {
  late PrimaryChecklistModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryChecklistModel());

    animationsMap.addAll({
      'listViewOnActionTriggerAnimation': AnimationInfo(
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
      'checkboxListTileOnActionTriggerAnimation': AnimationInfo(
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
      'checkboxListTileOnPageLoadAnimation': AnimationInfo(
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: FutureBuilder<List<ItemsRow>>(
        future: ItemsTable().queryRows(
          queryFn: (q) => q
              .containsOrNull(
                'locations',
                '{${widget.locations?.firstOrNull}}',
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
          List<ItemsRow> listViewItemsRowList = snapshot.data!;

          return ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewItemsRowList.length,
            separatorBuilder: (_, __) => SizedBox(height: 2.0),
            itemBuilder: (context, listViewIndex) {
              final listViewItemsRow = listViewItemsRowList[listViewIndex];
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Opacity(
                  opacity: listViewItemsRow.needed ? 1.0 : 0.4,
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
                        value: _model
                                .checkboxListTileValueMap[listViewItemsRow] ??=
                            !listViewItemsRow.needed,
                        onChanged: (newValue) async {
                          safeSetState(() => _model
                                  .checkboxListTileValueMap[listViewItemsRow] =
                              newValue!);
                          if (newValue!) {
                            // Mark Item As Needed
                            await ItemsTable().update(
                              data: {
                                'needed': false,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                listViewItemsRow.id,
                              ),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                          } else {
                            // Mark Item As Aquired
                            await ItemsTable().update(
                              data: {
                                'needed': true,
                                'last_needed_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                listViewItemsRow.id,
                              ),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                          }
                        },
                        title: Text(
                          listViewItemsRow.name,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        subtitle: Text(
                          listViewItemsRow.notes!,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Space Grotesk',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  )
                      .animateOnPageLoad(
                          animationsMap['checkboxListTileOnPageLoadAnimation']!)
                      .animateOnActionTrigger(
                        animationsMap[
                            'checkboxListTileOnActionTriggerAnimation']!,
                      ),
                ),
              );
            },
          ).animateOnActionTrigger(
            animationsMap['listViewOnActionTriggerAnimation']!,
          );
        },
      ),
    );
  }
}
