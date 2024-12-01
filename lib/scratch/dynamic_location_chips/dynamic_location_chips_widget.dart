import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dynamic_location_chips_model.dart';
export 'dynamic_location_chips_model.dart';

class DynamicLocationChipsWidget extends StatefulWidget {
  const DynamicLocationChipsWidget({
    super.key,
    this.parameter1,
  });

  final List<String>? parameter1;

  @override
  State<DynamicLocationChipsWidget> createState() =>
      _DynamicLocationChipsWidgetState();
}

class _DynamicLocationChipsWidgetState
    extends State<DynamicLocationChipsWidget> {
  late DynamicLocationChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicLocationChipsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FutureBuilder<List<UniqueLocationsViewRow>>(
        future: UniqueLocationsViewTable().queryRows(
          queryFn: (q) => q,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<UniqueLocationsViewRow>
              dynamicChoiceChipsUniqueLocationsViewRowList = snapshot.data!;

          return FlutterFlowChoiceChips(
            options: dynamicChoiceChipsUniqueLocationsViewRowList
                .map((e) => e.uniqueLocation)
                .withoutNulls
                .toList()
                .map((label) => ChipData(label))
                .toList(),
            onChanged: (val) =>
                safeSetState(() => _model.dynamicChoiceChipsValues = val),
            selectedChipStyle: ChipStyle(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Space Grotesk',
                    color: FlutterFlowTheme.of(context).info,
                    letterSpacing: 0.0,
                  ),
              iconColor: FlutterFlowTheme.of(context).info,
              iconSize: 16.0,
              elevation: 0.0,
              borderRadius: BorderRadius.circular(8.0),
            ),
            unselectedChipStyle: ChipStyle(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Space Grotesk',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
              iconColor: FlutterFlowTheme.of(context).secondaryText,
              iconSize: 16.0,
              elevation: 0.0,
              borderRadius: BorderRadius.circular(8.0),
            ),
            chipSpacing: 8.0,
            rowSpacing: 8.0,
            multiselect: true,
            initialized: _model.dynamicChoiceChipsValues != null,
            alignment: WrapAlignment.start,
            controller: _model.dynamicChoiceChipsValueController ??=
                FormFieldController<List<String>>(
              [],
            ),
            wrapped: false,
          );
        },
      ),
    );
  }
}
