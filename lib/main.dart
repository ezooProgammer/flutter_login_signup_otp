
import 'package:app_test/core/di/injection_container.dart';
import 'package:app_test/run_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة كافة التبعيات في GetIt
  await initDependencies();
  runApp(const RunApp());
}
