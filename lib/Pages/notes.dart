import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/Components/appbar.dart';
import 'package:mynotes/Components/navbars.dart';
import 'package:mynotes/Models/builder.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  AppBars bar = AppBars();
  navbars b_bar = navbars();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    BuildNotes notes = BuildNotes();
    return Scaffold(
      appBar: bar.MenuBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10,
              children: [
                SvgPicture.asset(
                  "assets/Create.svg",
                  width: 36,
                  height: 36,
                ),
                Text(
                  "MyNotes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                    decoration: InputDecoration(
                        icon: SvgPicture.asset('assets/Search.svg'),
                        hintText: "Search",
                        border: InputBorder.none)),
              ),
            ),
          ),
          notes.notes(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        shape: CircleBorder(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: b_bar.MenuBar(),
    );
  }
}
