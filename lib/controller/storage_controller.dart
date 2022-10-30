import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news/utils/news_article.dart';

class StorageController extends GetxController {
  static StorageController instance = Get.find();
  late var box;
  late Directory path;

  var bookmarkedStories = {}.obs;
  var bookmarkedStoriesKey = [].obs;

  @override
  void onReady() async {
    super.onReady();
    path = await getApplicationDocumentsDirectory();
    Hive
      ..init(path.path)
      ..registerAdapter(NewsArticleAdapter());
    box = await Hive.openBox('bookmarks');
    bookmarkedStories.value = await box.toMap();
    bookmarkedStoriesKey.value = await box.keys.toList();
    print(bookmarkedStoriesKey.value);
  }

  @override
  void onClose() {
    box.close();
    super.onClose();
  }

  void saveArticle(Map<String, dynamic> data) {
    var article = NewsArticle(
      author: data['author'] ?? "",
      content: data['content'],
      imageUrl: data['imageUrl'] ?? "",
      readMoreUrl: data['readMoreUrl'] ?? "",
      title: data['title'],
    );

    box.put(data['title'], article);
    bookmarkedStories.addAll({data['title']: article.toMap()});
    bookmarkedStoriesKey.add(data['title']);
  }

  void deleteArticle(String title) async {
    box.delete(title);
    bookmarkedStories.remove(title);
    bookmarkedStoriesKey.remove(title);
  }

  bool exists(String title) {
    return box.containsKey(title);
  }
}
