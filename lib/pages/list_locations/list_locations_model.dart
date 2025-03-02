import '/backend/supabase/supabase.dart';
import '/components/edit_location_list/edit_location_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_locations_widget.dart' show ListLocationsWidget;
import 'package:flutter/material.dart';

class ListLocationsModel extends FlutterFlowModel<ListLocationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EditLocationList component.
  late EditLocationListModel editLocationListModel;
  Stream<List<LocationItemCountsRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {
    editLocationListModel = createModel(context, () => EditLocationListModel());
  }

  @override
  void dispose() {
    editLocationListModel.dispose();
  }
}
