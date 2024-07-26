import 'package:adv_flutter_database/view/helper/data_sarvice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController{

  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDiscription = TextEditingController();

  RxList list = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    // selectData();
  }
  void getData()
  {
    DataService.dataService.createDatabase();
  }

  Future<void> data()
  async {
    await DataService.dataService.insertData();
    list.refresh();
    await selectData();
  }

  Future<void> selectData()
  async {
    list.value = await DataService.dataService.addData();
  }


  Future<void> deleteData(int id)
  async {
    await DataService.dataService.removeData(id);
    list.refresh();
    await selectData();
  }
}