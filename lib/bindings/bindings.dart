import 'package:get/get.dart';
import 'package:to_do_list/controller/task_controller.dart';
import 'package:to_do_list/controller/textfiled_controller.dart';

class mybindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Taskcontroller());
    Get.put(textfieldcontroller());
  }
}
