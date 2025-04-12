import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_recently_added_items_model.dart';
export 'no_recently_added_items_model.dart';

/// used on homescreen for no recently added items
class NoRecentlyAddedItemsWidget extends StatefulWidget {
  const NoRecentlyAddedItemsWidget({super.key});

  @override
  State<NoRecentlyAddedItemsWidget> createState() =>
      _NoRecentlyAddedItemsWidgetState();
}

class _NoRecentlyAddedItemsWidgetState
    extends State<NoRecentlyAddedItemsWidget> {
  late NoRecentlyAddedItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoRecentlyAddedItemsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Icon(
              Icons.no_food_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 64.0,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'No items have been recently \nmarked as needed',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Space Grotesk',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
