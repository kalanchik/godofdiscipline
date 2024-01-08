import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/firebase_options.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }
}
