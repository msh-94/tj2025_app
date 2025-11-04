// lib/example/day02/example3.dart

// [*] 상태(state) 있는 위젯
import 'package:flutter/material.dart';

void main(){ runApp( MyApp() ); }

class MyApp extends StatefulWidget{ // 1. 상태가 있는 위젯 상속받기
  // (1) extends StatefulWidget 상속 받는다
  // (2) 상태를 관리할 하위 위젯들을 등록한다
  // * 하위 위젯들은 extends State< 상위위젯명 >
  // 등록할위젯명 createState() => 등록할위젯명();
  MyAppState createState() => MyAppState();
}// class end
// 2. 상태를 사용하는 위젯 별도 선언
class MyAppState extends State< MyApp >{

  int count = 0;
  // ++++++++++++++++ 상태 변경 / 재랜더링 ++++++++++++++++
  // setState( (){ 새로운값; } )
  void increment(){ setState( (){ count++; } );  print(count); }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("페이지명 또는 아이콘"),),
        body: Center(
          child: Column(
            children: [
              Text("count : ${ count }") ,
              TextButton(onPressed: increment , child: Text("버튼"))
            ],
          ),
        )
      ),
    );
  }// f end

}// class end