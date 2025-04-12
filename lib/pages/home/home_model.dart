import '/backend/supabase/supabase.dart';
import '/components/main_home_app_bar_content_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<LocationItemCountsRow>? mostItems;
  // Model for MainHomeAppBarContent component.
  late MainHomeAppBarContentModel mainHomeAppBarContentModel;

  @override
  void initState(BuildContext context) {
    mainHomeAppBarContentModel =
        createModel(context, () => MainHomeAppBarContentModel());
  }

  @override
  void dispose() {
    mainHomeAppBarContentModel.dispose();
  }
}
