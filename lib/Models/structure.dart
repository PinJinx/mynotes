import 'package:hive/hive.dart';

part 'structure.g.dart';
@HiveType(typeId: 0)
class Note{
  @HiveField(0)
  String Title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  Note({required this.Title,required this.content,required this.date});
}