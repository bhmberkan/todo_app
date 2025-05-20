import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/headitem.dart';

import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> todo = ["Study Lessons", "Run 5K", "Go to party"];
  //List<String> completed = ["Game meetup", "Take out tash"];

  List<Task> todo = [
    Task(
      type: Tasktype.notes,
      title: "Study Lessons",
      description: "Study COMP117",
      isCompleted: false,
    ),
    Task(
      type: Tasktype.calendar,
      title: "Go to party",
      description: "Attent to party",
      isCompleted: false,
    ),
    Task(
      type: Tasktype.contest,
      title: "Run 5k",
      description: "Run 5k kilometers",
      isCompleted: false,
    ),
  ];

void addNewTask(Task newTask){
 setState(() {
    todo.add(newTask);
 });
}

  List<Task> completed = [
    Task(
      type: Tasktype.calendar,
      title: "Go to party",
      description: "Attend to pary",
      isCompleted: false,
    ),
    Task(
      type: Tasktype.contest,
      title: "Run 5k",
      description: "Run 5k kilometers",
      isCompleted: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    return MaterialApp(
      debugShowCheckedModeBanner: false, // üstte yazan debug yazısını kaldırdık
      home: SafeArea(
        // bildirimleri ve aşağıdaki butonları atlamamıza yaradı scaffolddan farklı olarak
        child: Scaffold(
          backgroundColor: HexColor(backgrounColor),
          body: Column(
            children: [
              // Header
              Headitem(),
              // Top column
              Expanded(
                // flexible // kullanırsak
                // flex: 3, // 3 birim alan ayırır ve diğer columna 1 birim alan kalır.
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        else if(snapshot.data!.isEmpty){
                          return const Text("Gösterilecek veri yok");
                        }
                        else{
                      return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length, // ünlem içerisinde data varsa anlamı taşır.
                      itemBuilder: (BuildContext context, int index) {
                        return TodoItem(
                          task: snapshot.data![index],
                          );
                      },
                    );
                        }

                    
                    },
                    ),
                  ),
                ),
              ),
              // completed Text
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              // DYR --> Don't Repeat yourself kuralına uymaz. düzelteceğim
              // Bottom column
              
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getcompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        else if(snapshot.data!.isEmpty){
                          return const Text("Gösterilecek veri yok");
                        }
                        else{
                      return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length, // ünlem içerisinde data varsa anlamı taşır.
                      itemBuilder: (BuildContext context, int index) {
                        return TodoItem(
                          task: snapshot.data![index],
                          );
                      },
                    );
                        }

                    
                    },
                    ),
                  ),
                ),
              ),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    // yeni sayfaya yönlendirme işlemi yaptım
                    MaterialPageRoute(builder: (context) => AddNewTaskScreen(
                      addNewTask: (newTask) => addNewTask(newTask),
                    )),
                  );
                },
                child: const Text("Add New Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
