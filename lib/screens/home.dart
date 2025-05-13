import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/headitem.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoItem(title: todo[index]);
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
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: completed.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoItem(title: completed[index]);
                    },
                  ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push( // yeni sayfaya yönlendirme işlemi yaptım
                MaterialPageRoute(builder: (context) =>  AddNewTaskScreen(),
                ));
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