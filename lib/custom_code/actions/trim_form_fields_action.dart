// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

// Keep all imports above...

Future<dynamic> trimFormFieldsAction(dynamic formOutput) async {
  final trimmed = <String, dynamic>{};

  (formOutput as Map<String, dynamic>).forEach((key, value) {
    trimmed[key] = (value is String) ? value.trim() : value;
  });

  return trimmed;
}
