import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_have_model.dart';
export 'empty_have_model.dart';

class EmptyHaveWidget extends StatefulWidget {
  const EmptyHaveWidget({super.key});

  @override
  State<EmptyHaveWidget> createState() => _EmptyHaveWidgetState();
}

class _EmptyHaveWidgetState extends State<EmptyHaveWidget> {
  late EmptyHaveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyHaveModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Icon(
              Icons.no_food_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 72.0,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'Cupboard is Bare',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
