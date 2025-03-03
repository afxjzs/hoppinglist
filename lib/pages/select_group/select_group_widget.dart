import '/auth/custom_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'select_group_model.dart';
export 'select_group_model.dart';

/// Onboarding page where user selects which group they're in
class SelectGroupWidget extends StatefulWidget {
  const SelectGroupWidget({super.key});

  static String routeName = 'SelectGroup';
  static String routePath = '/selectGroup';

  @override
  State<SelectGroupWidget> createState() => _SelectGroupWidgetState();
}

class _SelectGroupWidgetState extends State<SelectGroupWidget> {
  late SelectGroupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectGroupModel());

    _model.groupCodeTextController ??= TextEditingController();
    _model.groupCodeFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Enter Group ID',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/navbar_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'assets/images/nav_icon.png'
                            : 'assets/images/rabbit-dark.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Welcome to Hopping List',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Plus Jakarta Sans',
                        letterSpacing: 0.0,
                      ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: TextFormField(
                          controller: _model.groupCodeTextController,
                          focusNode: _model.groupCodeFocusNode,
                          onFieldSubmitted: (_) async {
                            _model.formOutput = true;
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              safeSetState(() => _model.formOutput = false);
                              return;
                            }

                            safeSetState(() {});
                          },
                          autofocus: false,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.go,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelText: 'Group Code',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Enter Group Code',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Space Grotesk',
                                    fontSize: 44.0,
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.center,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.groupCodeTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]'))
                          ],
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Function() _navigate = () {};
                          _model.validatedFormOutput = true;
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            safeSetState(
                                () => _model.validatedFormOutput = false);
                            return;
                          }
                          _model.queryResult = await GroupsTable().queryRows(
                            queryFn: (q) => q.ilike(
                              'code',
                              _model.groupCodeTextController.text,
                            ),
                          );
                          if (_model.queryResult?.length == 1) {
                            FFAppState().groupcode =
                                _model.queryResult!.firstOrNull!.code!;
                            FFAppState().groupname =
                                _model.queryResult!.firstOrNull!.name!;
                            FFAppState().groupid =
                                _model.queryResult!.firstOrNull!.id;
                            safeSetState(() {});
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signIn(
                              authenticationToken: FFAppState().groupcode,
                              refreshToken: FFAppState().groupcode,
                              tokenExpiration: functions.oneYearFromNow(),
                              authUid: _model.queryResult?.firstOrNull?.id
                                  .toString(),
                            );
                            _navigate = () => context.goNamedAuth(
                                HomePageWidget.routeName, context.mounted);
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Group Not Found'),
                                  content: Text(
                                      'Sorry, that is not a valid group name. Please try again.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          _navigate();

                          safeSetState(() {});
                        },
                        text: 'Join',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Space Grotesk',
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
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
