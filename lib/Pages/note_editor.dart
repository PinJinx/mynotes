import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/Components/appbar.dart';
class NoteEditor extends StatefulWidget {
  const NoteEditor({super.key});
  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  @override
  AppBars bar = new AppBars();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar.NoteEditorBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(fontSize: 40),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
            Text("12 feb 2024 | 0characters"),
            TextField(
              style: TextStyle(fontSize: 20),
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Start typing here....",
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
