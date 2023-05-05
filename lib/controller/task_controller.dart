import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/models/task_model.dart';

class Taskcontroller extends GetxController {
  bool isEditing = false;
  int index = 0;
  RxList<Taskmodel> task = <Taskmodel>[].obs;
  @override
  void onInit() {
    var box = GetStorage();
    //!
    if (box.read("task") != null) {
      var list = box.read("task");
      for (var item in list) {
        task.add(Taskmodel.fromJson(item));
      }
    }
    //?
    ever(task, (value) {
      box.write("task", task.toJson());
    });
    super.onInit();
  }
}
