import 'package:flutter/material.dart';
import 'package:mynotes/Components/appbar.dart';
import 'package:mynotes/features/notes/application/functions.dart';
import 'dart:async';
import 'package:mynotes/features/notes/data/data.dart';
import 'package:mynotes/theme/theme.dart';
import 'package:provider/provider.dart';

class NoteEditor extends StatefulWidget {
  final mynote selectedNote;
  const NoteEditor({super.key, required this.selectedNote});
  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  AppBars bar = AppBars();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.selectedNote.title;
    contentController.text = widget.selectedNote.content;
  }

  Timer? _debounce;
  void saveChanges() {
    NoteModel.saveNotes(
        key: widget.selectedNote.key,
        title: titleController.text,
        content: contentController.text);
  }

  void _onTextChanged() {
    _debounce?.cancel();
    setState(() {});
    _debounce = Timer(Duration(milliseconds: 500), saveChanges);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void toggleTheme() {
      final theme = Provider.of<SetThemeMode>(context, listen: false);
      theme.toggleTheme();
    }

    return Scaffold(
      appBar: bar.NoteEditorBar(toggleTheme: toggleTheme),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(fontSize: 40),
              controller: titleController,
              onEditingComplete: saveChanges,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
            Text(
                "${widget.selectedNote.date} | ${contentController.text.length} characters"),
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: 20),
                maxLines: null,
                expands: true,
                controller: contentController,
                onChanged: (val) => _onTextChanged(),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Start typing here....",
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
