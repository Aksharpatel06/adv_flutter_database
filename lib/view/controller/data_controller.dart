import 'package:adv_flutter_database/view/helper/data_sarvice.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    
  }
  void getData()
  {
    DataService.dataService.createDatabase();
  }

  void data()
  {
    DataService.dataService.insertData();
  }
}