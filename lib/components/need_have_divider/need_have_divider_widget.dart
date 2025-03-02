import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'need_have_divider_model.dart';
export 'need_have_divider_model.dart';

class NeedHaveDividerWidget extends StatefulWidget {
  const NeedHaveDividerWidget({super.key});

  @override
  State<NeedHaveDividerWidget> createState() => _NeedHaveDividerWidgetState();
}

class _NeedHaveDividerWidgetState extends State<NeedHaveDividerWidget> {
  late NeedHaveDividerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NeedHaveDividerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_drop_up,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              Text(
                'Need   |   Have',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Space Grotesk',
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
