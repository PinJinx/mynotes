import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class mynote {
  @HiveField(0)
  int key;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String date;
  mynote(
      {required this.key,
      required this.title,
      required this.content,
      required this.date});
}
