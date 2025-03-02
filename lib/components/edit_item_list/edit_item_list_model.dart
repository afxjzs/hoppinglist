import '/components/edit_item_single/edit_item_single_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_item_list_widget.dart' show EditItemListWidget;
import 'package:flutter/material.dart';

class EditItemListModel extends FlutterFlowModel<EditItemListWidget> {
  ///  Local state fields for this component.

  List<dynamic> listData = [];
  void addToListData(dynamic item) => listData.add(item);
  void removeFromListData(dynamic item) => listData.remove(item);
  void removeAtIndexFromListData(int index) => listData.removeAt(index);
  void insertAtIndexInListData(int index, dynamic item) =>
      listData.insert(index, item);
  void updateListDataAtIndex(int index, Function(dynamic) updateFn) =>
      listData[index] = updateFn(listData[index]);

  ///  State fields for stateful widgets in this component.

  // Models for EditItemSingle dynamic component.
  late FlutterFlowDynamicModels<EditItemSingleModel> editItemSingleModels;

  @override
  void initState(BuildContext context) {
    editItemSingleModels =
        FlutterFlowDynamicModels(() => EditItemSingleModel());
  }

  @override
  void dispose() {
    editItemSingleModels.dispose();
  }
}
