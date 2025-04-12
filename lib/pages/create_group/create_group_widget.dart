import '/auth/custom_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'create_group_model.dart';
export 'create_group_model.dart';

/// Onboarding page where user selects which group they're in
class CreateGroupWidget extends StatefulWidget {
  const CreateGroupWidget({super.key});

  static String routeName = 'CreateGroup';
  static String routePath = '/createGroup';

  @override
  State<CreateGroupWidget> createState() => _CreateGroupWidgetState();
}

class _CreateGroupWidgetState extends State<CreateGroupWidget> {
  late CreateGroupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGroupModel());

    _model.groupCodeTextController ??= TextEditingController();
    _model.groupCodeFocusNode ??= FocusNode();

    _model.groupPinTextController ??= TextEditingController();
    _model.groupPinFocusNode ??= FocusNode();
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
            'Create a New Group',
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
                            hintText: 'Choose a group code',
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
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.center,
                          maxLength: 12,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.groupCodeTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]'))
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: TextFormField(
                          controller: _model.groupPinTextController,
                          focusNode: _model.groupPinFocusNode,
                          onFieldSubmitted: (_) async {
                            _model.formOutputPIN = true;
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              safeSetState(() => _model.formOutputPIN = false);
                              return;
                            }

                            safeSetState(() {});
                          },
                          autofocus: false,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.go,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelText: 'Group PIN',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  letterSpacing: 0.0,
                                ),
                            alignLabelWithHint: false,
                            hintText: '...and a PIN to secure it',
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
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.center,
                          maxLength: 4,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.groupPinTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          _model.validatedFormOutput = true;
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            safeSetState(
                                () => _model.validatedFormOutput = false);
                            return;
                          }
                          _model.uniqueGroupCodeCheck =
                              await GroupsTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'code',
                              _model.groupCodeTextController.text,
                            ),
                          );
                          if (_model.uniqueGroupCodeCheck!.length > 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Group Code is Taken',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .alwaysLight,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            _model.insertResult = await GroupsTable().insert({
                              'code': _model.groupCodeTextController.text,
                              'pin': _model.groupPinTextController.text,
                              'name': random_data.randomString(
                                4,
                                12,
                                true,
                                false,
                                false,
                              ),
                            });
                            FFAppState().groupcode = _model.insertResult!.code!;
                            FFAppState().groupname = _model.insertResult!.name!;
                            FFAppState().groupid = _model.insertResult!.id;
                            safeSetState(() {});
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signIn(
                              authenticationToken: FFAppState().groupcode,
                              refreshToken: FFAppState().groupcode,
                              tokenExpiration: functions.oneYearFromNow(),
                              authUid: _model.insertResult?.id.toString(),
                            );

                            context.pushNamedAuth(
                                AddLocationWidget.routeName, context.mounted);
                          }

                          safeSetState(() {});
                        },
                        text: 'Create Group',
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already in a group? ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Space Grotesk',
                            letterSpacing: 0.0,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(JoinGroupWidget.routeName);
                      },
                      child: Text(
                        'Join here',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Space Grotesk',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
