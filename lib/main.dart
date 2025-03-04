import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mynotes/features/notes/data/data.dart';
import 'package:mynotes/features/notes/presentation/notes.dart';
import 'package:mynotes/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(mynoteAdapter());
  await Hive.openBox<mynote>('mynotes');

  runApp(
    ChangeNotifierProvider(
      create: (context) => SetThemeMode(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mynotes',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<SetThemeMode>().themeMode,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotePage(),
      ),
    );
  }
}
