import 'package:flutter/material.dart';


class Headitem extends StatefulWidget {
  const Headitem({super.key});
  

  @override
  State<Headitem> createState() => _HeaditemState();
}

class _HeaditemState extends State<Headitem> {
  @override
  Widget build(BuildContext context) {
    double deviceWidht = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return   Container(
                width: deviceWidht,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20 2022",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}