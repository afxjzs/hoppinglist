import '/backend/supabase/supabase.dart';
import '/components/edit_item_list/edit_item_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_items_model.dart';
export 'list_items_model.dart';

/// List of the items
class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({super.key});

  static String routeName = 'ListItems';
  static String routePath = '/listItems';

  @override
  State<ListItemsWidget> createState() => _ListItemsWidgetState();
}

class _ListItemsWidgetState extends State<ListItemsWidget> {
  late ListItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Edit Items',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).alwaysLight,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            ToggleIcon(
              onPressed: () async {
                safeSetState(
                    () => FFAppState().darkmode = !FFAppState().darkmode);
                setDarkModeSetting(
                  context,
                  FFAppState().darkmode ? ThemeMode.dark : ThemeMode.light,
                );
              },
              value: FFAppState().darkmode,
              onIcon: Icon(
                Icons.wb_sunny_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              offIcon: Icon(
                Icons.dark_mode_outlined,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/navbar_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StreamBuilder<List<ItemsRow>>(
                          stream: _model.containerSupabaseStream ??= SupaFlow
                              .client
                              .from("items")
                              .stream(primaryKey: ['id'])
                              .eqOrNull(
                                'group_id',
                                FFAppState().groupid,
                              )
                              .map((list) =>
                                  list.map((item) => ItemsRow(item)).toList()),
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
                            List<ItemsRow> editItemListItemsRowList =
                                snapshot.data!;

                            return wrapWithModel(
                              model: _model.editItemListModel,
                              updateCallback: () => safeSetState(() {}),
                              child: EditItemListWidget(
                                parameter1:
                                    editItemListItemsRowList.firstOrNull?.name,
                                parameter2:
                                    editItemListItemsRowList.firstOrNull?.notes,
                                parameter3: editItemListItemsRowList
                                    .firstOrNull?.locations.firstOrNull,
                                parameter4:
                                    editItemListItemsRowList.firstOrNull?.id,
                              ),
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 44.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(AddItemWidget.routeName);
                    },
                    text: 'Add New Item',
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: FlutterFlowTheme.of(context).alwaysLight,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Space Grotesk',
                                color: FlutterFlowTheme.of(context).alwaysLight,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(44.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
