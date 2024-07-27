import 'package:adv_flutter_database/view/helper/data_sarvice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDiscription = TextEditingController();

  RxList list = [].obs;
  RxBool isUpdate = false.obs;
  RxInt updateIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    // selectData();
  }

  void getData() {
    DataService.dataService.createDatabase();
  }

  Future<void> initData() async {
    await DataService.dataService.insertData(txtTitle.text,txtDiscription.text);
    await selectData();
  }

  Future<void> selectData() async {
    list.value = await DataService.dataService.addData();
  }

  void editData(int index) {
    txtTitle = TextEditingController(text: list[index]['title']);
    txtDiscription = TextEditingController(text: list[index]['subtitle']);
    updateIndex.value = index;
  }

  Future<void> deleteData(int id) async {
    await DataService.dataService.removeData(id);
    await selectData();
  }

  Future<void> updateDataBase() async {
    await DataService.dataService
        .updateDB(list[updateIndex.value]["id"], txtTitle.text, txtDiscription.text);
    await selectData();
  }
}
