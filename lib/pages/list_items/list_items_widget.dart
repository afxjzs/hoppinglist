import '/backend/supabase/supabase.dart';
import '/components/edit_checklist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'list_items_model.dart';
export 'list_items_model.dart';

/// List of the items
class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({super.key});

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
              context.pushNamed('HomePage');
            },
          ),
          title: Text(
            'Select Item to Edit',
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
                              .order('last_needed_at')
                              .order('name', ascending: true)
                              .map((list) =>
                                  list.map((item) => ItemsRow(item)).toList()),
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
                            List<ItemsRow> editChecklistItemsRowList =
                                snapshot.data!;

                            return wrapWithModel(
                              model: _model.editChecklistModel,
                              updateCallback: () => safeSetState(() {}),
                              child: EditChecklistWidget(
                                parameter1:
                                    editChecklistItemsRowList.firstOrNull?.name,
                                parameter2: editChecklistItemsRowList
                                    .firstOrNull?.notes,
                                parameter3: editChecklistItemsRowList
                                    .firstOrNull?.locations.firstOrNull,
                                parameter4:
                                    editChecklistItemsRowList.firstOrNull?.id,
                              ),
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 16.0)),
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
