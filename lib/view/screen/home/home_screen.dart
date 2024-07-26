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
        title: const Text('home'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: dataController.list.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(dataController.list[index]['name'],)
              ,trailing: IconButton(
              onPressed: () {
                dataController.deleteData(dataController.list[index]['id']);
              },
              icon: const Icon(Icons.delete),
            ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: dataController.data,
      ),
    );
  }
}
