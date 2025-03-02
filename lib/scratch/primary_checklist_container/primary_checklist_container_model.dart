import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/scratch/primary_checklist/primary_checklist_widget.dart';
import 'primary_checklist_container_widget.dart'
    show PrimaryChecklistContainerWidget;
import 'package:flutter/material.dart';

class PrimaryChecklistContainerModel
    extends FlutterFlowModel<PrimaryChecklistContainerWidget> {
  ///  Local state fields for this component.

  bool needed = true;

  ///  State fields for stateful widgets in this component.

  // Model for PrimaryChecklist component.
  late PrimaryChecklistModel primaryChecklistModel;
  Stream<List<ItemsRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {
    primaryChecklistModel = createModel(context, () => PrimaryChecklistModel());
  }

  @override
  void dispose() {
    primaryChecklistModel.dispose();
  }
}
