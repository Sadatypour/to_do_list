import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/const.dart';
import 'package:to_do_list/controller/task_controller.dart';
import 'package:to_do_list/controller/textfiled_controller.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:to_do_list/pages/home.dart';

class Addtaskscreen extends StatelessWidget {
  const Addtaskscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("background.jpg"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appbar(),
            text_one(),
            textfield_one(),
            textfield_two(),
            buttonwidget()

            //buttonwidget()
          ],
        ),
      ),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 90,
      decoration: BoxDecoration(
          color: back2,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 170, top: 25),
            child: Text(
              Get.find<Taskcontroller>().isEditing ? "Edit Task" : "New Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close)),
          ),
        ],
      ),
    );
  }
}

class buttonwidget extends StatelessWidget {
  const buttonwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
      height: 50,
      width: Get.width,
      child: ElevatedButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
              backgroundColor: back2,
              elevation: 20),
          onPressed: () {
            if (Get.find<Taskcontroller>().isEditing) {
//!edite task
              var tasks = Get.find<Taskcontroller>()
                  .task[Get.find<Taskcontroller>().index];
              tasks.tasktitle = Get.find<textfieldcontroller>().tasktitle!.text;
              tasks.tasksubtitle =
                  Get.find<textfieldcontroller>().tasksubtitle!.text;
              //
              Get.find<Taskcontroller>()
                  .task[Get.find<Taskcontroller>().index] = tasks;
              Get.back();
            } else {
              //!add task
              Get.find<Taskcontroller>().task.add(Taskmodel(
                  tasktitle: Get.find<textfieldcontroller>().tasktitle!.text,
                  tasksubtitle:
                      Get.find<textfieldcontroller>().tasksubtitle!.text,
                  status: false));
              Get.back();
            }
          },
          child: Text(
            Get.find<Taskcontroller>().isEditing ? "EDIT" : "ADD",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )),
    );
  }
}

class textfield_two extends StatelessWidget {
  const textfield_two({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: TextField(
            controller: Get.find<textfieldcontroller>().tasksubtitle,
            maxLength: 100,
            cursorColor: Colors.black,
            cursorHeight: 19,
            cursorWidth: 4,
            autofocus: false,
            decoration: InputDecoration(
              counter: Container(),
              labelText: "Add Note",
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              prefixIcon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: backcolor,
              )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backcolor),
              ),
            )));
  }
}

class text_one extends StatelessWidget {
  const text_one({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Text(
        "what are you planing?!",
        style: TextStyle(color: Color.fromARGB(255, 110, 86, 86), fontSize: 17),
      ),
    );
  }
}

class textfield_one extends StatelessWidget {
  const textfield_one({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
            controller: Get.find<textfieldcontroller>().tasktitle,
            maxLength: 30,
            cursorColor: Colors.black,
            cursorHeight: 19,
            cursorWidth: 4,
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.note_alt_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
            )));
  }
}
