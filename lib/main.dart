import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/binding/home_binding.dart';
import 'package:news/controller/storage_controller.dart';
import 'package:news/view/home.dart';

void main() {
  Get.put(StorageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      initialBinding: HomeBinding(),
    );
  }
}
