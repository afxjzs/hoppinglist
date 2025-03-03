import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_item_widget.dart' show EditItemWidget;
import 'package:flutter/material.dart';

class EditItemModel extends FlutterFlowModel<EditItemWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for itemName widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  String? _itemNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'name is required';
    }

    if (val.length < 2) {
      return 'More than 2 characters';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  Stream<List<LocationsRow>>? checkboxGroupSupabaseStream;
  // Stores action output result for [Backend Call - Delete Row(s)] action in deleteItem widget.
  List<ItemsRow>? deletedItem;

  @override
  void initState(BuildContext context) {
    itemNameTextControllerValidator = _itemNameTextControllerValidator;
  }

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
