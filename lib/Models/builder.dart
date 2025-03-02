import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/Models/structure.dart';

class BuildNotes{
  GridView notes(){
    List<Note> allnotes = Hive.box<Note>('notes').values.toList();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2,),
        itemCount: allnotes.length,
        itemBuilder: (context , i) =>
        Column(
            children: [
              Text(allnotes[i].Title),
              Text(allnotes[i].content),
            ],
        )
    );
  }
}