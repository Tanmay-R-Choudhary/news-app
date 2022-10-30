import 'package:flutter/material.dart';
import 'package:news/controller/home_controller.dart';
import 'package:get/get.dart';

class NewsData extends StatelessWidget {
  final Map<String, dynamic> data;
  const NewsData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    const Color buttonColor = Color.fromARGB(255, 255, 175, 55);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.pinkAccent, Colors.indigo],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    data['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2.0,
                    ),
                  ),
                  Text(
                    data['content'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    data['author'] ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: Get.mediaQuery.size.width / 2.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                      ),
                      onPressed: () {
                        controller.openLink(data['readMoreUrl'] ?? "");
                      },
                      child: const Text(
                        "Read more",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
