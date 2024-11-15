import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/app.dart';
import 'package:food_app/core/secrets/secret_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // initialize all widgtes and dependencies
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase setup
  await Supabase.initialize(
    anonKey: API_KEY,
    url: PROJECT_URL,
  );
  runApp(const ProviderScope(child: MyApp()));
}
