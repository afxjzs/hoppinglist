import '/flutter_flow/flutter_flow_util.dart';
import 'list_items_all_widget.dart' show ListItemsAllWidget;
import 'package:flutter/material.dart';

class ListItemsAllModel extends FlutterFlowModel<ListItemsAllWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
