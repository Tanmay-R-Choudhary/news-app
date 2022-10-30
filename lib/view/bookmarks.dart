import 'package:flutter/material.dart';
import 'package:news/controller/storage_controller.dart';
import 'package:news/view/bookmarks_card.dart';
import 'package:get/get.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple,
            Colors.cyan.shade300,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Your bookmarks",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40.0),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        StorageController.instance.bookmarkedStoriesKey.length,
                    itemBuilder: (context, index) {
                      return BookmarksCard(
                          title: StorageController
                              .instance.bookmarkedStoriesKey.value[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
