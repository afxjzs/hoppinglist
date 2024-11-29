import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://vcqkmqtggktqgaykruca.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZjcWttcXRnZ2t0cWdheWtydWNhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MjI2NzUsImV4cCI6MjA0ODM5ODY3NX0.CRcheZ7Jt3HFqvcQNHtAQWaTf27347ScVBMotxmSjTY';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
