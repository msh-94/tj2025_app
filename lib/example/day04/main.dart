// lib/example/day04/main.dart

import 'package:flutter/material.dart';
import 'package:tj2025_app/example/day04/pages/HomePage.dart';
import 'package:tj2025_app/example/day04/pages/MainPage.dart';

void main(){ // 프로그램 실행 시작점
  runApp( MyApp() ); // runApp() 플러터 앱을 시작하는 함수
  // new MyApp() 내가 만든 루트(최초) 위젯 , new 생략가능
}// f end

// 앱 전체의 루트 위젯 정의
class MyApp extends StatelessWidget{ // 앱 전체의 루트 위젯 정의
  // StatelessWidget : 상태 없는 위젯으로 부터 상속받기
  @override
  Widget build(BuildContext context) {
    // return MaterialApp( routes: {"경로명" : (context) => 위젯명() }, );
    return MaterialApp(
      initialRoute: "/", // 앱 시작하는 최초의 경로 지정
      routes: { // 경로 와 해당 위젯을 연결하는 MAP 형식
        "/" : (context) => MainPage(),
        "/home" : (context) => HomePage() , // 다른 파일의 위젯 import
      },
    );
  }
}// class end