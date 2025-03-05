import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'join_group_widget.dart' show JoinGroupWidget;
import 'package:flutter/material.dart';

class JoinGroupModel extends FlutterFlowModel<JoinGroupWidget> {
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

    if (val.length < 4) {
      return 'Between 4 - 12 characters';
    }
    if (val.length > 12) {
      return 'Between 4 - 12 characters';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in groupCode widget.
  bool? formOutput;
  // State field(s) for groupPin widget.
  FocusNode? groupPinFocusNode;
  TextEditingController? groupPinTextController;
  String? Function(BuildContext, String?)? groupPinTextControllerValidator;
  String? _groupPinTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Group PIN is required';
    }

    if (val.length < 4) {
      return 'Exactly 4 numbers';
    }
    if (val.length > 4) {
      return 'Exactly 4 numbers';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in groupPin widget.
  bool? formOutputPIN;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validatedFormOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<GroupsRow>? queryResult;

  @override
  void initState(BuildContext context) {
    groupCodeTextControllerValidator = _groupCodeTextControllerValidator;
    groupPinTextControllerValidator = _groupPinTextControllerValidator;
  }

  @override
  void dispose() {
    groupCodeFocusNode?.dispose();
    groupCodeTextController?.dispose();

    groupPinFocusNode?.dispose();
    groupPinTextController?.dispose();
  }
}
