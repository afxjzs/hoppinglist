import '/backend/supabase/supabase.dart';
import '/components/need_have_divider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for CheckboxListTile widget.
  Map<ItemsRow, bool> checkboxListTileValueMap1 = {};
  List<ItemsRow> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Model for needHaveDivider component.
  late NeedHaveDividerModel needHaveDividerModel;
  // State field(s) for CheckboxListTile widget.
  Map<ItemsRow, bool> checkboxListTileValueMap2 = {};
  List<ItemsRow> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {
    needHaveDividerModel = createModel(context, () => NeedHaveDividerModel());
  }

  @override
  void dispose() {
    needHaveDividerModel.dispose();
  }
}
