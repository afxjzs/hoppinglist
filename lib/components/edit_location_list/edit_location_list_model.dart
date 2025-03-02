import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_location_list_widget.dart' show EditLocationListWidget;
import 'package:flutter/material.dart';

class EditLocationListModel extends FlutterFlowModel<EditLocationListWidget> {
  ///  Local state fields for this component.

  List<dynamic> listLocationData = [];
  void addToListLocationData(dynamic item) => listLocationData.add(item);
  void removeFromListLocationData(dynamic item) =>
      listLocationData.remove(item);
  void removeAtIndexFromListLocationData(int index) =>
      listLocationData.removeAt(index);
  void insertAtIndexInListLocationData(int index, dynamic item) =>
      listLocationData.insert(index, item);
  void updateListLocationDataAtIndex(int index, Function(dynamic) updateFn) =>
      listLocationData[index] = updateFn(listLocationData[index]);

  ///  State fields for stateful widgets in this component.

  Stream<List<LocationItemCountsRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
