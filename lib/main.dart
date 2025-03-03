import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mynotes/Models/data.dart';
import 'package:mynotes/Pages/note_editor.dart';
import 'package:mynotes/Pages/notes.dart';
import 'package:mynotes/theme/theme.dart';

void main() async {
  //Getting Data from Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(mynoteAdapter());
  await Hive.openBox<mynote>('mynotes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mynotes',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
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
  final pages = [NotePage(), NoteEditor()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[0],
      ),
    );
  }
}
