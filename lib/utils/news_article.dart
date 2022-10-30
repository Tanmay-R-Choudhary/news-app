import 'package:hive/hive.dart';
part 'news_article.g.dart';

@HiveType(typeId: 0)
class NewsArticle extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String author;
  @HiveField(3)
  String imageUrl;
  @HiveField(4)
  String readMoreUrl;

  NewsArticle(
      {required this.author,
      required this.content,
      required this.imageUrl,
      required this.readMoreUrl,
      required this.title});

  Map<String, String> toMap() {
    return {
      'title': title,
      'content': content,
      'author': author,
      'imageUrl': imageUrl,
      'readMoreUrl': readMoreUrl,
    };
  }
}
