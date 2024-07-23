import 'package:adv_flutter_database/view/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      floatingActionButton: FloatingActionButton(
         onPressed: dataController.data,
      ),
    );
  }
}
