// lib/example/total/task4/pages/MainPage.dart

import 'package:flutter/material.dart';
import 'package:tj2025_app/example/total/task4/pages/CreatePage.dart';
import 'package:tj2025_app/example/total/task4/pages/GetPage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}// class end

class MainPageState extends State<MainPage>{
  int currentPageIndex = 0;
  dynamic pages = [
    CreatePage() ,
    GetPage() ,
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( index: currentPageIndex, children: pages,),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (index){ setState(() { currentPageIndex = index; });} ,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.add) , label: "등록") ,
        BottomNavigationBarItem(icon: Icon(Icons.get_app_outlined), label: "전체조회" ),
      ]),
    );
  }
}