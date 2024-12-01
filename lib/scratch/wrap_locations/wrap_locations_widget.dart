import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'wrap_locations_model.dart';
export 'wrap_locations_model.dart';

class WrapLocationsWidget extends StatefulWidget {
  const WrapLocationsWidget({super.key});

  @override
  State<WrapLocationsWidget> createState() => _WrapLocationsWidgetState();
}

class _WrapLocationsWidgetState extends State<WrapLocationsWidget> {
  late WrapLocationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WrapLocationsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0.0,
      runSpacing: 0.0,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      verticalDirection: VerticalDirection.down,
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: const AlignmentDirectional(1.0, 0.0),
          child: Text(
            '',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Space Grotesk',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
