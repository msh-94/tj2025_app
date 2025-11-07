// lib/example/total/task4/pages/CreatePage.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tj2025_app/example/total/task4/pages/GetPage.dart';

class CreatePage extends StatefulWidget{
  CreatePageState createState() => CreatePageState();
}// class end

class CreatePageState extends State<CreatePage>{
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  // [*] 등록
  void createTodo() async{
    final obj = { "title" : titleCont.text , "content" : contentCont.text };
    final dio = Dio();
    try{
      final response = await dio.post("http://192.168.40.197:8080/api/task4",data: obj);
      final data = response.data;
      print("요청 성공 : ${data}");
      Navigator.pushNamed(context, "/get");
    }catch(e){ print("요청 실패 : ${e}"); }
  }// f end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("등록"),),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "제목"),
              controller: titleCont,
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(labelText: "내용"),
              controller: contentCont,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: createTodo, child: Text("등록"))
          ],
        ),
      ),
    );
  }
}