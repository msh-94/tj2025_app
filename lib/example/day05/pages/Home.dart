
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}// class end

class HomeState extends State<Home>{

  @override
  void initState() { // 1. 위젯이 최초로 열렸을때 실행하는 함수
    findAll();
  }// f end

List< dynamic > todoList = []; // 3. 가져온 todo목록

  void findAll() async{ // 2. Spring 서버로 부터 todo 목록 가져오기
    try{
      final response = await dio.get("http://192.168.40.197:8080/api/todo");
      final data = await response.data;
      setState(() { todoList = data; });
    }catch(e){ print("통신 실패 : ${e}"); }
  }// f end

  void delete( int id ) async{ // 4. Spring 서버로부터 todo 개별 삭제
    try{
      final response = await dio.delete("http://192.168.40.197:8080/api/todo?id=${id}");
      final data = response.data;
      if( data == true ){ findAll(); } // 4. 삭제 성공하면 할일목록 재호출
    }catch(e){ print("통신 실패 : ${e}"); }
  }// f end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO"),),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView(
              // children: [], 반복문을 이용하여 ListView에 여러개 Card 대입
              // todoList.map( (반복변수명){ return 반환위젯() } ).toList()
              children: todoList.map( (todo) { // map 반복문은 dynamic 타입 매핑 안된다
                return Card( child: ListTile(
                  title: Text( todo['title']), // Card 제목 부분
                  subtitle: Row(children: [Text(todo['content']) , Text(todo['createDate']) ] ),
                  trailing: Row( // Row : 가로 배치 위젯
                    mainAxisSize: MainAxisSize.min, // Row 배치 에서 오른쪽 버튼(위젯)들의 넓이를 자동으로 최소 크기 할당
                    children: [
                      IconButton(onPressed: (){ delete(todo['id']); }, icon: Icon(Icons.delete) ),
                      IconButton(
                          onPressed: () async{
                            final result = await Navigator.pushNamed(context, "/update",arguments: todo['id']);
                            if(result==true){findAll();}
                          },
                          icon: Icon(Icons.edit)),
                      IconButton( // Navigator.pushNamed( context , "이동할경로" , arguments : 매개변수
                          onPressed: (){ Navigator.pushNamed(context, "/detail" , arguments: todo['id']); },
                          icon: Icon(Icons.info_outline)
                      )
                    ],
                  ),
                ),);
              }).toList()
            ))
          ],
        ),
      )
    );
  }// f end
}// class end