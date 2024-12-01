import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dynamic_location_chips_widget.dart' show DynamicLocationChipsWidget;
import 'package:flutter/material.dart';

class DynamicLocationChipsModel
    extends FlutterFlowModel<DynamicLocationChipsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DynamicChoiceChips widget.
  FormFieldController<List<String>>? dynamicChoiceChipsValueController;
  List<String>? get dynamicChoiceChipsValues =>
      dynamicChoiceChipsValueController?.value;
  set dynamicChoiceChipsValues(List<String>? val) =>
      dynamicChoiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
