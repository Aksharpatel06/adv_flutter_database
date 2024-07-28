import 'package:adv_flutter_database/view/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column textField(DataController dataController) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: dataController.txtTitle,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(), hintText: 'Title'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          maxLines: 4,
          minLines: 1,
          textInputAction: TextInputAction.done,
          controller: dataController.txtDiscription,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(), hintText: 'Discription'),
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 5),
            child: Text('Priority :'),
          ),
          SizedBox(
            width: 200,
            child: Obx(
              () => Column(
                children: [
                  RadioListTile(
                    value: "High",
                    groupValue: dataController.priority.value,
                    onChanged: (value) {
                      dataController.upadatePriority(value);
                    },
                    title: const Text('High'),
                  ),
                  RadioListTile(
                    value: "Medium",
                    groupValue: dataController.priority.value,
                    onChanged: (value) {
                      dataController.upadatePriority(value);
                    },
                    title: const Text('Medium'),
                  ),
                  RadioListTile(
                    value: "Low",
                    groupValue: dataController.priority.value,
                    onChanged: (value) {
                      dataController.upadatePriority(value);
                    },
                    title: const Text('Low'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
