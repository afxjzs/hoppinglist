import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_location_widget.dart' show EditLocationWidget;
import 'package:flutter/material.dart';

class EditLocationModel extends FlutterFlowModel<EditLocationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for locationName widget.
  FocusNode? locationNameFocusNode;
  TextEditingController? locationNameTextController;
  String? Function(BuildContext, String?)? locationNameTextControllerValidator;
  String? _locationNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'name is required';
    }

    if (val.length < 2) {
      return 'Need 2 characters';
    }

    return null;
  }

  // State field(s) for locationNotes widget.
  FocusNode? locationNotesFocusNode;
  TextEditingController? locationNotesTextController;
  String? Function(BuildContext, String?)? locationNotesTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<LocationsRow>? locationUpdateOutput;
  // Stores action output result for [Backend Call - Delete Row(s)] action in deleteItem widget.
  List<LocationsRow>? deletedItem;

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
