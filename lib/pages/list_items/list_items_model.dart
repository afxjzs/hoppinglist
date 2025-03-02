import '/backend/supabase/supabase.dart';
import '/components/edit_item_list/edit_item_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_items_widget.dart' show ListItemsWidget;
import 'package:flutter/material.dart';

class ListItemsModel extends FlutterFlowModel<ListItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EditItemList component.
  late EditItemListModel editItemListModel;
  Stream<List<ItemsRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {
    editItemListModel = createModel(context, () => EditItemListModel());
  }

  @override
  void dispose() {
    editItemListModel.dispose();
  }
}
