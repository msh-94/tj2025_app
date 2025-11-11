import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Detail extends StatefulWidget{
  DetailState createState() => DetailState();
}// class end

class DetailState extends State<Detail>{

  // 1. 해당 위젯이 최초로 열렸을때 함수
  @override
  void initState() {  }// f end
  // 2. 이전(부모) 위젯이 변경 되었을때 실행 함수
  @override
  void didChangeDependencies() {
    // 부모 위젯에서 상세버튼 클릭할때 마다 서로 다른 매개변수를 가져온다
    // ModalRoute.of(context)!.settings.arguments as 타입;
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  }// f end

  // 3. Spring 서버로 부터 개별 조회한다
  dynamic todo = {};
  void findById( int id ) async{
    try{
      final response = await dio.get("http://192.168.40.197:8080/api/todo/find?id=${id}");
      final data = response.data; print(data);
      setState(() { todo = data; });
    }catch(e){ print("연결 실패 : ${e}"); }
  }// f end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 상세"),),
      body: Text("상세"),
    );
  }// f end
}// class end