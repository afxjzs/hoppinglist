import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_item_widget.dart' show AddItemWidget;
import 'package:flutter/material.dart';

class AddItemModel extends FlutterFlowModel<AddItemWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for itemName widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  String? _itemNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Item Name is required';
    }

    return null;
  }

  // State field(s) for itemNotes widget.
  FocusNode? itemNotesFocusNode;
  TextEditingController? itemNotesTextController;
  String? Function(BuildContext, String?)? itemNotesTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {
    itemNameTextControllerValidator = _itemNameTextControllerValidator;
  }

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    itemNotesFocusNode?.dispose();
    itemNotesTextController?.dispose();
  }
}
