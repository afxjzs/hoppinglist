import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'primary_checklist_widget.dart' show PrimaryChecklistWidget;
import 'package:flutter/material.dart';

class PrimaryChecklistModel extends FlutterFlowModel<PrimaryChecklistWidget> {
  ///  Local state fields for this component.

  bool needed = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  Map<ItemsRow, bool> checkboxListTileValueMap = {};
  List<ItemsRow> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
