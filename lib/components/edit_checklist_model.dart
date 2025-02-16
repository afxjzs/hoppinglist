import '/components/edit_checklist_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_checklist_widget.dart' show EditChecklistWidget;
import 'package:flutter/material.dart';

class EditChecklistModel extends FlutterFlowModel<EditChecklistWidget> {
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

  // Models for EditChecklistItem dynamic component.
  late FlutterFlowDynamicModels<EditChecklistItemModel> editChecklistItemModels;

  @override
  void initState(BuildContext context) {
    editChecklistItemModels =
        FlutterFlowDynamicModels(() => EditChecklistItemModel());
  }

  @override
  void dispose() {
    editChecklistItemModels.dispose();
  }
}
