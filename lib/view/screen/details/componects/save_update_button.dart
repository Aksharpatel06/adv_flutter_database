import 'package:adv_flutter_database/view/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';

GestureDetector saveAndUpdateButton(DataController dataController) {
  return GestureDetector(
    onTap: () {

      if (dataController.isUpdate.value) {
        dataController.updateDataBase();
      } else {
        dataController.initData();
      }
      Get.back();
      dataController.txtTitle.clear();
      dataController.txtDiscription.clear();
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        decoration:
        BoxDecoration(border: Border.all(color: primaryColor)),
        child: Text(
          'Save',
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
