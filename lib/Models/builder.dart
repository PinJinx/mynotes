import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/Models/data.dart';

class BuildNotes {
  Widget notes() {
    List<mynote> allnotes = Hive.box<mynote>('mynotes').values.toList();
    return Expanded(
      child: GestureDetector(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: allnotes.length,
          itemBuilder: (context, i) {
            return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    allnotes[i].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    allnotes[i].date,
                    style: TextStyle(color: Colors.black54),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(
                    allnotes[i].content,
                    style: TextStyle(color: Colors.black54),
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  addnote() async {
    DateTime today = DateTime.now();
    var note = Hive.box<mynote>('mynotes');
    mynote nt = mynote(
        key: note.values.toList().length + 1,
        title: "Untitled",
        content: "",
        date: "${today.day}/${today.month}/${today.year}");
    note.add(nt);
  }
}
