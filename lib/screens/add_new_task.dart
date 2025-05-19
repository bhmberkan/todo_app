import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';


class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
// Passing function as parameter

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

TextEditingController titleController = TextEditingController(); 
// text edit içerisinde yazdıklarımız almamıza olanak tanır //textfield
TextEditingController dateController = TextEditingController();
TextEditingController timeController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

Tasktype tasktype = Tasktype.notes;

  @override
  Widget build(BuildContext context) {
    double deviceWidht = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgrounColor),
       // appBar: AppBar(), // oto olarak yaptığı tasarımı atıyor
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidht,
                height: deviceHeight/10,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(image: AssetImage("lib/assets/images/add_new_task_header.png"),
                  fit: BoxFit.cover // arka palana tam otursun diye boşlukları doldurdum
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, icon: Icon(
                      Icons.close,
                      size: 40,
                      color: Colors.white,
                    ),
                    ),
                    Expanded(child: Text(
                      "Add New Task",
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold, 
                      fontSize: 21),
                      textAlign: TextAlign.center,))
                  ],
                ), 
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Task Title")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("category"),
                    GestureDetector(// dokunuşları kontrol etmek için
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(microseconds: 500),
                            content: Text("Category Selected"))
                        );
                        setState(() {
                          tasktype = Tasktype.notes;
                        });
                      },
                      child: Image.asset("lib/assets/images/category1.png"),
                    ),
                     GestureDetector(// dokunuşları kontrol etmek için
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(microseconds: 500),
                            content: Text("Category Selected"))
                        );
                        setState(() {
                          tasktype = Tasktype.calendar;
                        });
                      },
                      child: Image.asset("lib/assets/images/category2.png"),
                    ),
                     GestureDetector(// dokunuşları kontrol etmek için
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(microseconds: 500),
                            content: Text("Category Selected"))
                        );
                        setState(() {
                          tasktype = Tasktype.contest;
                        });
                      },
                      child: Image.asset("lib/assets/images/category3.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Date"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Time"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: 
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Note")),
                     SizedBox(
                      height: 300,
                       child: TextField(
                        controller: descriptionController,
                        expands: true,
                        maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                isDense: true,
                              ),
                            ),
                     ),
                    ],
                  )
                  ),
                ],
              ),

              ElevatedButton(onPressed: () {
                 Task newTask = Task(
                  type: tasktype,
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: false
                  );
                  widget.addNewTask(newTask);
                  Navigator.pop(context);
              }, child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}