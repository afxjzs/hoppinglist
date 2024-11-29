import '/flutter_flow/flutter_flow_util.dart';
import 'wrap_locations_widget.dart' show WrapLocationsWidget;
import 'package:flutter/material.dart';

class WrapLocationsModel extends FlutterFlowModel<WrapLocationsWidget> {
  ///  Local state fields for this component.

  List<String> locations = [];
  void addToLocations(String item) => locations.add(item);
  void removeFromLocations(String item) => locations.remove(item);
  void removeAtIndexFromLocations(int index) => locations.removeAt(index);
  void insertAtIndexInLocations(int index, String item) =>
      locations.insert(index, item);
  void updateLocationsAtIndex(int index, Function(String) updateFn) =>
      locations[index] = updateFn(locations[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
