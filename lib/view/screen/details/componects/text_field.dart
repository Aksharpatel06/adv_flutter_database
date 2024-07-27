import 'package:adv_flutter_database/view/controller/data_controller.dart';
import 'package:flutter/material.dart';


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
              border: UnderlineInputBorder(),
              hintText: 'Discription'),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
