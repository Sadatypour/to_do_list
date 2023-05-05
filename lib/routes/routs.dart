import 'package:get/get.dart';
import 'package:to_do_list/pages/add_task.dart';
import 'package:to_do_list/pages/home.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: "/homescreen", page: () => Homescreen()),
        GetPage(name: "/addtaskscreen", page: () => Addtaskscreen()),
      ];
}
