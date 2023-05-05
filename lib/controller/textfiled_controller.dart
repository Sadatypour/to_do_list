import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class textfieldcontroller extends GetxController {
  TextEditingController? tasktitle;
  TextEditingController? tasksubtitle;
  @override
  void onInit() {
    tasktitle = TextEditingController();
    tasksubtitle = TextEditingController();
    super.onInit();
  }
}
