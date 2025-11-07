// lib/example/total/task4/pages/GetPage.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetPage extends StatefulWidget{
  GetPageState createState() => GetPageState();
}// class end

class GetPageState extends State<GetPage>{

  // [*] 전체 조회
  void getTodoList() async{
    final dio = Dio();
    try{
      final response = await dio.get("http://192.168.40.197:8080/api/task4");
      final data = response.data;
      print("요청 성공 : ${data}");
      setState(() { todoList = data; });
    }catch(e){ print("요청 실패 : ${e}"); }
  }// func end

  // [*] 첫 랜더링시 실행
  void initState(){
    getTodoList();
  }// func end

  // [*] 데이터 상태 변수
  dynamic todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("전체 조회"),),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context,index){
               dynamic todo = todoList[index];
               return Card(
                 child: ListTile(
                   title: Text(todo["title"]),
                   subtitle: Text(todo["content"]),
                 ),
               );
              }
            )
            )
          ],
        ),
      ),
    );
  }
}// class end