import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/features/notes/application/functions.dart';
import 'package:mynotes/features/notes/data/data.dart';
import 'package:mynotes/features/notes/presentation/note_editor.dart';

class BuildNotes extends StatefulWidget {
  const BuildNotes({super.key, required this.searchquery});
  final String searchquery;
  @override
  State<BuildNotes> createState() => _BuildNotesState();
}

class _BuildNotesState extends State<BuildNotes> {
  @override
  Widget build(BuildContext context) {
    List<mynote> getnotes = Hive.box<mynote>('mynotes').values.toList();
    List<mynote> allnotes = [];
    for (var i in getnotes) {
      if (i.title.toLowerCase().contains(widget.searchquery.toLowerCase())) {
        allnotes.add(i);
      }
    }
    if (widget.searchquery == "") {
      allnotes = getnotes;
    }
    NoteModel model = NoteModel();

    void editNote(mynote note) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoteEditor(
            selectedNote: note,
          ),
        ),
      );
      setState(() {});
    }

    void rmvnote({required int index}) async {
      await model.removenote(key: allnotes[index].key);
      setState(() {});
    }

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: allnotes.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => editNote(allnotes[i]),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          allnotes[i].title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          maxLines: 1,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => rmvnote(index: i),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey[600],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    allnotes[i].date,
                    style: TextStyle(color: Colors.black54),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      allnotes[i].content,
                      style: TextStyle(color: Colors.black54),
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
