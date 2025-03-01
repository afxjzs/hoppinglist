import '/backend/supabase/supabase.dart';
import '/components/edit_checklist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'list_items_widget.dart' show ListItemsWidget;
import 'package:flutter/material.dart';

class ListItemsModel extends FlutterFlowModel<ListItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EditChecklist component.
  late EditChecklistModel editChecklistModel;
  Stream<List<ItemsRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {
    editChecklistModel = createModel(context, () => EditChecklistModel());
  }

  @override
  void dispose() {
    editChecklistModel.dispose();
  }
}
