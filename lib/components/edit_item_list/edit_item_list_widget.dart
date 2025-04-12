import '/backend/supabase/supabase.dart';
import '/components/edit_item_single/edit_item_single_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_item_list_model.dart';
export 'edit_item_list_model.dart';

/// the edit list for the list items
class EditItemListWidget extends StatefulWidget {
  const EditItemListWidget({
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
  State<EditItemListWidget> createState() => _EditItemListWidgetState();
}

class _EditItemListWidgetState extends State<EditItemListWidget> {
  late EditItemListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditItemListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ItemsRow>>(
      future: ItemsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'group_id',
              FFAppState().groupid,
            )
            .order('name', ascending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<ItemsRow> listViewItemsRowList = snapshot.data!;

        return ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewItemsRowList.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.0),
          itemBuilder: (context, listViewIndex) {
            final listViewItemsRow = listViewItemsRowList[listViewIndex];
            return wrapWithModel(
              model: _model.editItemSingleModels.getModel(
                listViewItemsRow.id.toString(),
                listViewIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: EditItemSingleWidget(
                key: Key(
                  'Key6vt_${listViewItemsRow.id.toString()}',
                ),
                parameter1: listViewItemsRow.name,
                parameter2: valueOrDefault<String>(
                  listViewItemsRow.notes,
                  '...',
                ),
                parameter3:
                    listViewItemsRow.locations.take(5).toList().firstOrNull,
                parameter4: listViewItemsRow.id,
              ),
            );
          },
        );
      },
    );
  }
}
