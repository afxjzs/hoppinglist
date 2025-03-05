import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_location_widget.dart' show AddLocationWidget;
import 'package:flutter/material.dart';

class AddLocationModel extends FlutterFlowModel<AddLocationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for locationName widget.
  FocusNode? locationNameFocusNode;
  TextEditingController? locationNameTextController;
  String? Function(BuildContext, String?)? locationNameTextControllerValidator;
  String? _locationNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Item Name is required';
    }

    return null;
  }

  // State field(s) for locationNotes widget.
  FocusNode? locationNotesFocusNode;
  TextEditingController? locationNotesTextController;
  String? Function(BuildContext, String?)? locationNotesTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  LocationsRow? locationAddedResult;

  @override
  void initState(BuildContext context) {
    locationNameTextControllerValidator = _locationNameTextControllerValidator;
  }

  @override
  void dispose() {
    locationNameFocusNode?.dispose();
    locationNameTextController?.dispose();

    locationNotesFocusNode?.dispose();
    locationNotesTextController?.dispose();
  }
}
