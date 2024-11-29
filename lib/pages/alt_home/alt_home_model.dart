import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alt_home_widget.dart' show AltHomeWidget;
import 'package:flutter/material.dart';

class AltHomeModel extends FlutterFlowModel<AltHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<ItemsRow, bool> checkboxValueMap = {};
  List<ItemsRow> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
