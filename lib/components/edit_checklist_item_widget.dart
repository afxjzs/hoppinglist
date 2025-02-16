import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'edit_checklist_item_model.dart';
export 'edit_checklist_item_model.dart';

/// the main piece of a edit item row
class EditChecklistItemWidget extends StatefulWidget {
  const EditChecklistItemWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final int? parameter4;

  @override
  State<EditChecklistItemWidget> createState() =>
      _EditChecklistItemWidgetState();
}

class _EditChecklistItemWidgetState extends State<EditChecklistItemWidget> {
  late EditChecklistItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditChecklistItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'EditItem',
          queryParameters: {
            'itemId': serializeParam(
              widget.parameter4,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      },
      child: Material(
        color: Colors.transparent,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.parameter1!,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        widget.parameter2!,
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Space Grotesk',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        widget.parameter3!,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Space Grotesk',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).accent4,
                      icon: Icon(
                        Icons.edit,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          'EditItem',
                          queryParameters: {
                            'itemId': serializeParam(
                              widget.parameter4,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
