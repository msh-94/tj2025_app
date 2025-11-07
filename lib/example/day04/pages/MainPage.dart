// lib/example/day04/pages/MainPage.dart

import 'package:flutter/material.dart';
import 'package:tj2025_app/example/day04/pages/HomePage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}// class end

class MainPageState extends State<MainPage>{
  int currentPageIndex = 0; // 현재 화면에 보이는 페이지 (인덱스) 번호
  dynamic pages = [ // vs List<Widget> pages = [];
    HomePage() , // 인덱스 0 -> 홈 페이지
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( index: currentPageIndex, children: pages,),
      bottomNavigationBar: BottomNavigationBar(
          // 현재 선택 된 버튼 번호 설정
        currentIndex: currentPageIndex,
          onTap: (index){ setState(() { currentPageIndex = index; });} , // 바텀메뉴 중 하나의 탭 눌렀을때
          items: [ // 바텀메뉴에 들어갈 버튼들
            BottomNavigationBarItem( icon: Icon(Icons.home_outlined) , label: "홈") , // 0번
          ]) ,
    );
  }
}// class end