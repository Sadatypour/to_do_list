class Taskmodel {
  String? tasktitle;
  String? tasksubtitle;
  bool? status;
  Taskmodel(
      {required this.tasktitle,
      required this.tasksubtitle,
      required this.status});

  Map<String, dynamic> toJson() {
    return {
      "tasktitle": tasktitle,
      "tasksubtitle": tasksubtitle,
      "status": status
    };
  }

  Taskmodel.fromJson(Map<String, dynamic> json)
      : tasktitle = json["tasktitle"],
        tasksubtitle = json["tasksubtitle"],
        status = json["status"];
}
