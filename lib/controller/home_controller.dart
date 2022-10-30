import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var categories = [
    'All',
    'National',
    'Business',
    'Sports',
    'World',
    'Politics',
    'Technology',
    'StartUp',
    'Entertainment',
    'Miscellaneous',
    'Hatke',
    'Science',
    'Automobile'
  ];

  var newsRes = [].obs;

  var newsCategory = "All".obs;

  var isLoading = false.obs;

  ScrollController controller = ScrollController();

  @override
  onReady() async {
    await getNews();
  }

  Future<void> getNews() async {
    isLoading.value = true;
    var url = Uri.https('inshorts.deta.dev', '/news',
        {'category': newsCategory.value.toLowerCase()});

    var response = await http.get(url).whenComplete(() {
      isLoading.value = false;
      controller.jumpTo(0);
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      newsRes.value = jsonResponse['data'];
    } else {
      Get.snackbar(
        "Error",
        "Request failed with status: ${response.statusCode}",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        borderColor: Colors.black,
        borderWidth: 2.0,
      );
    }
  }

  void openLink(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  }
}
