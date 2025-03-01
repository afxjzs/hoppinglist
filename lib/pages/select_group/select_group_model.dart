import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_group_widget.dart' show SelectGroupWidget;
import 'package:flutter/material.dart';

class SelectGroupModel extends FlutterFlowModel<SelectGroupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GroupId widget.
  FocusNode? groupIdFocusNode;
  TextEditingController? groupIdTextController;
  String? Function(BuildContext, String?)? groupIdTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in SetGroup widget.
  List<GroupsRow>? groupId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    groupIdFocusNode?.dispose();
    groupIdTextController?.dispose();
  }
}
