import 'package:adv_flutter_database/view/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../details/details_screen.dart';
import 'componects/title_discipation_text.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        backgroundColor: secounderyColor,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'TODO',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: dataController.list.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return titleDiscipationText(dataController, index);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataController.isUpdate.value = false;
          Get.to(() => const DetailsScreen(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.circularReveal);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
