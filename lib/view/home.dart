import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:news/controller/home_controller.dart';
import 'package:news/view/news_card.dart';
import 'package:news/view/topic_bar.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

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
          child: Stack(
            children: [
              SizedBox(
                height: Get.mediaQuery.size.height,
                width: Get.mediaQuery.size.width,
                child: Obx(
                  () => ListView.builder(
                    controller: controller.controller,
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.newsRes.value.length,
                    padding:
                        EdgeInsets.only(top: Get.mediaQuery.size.height * 0.12),
                    itemBuilder: (context, index) {
                      return NewsCard(
                        data: controller.newsRes[index],
                      );
                    },
                  ),
                ),
              ),
              const TopicBar(),
            ],
          ),
        ),
      ),
    );
  }
}
