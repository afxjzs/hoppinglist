import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_group_widget.dart' show SelectGroupWidget;
import 'package:flutter/material.dart';

class SelectGroupModel extends FlutterFlowModel<SelectGroupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for groupCode widget.
  FocusNode? groupCodeFocusNode;
  TextEditingController? groupCodeTextController;
  String? Function(BuildContext, String?)? groupCodeTextControllerValidator;
  String? _groupCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Group Code is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in groupCode widget.
  bool? formOutput;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validatedFormOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<GroupsRow>? queryResult;

  @override
  void initState(BuildContext context) {
    groupCodeTextControllerValidator = _groupCodeTextControllerValidator;
  }

  @override
  void dispose() {
    groupCodeFocusNode?.dispose();
    groupCodeTextController?.dispose();
  }
}
