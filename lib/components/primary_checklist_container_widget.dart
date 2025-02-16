import '/backend/supabase/supabase.dart';
import '/components/primary_checklist_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'primary_checklist_container_model.dart';
export 'primary_checklist_container_model.dart';

/// the main checklist for items
class PrimaryChecklistContainerWidget extends StatefulWidget {
  const PrimaryChecklistContainerWidget({
    super.key,
    this.choiceChips,
  });

  final String? choiceChips;

  @override
  State<PrimaryChecklistContainerWidget> createState() =>
      _PrimaryChecklistContainerWidgetState();
}

class _PrimaryChecklistContainerWidgetState
    extends State<PrimaryChecklistContainerWidget> {
  late PrimaryChecklistContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryChecklistContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: StreamBuilder<List<ItemsRow>>(
        stream: _model.containerSupabaseStream ??= SupaFlow.client
            .from("items")
            .stream(primaryKey: ['id'])
            .order('needed')
            .order('last_needed_at')
            .map((list) => list.map((item) => ItemsRow(item)).toList()),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<ItemsRow> primaryChecklistItemsRowList = snapshot.data!;

          return wrapWithModel(
            model: _model.primaryChecklistModel,
            updateCallback: () => safeSetState(() {}),
            child: PrimaryChecklistWidget(
              needed: primaryChecklistItemsRowList.firstOrNull!.needed,
              needed2: primaryChecklistItemsRowList.firstOrNull?.needed,
              name: primaryChecklistItemsRowList.firstOrNull?.name,
              notes: primaryChecklistItemsRowList.firstOrNull?.notes,
              id: primaryChecklistItemsRowList.firstOrNull?.id,
              locations: primaryChecklistItemsRowList.firstOrNull?.locations,
            ),
          );
        },
      ),
    );
  }
}
