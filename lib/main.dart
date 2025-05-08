import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.width;
    double deviceWidht = MediaQuery.of(context).size.height;
    

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea( // bildirimleri ve aşağıdaki butonları atlamamıza yaradı scaffolddan farklı olarak
        child: Scaffold(
          backgroundColor: HexColor(backgrounColor),
          body: Column(
            children: [
            Container(
              width: deviceHeight,
              height: deviceWidht / 3,
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(image: AssetImage("lib/assets/images/header.png"),
                fit: BoxFit.cover
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child:
                     Text("October 20 2022",
                     style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    )
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text("My Todo List",
                    style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            Expanded( // flexible // kullanırsak
             // flex: 3, // 3 birim alan ayırır ve diğer columna 1 birim alan kalır.
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                child: SingleChildScrollView( // scroll için kullanılıyor tek child alabilir
                // aşağıya doğru sonsuz sayıda task ekleyebiliriz.
                  
                  child: Column(
                    children: [
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Completed",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18
                ),
                ),
              ),
            ),
            // DYR --> Don't Repeat yourself kuralına uymaz. düzelteceğim
            Expanded( 
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                child: SingleChildScrollView( 
                  child: Column(
                    children: [
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                             
                            ],
                          ),
                        ),
                      ),
                       Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.notes_outlined,size: 50,),
                               Text("Study Lessons",
                               style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                               ),),
                            Checkbox(value: isChecked, onChanged: (val)=>{
                              setState(() {
                                isChecked = val!;
                              })
                            })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Add New Task"))
            ],
          ),
        ),
      ),
    );
  }
}