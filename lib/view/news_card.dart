import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/storage_controller.dart';
import 'package:news/view/news_data.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const NewsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    Image storyImage = Image.network(
      data['imageUrl'] ?? "",
      fit: BoxFit.cover,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
            bottom: 20.0,
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(() => NewsData(data: data));
            },
            child: Container(
              height: Get.mediaQuery.size.height * 0.75,
              width: Get.mediaQuery.size.width - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pinkAccent,
                    Colors.indigo,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.mediaQuery.size.height * 0.5,
                      width: Get.mediaQuery.size.width - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: storyImage,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        data['title'].trim(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          if (StorageController.instance
                              .exists(data['title'])) {
                            StorageController.instance
                                .deleteArticle(data['title']);
                          } else {
                            StorageController.instance.saveArticle(data);
                          }
                        },
                        icon: Obx(
                          () => StorageController.instance.bookmarkedStoriesKey
                                  .contains(data['title'])
                              ? const Icon(Icons.bookmark)
                              : const Icon(Icons.bookmark_outline),
                        ),
                        iconSize: 40.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
