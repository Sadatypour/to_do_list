import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:to_do_list/const.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/task_controller.dart';
import 'package:to_do_list/controller/textfiled_controller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<Taskcontroller>().isEditing = false;
          Get.find<textfieldcontroller>().tasktitle!.text = " ";
          Get.find<textfieldcontroller>().tasksubtitle!.text = " ";
          Get.toNamed("/addtaskscreen");
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
        backgroundColor: backcolor,
      ),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [topwidget(), bottonwidget()],
      )),
    );
  }
}

class bottonwidget extends StatelessWidget {
  const bottonwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: BoxDecoration(
          color: back2,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(100))),
      child: Container(
        margin: EdgeInsets.only(left: 50, top: 20, right: 50),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onLongPress: () {
                        //!delettask
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    backgroundColor: backcolor,
                                    title: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Are you sure Delete?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.find<Taskcontroller>()
                                                .task
                                                .removeAt(index);
                                            Get.back();
                                          },
                                          child: Text(
                                            "YES",
                                            style: TextStyle(
                                              color: back2,
                                              fontSize: 20,
                                            ),
                                          )),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "NO",
                                            style: TextStyle(
                                              color: back2,
                                              fontSize: 20,
                                            ),
                                          ))
                                    ]));
                      }, //!delet

                      title: Text(
                        Get.find<Taskcontroller>().task[index].tasktitle ?? "",
                        style: TextStyle(
                            color: backcolor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          Get.find<Taskcontroller>().task[index].tasksubtitle ??
                              "",
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Get.find<Taskcontroller>().index = index;
                        Get.find<Taskcontroller>().isEditing = true;
                        Get.find<textfieldcontroller>().tasktitle!.text =
                            Get.find<Taskcontroller>().task[index].tasktitle!;
                        Get.find<textfieldcontroller>().tasksubtitle!.text =
                            Get.find<Taskcontroller>()
                                .task[index]
                                .tasksubtitle!;
                        Get.toNamed("/addtaskscreen");
                      },
                      trailing: Checkbox(
                          activeColor: Colors.black,
                          checkColor: backcolor,
                          onChanged: (value) {
                            Get.find<Taskcontroller>().task[index].status =
                                !Get.find<Taskcontroller>().task[index].status!;
                            Get.find<Taskcontroller>().task[index] =
                                Get.find<Taskcontroller>().task[index];
                          },
                          value: Get.find<Taskcontroller>().task[index].status),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      color: Colors.black,
                    );
                  },
                  itemCount: Get.find<Taskcontroller>().task.length);
            })),
      ),
    );
  }
}

class topwidget extends StatelessWidget {
  const topwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: Get.width,
      color: backcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ))
            ],
          ),
          Container(
              margin: EdgeInsets.only(right: 250, top: 40),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
              )),
          Container(
            margin: EdgeInsets.only(left: 50, top: 30),
            child: Text(
              "All",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 50, top: 10),
              child: Obx(() {
                return Text(
                  " ${Get.find<Taskcontroller>().task.length} ^ task",
                  style: TextStyle(fontSize: 18),
                );
              }))
        ],
      ),
    );
  }
}
