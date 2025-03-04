import 'package:hive/hive.dart';
import 'package:mynotes/features/notes/data/data.dart';

class NoteModel {
  static void saveNotes(
      {required int key, String title = "", String content = ""}) {
    var box = Hive.box<mynote>('mynotes');
    mynote? nt = box.get(key);
    if (nt != null) {
      nt.title = title;
      nt.content = content;
      box.put(key, nt);
    }
  }

  addnote() async {
    DateTime today = DateTime.now();
    var note = Hive.box<mynote>('mynotes');
    mynote nt = mynote(
        key: note.values.toList().length + 1,
        title: "Untitled",
        content: "",
        date: "${today.day}/${today.month}/${today.year}");
    note.put(nt.key, nt);
  }

  removenote({required int key}) async {
    var box = Hive.box<mynote>('mynotes');
    box.delete(key);
  }
}
