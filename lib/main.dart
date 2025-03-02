import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mynotes/Models/structure.dart';
import 'package:mynotes/Pages/note_editor.dart';
import 'package:mynotes/Pages/notes.dart';
import 'package:mynotes/theme/theme.dart';
import 'package:hive/hive.dart';



void main() async{
  //Getting Data from Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
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
  final pages = [NotePage(),NoteEditor()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[0],
      ),
    );
  }
}
