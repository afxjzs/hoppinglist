import '/backend/supabase/supabase.dart';
import '/components/main_home_app_bar_content_widget.dart';
import '/components/need_have_divider/need_have_divider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'main_list_widget.dart' show MainListWidget;
import 'package:flutter/material.dart';

class MainListModel extends FlutterFlowModel<MainListWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<LocationsRow>>? mainListSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in MainList widget.
  List<LocationItemCountsRow>? mostItems;
  // Model for MainHomeAppBarContent component.
  late MainHomeAppBarContentModel mainHomeAppBarContentModel;
  // State field(s) for LocationSelector widget.
  String? locationSelectorValue;
  FormFieldController<String>? locationSelectorValueController;
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
    mainHomeAppBarContentModel =
        createModel(context, () => MainHomeAppBarContentModel());
    needHaveDividerModel = createModel(context, () => NeedHaveDividerModel());
  }

  @override
  void dispose() {
    mainHomeAppBarContentModel.dispose();
    needHaveDividerModel.dispose();
  }
}
