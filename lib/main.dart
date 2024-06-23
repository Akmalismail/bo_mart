import 'package:bo_mart/app/app.dart';
import 'package:bo_mart/app/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupAppDependencies();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
