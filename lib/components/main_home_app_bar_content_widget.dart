import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_home_app_bar_content_model.dart';
export 'main_home_app_bar_content_model.dart';

/// The main app bar content with settings on it
class MainHomeAppBarContentWidget extends StatefulWidget {
  const MainHomeAppBarContentWidget({super.key});

  @override
  State<MainHomeAppBarContentWidget> createState() =>
      _MainHomeAppBarContentWidgetState();
}

class _MainHomeAppBarContentWidgetState
    extends State<MainHomeAppBarContentWidget> {
  late MainHomeAppBarContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainHomeAppBarContentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.asset(
              'assets/images/nav_icon.png',
              height: 24.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Hopping List',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).alwaysLight,
                letterSpacing: 0.0,
                fontWeight:
                    FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                fontStyle:
                    FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
        ),
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.settings_rounded,
            color: FlutterFlowTheme.of(context).alwaysLight,
            size: 24.0,
          ),
          onPressed: () async {
            context.pushNamed(SettingsWidget.routeName);
          },
        ),
      ],
    );
  }
}
