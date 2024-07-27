import 'package:adv_flutter_database/view/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';
import '../../details/details_screen.dart';

Padding titleDiscipationText(DataController dataController, int index) {
  return Padding(
    padding:
    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
    child: Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              dataController.isUpdate.value = true;
              dataController.editData(index);
              Get.to(const DetailsScreen(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.circularReveal);
            },
            backgroundColor: Colors.grey.shade800,
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(8),
          ),
          SlidableAction(
            onPressed: (context) {
              dataController.deleteData(dataController.list[index]['id']);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: countinerColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: ListTile(
            // text
            title: Text(
              dataController.list[index]['title'],
            ),
            subtitle:
            Text(dataController.list[index]['subtitle']),
          ),
        ),
      ),
    ),
  );
}
