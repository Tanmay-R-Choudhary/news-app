import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/home_controller.dart';
import 'package:news/view/bookmarks.dart';

class TopicBar extends StatelessWidget {
  const TopicBar({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonSize = 50;
    double widgetHeight = 50;
    double horizontalPadding = 30;
    double widgetSpacing = 10;

    final HomeController controller = Get.find();

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20.0),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: (0.5 * (buttonSize - widgetHeight)).abs(),
                right: widgetSpacing,
              ),
              height: widgetHeight,
              width: Get.mediaQuery.size.width -
                  (horizontalPadding * 2 + widgetSpacing * 2) -
                  buttonSize * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Obx(
                    () => DropdownButton(
                      underline: const SizedBox(),
                      elevation: 24,
                      isExpanded: true,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: controller.newsCategory.value,
                      items: controller.categories
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.newsCategory.value = value.toString();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: buttonSize,
              width: buttonSize,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(buttonSize * 0.3),
              ),
              child: Obx(
                () => controller.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : Center(
                        child: IconButton(
                          onPressed: () {
                            controller.getNews();
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: buttonSize,
              width: buttonSize,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(buttonSize * 0.3),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Get.to(() => Bookmarks());
                  },
                  icon: const Icon(Icons.bookmark_outline),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
