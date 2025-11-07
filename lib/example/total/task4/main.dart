// lib/example/total/task4/main.dart

import 'package:flutter/material.dart';
import 'package:tj2025_app/example/total/task4/pages/CreatePage.dart';
import 'package:tj2025_app/example/total/task4/pages/GetPage.dart';
import 'package:tj2025_app/example/total/task4/pages/MainPage.dart';

void main(){
  runApp( MyApp() );
}// f end

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => MainPage(),
        "/create" : (context) => CreatePage(),
        "/get" : (context) => GetPage(),
      },
    );
  }// f end
}// class end