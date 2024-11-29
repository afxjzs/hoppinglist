import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'alt_home_model.dart';
export 'alt_home_model.dart';

class AltHomeWidget extends StatefulWidget {
  const AltHomeWidget({super.key});

  @override
  State<AltHomeWidget> createState() => _AltHomeWidgetState();
}

class _AltHomeWidgetState extends State<AltHomeWidget> {
  late AltHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AltHomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Alt Home',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.add_circle_outline,
                color: FlutterFlowTheme.of(context).info,
                size: 40.0,
              ),
              onPressed: () async {
                context.pushNamed('AddItem');
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<List<ItemsRow>>(
                future: ItemsTable().queryRows(
                  queryFn: (q) =>
                      q.order('needed').order('name', ascending: true),
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
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewItemsRowList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewItemsRow =
                          listViewItemsRowList[listViewIndex];
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listViewItemsRow.name,
                                            'ok',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listViewItemsRow.notes,
                                            '...',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Text(
                                          listViewItemsRow.locations.first,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: const CheckboxThemeData(
                                      visualDensity: VisualDensity.standard,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.padded,
                                      shape: CircleBorder(),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValueMap[
                                            listViewItemsRow] ??=
                                        !listViewItemsRow.needed,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValueMap[
                                              listViewItemsRow] = newValue!);
                                      if (newValue!) {
                                        // Mark Item As Needed
                                        await ItemsTable().update(
                                          data: {
                                            'needed': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            listViewItemsRow.id,
                                          ),
                                        );
                                      } else {
                                        // Mark Item As Aquired
                                        await ItemsTable().update(
                                          data: {
                                            'needed': true,
                                            'last_needed_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            listViewItemsRow.id,
                                          ),
                                        );
                                      }
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
