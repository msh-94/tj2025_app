import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Update extends StatefulWidget{
  UpdateState createState() => UpdateState();
}// class end

class UpdateState extends State<Update>{

  @override
  void didChangeDependencies() {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  }// f end

  dynamic todo = {};
  void findById(int id) async{
    try{
      final response = await dio.get("http://192.168.40.197:8080/api/todo/find?id=${id}");
      final data = response.data;
      setState(() {
        todo = data;
        titleCont = data['title'];
        contentCont = data['content'];
      });
    }catch(e){ print("통신 실패 : ${e}"); }
  }// f end
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  void update() async{
    try{
      final obj = {
        "id" : todo['id'],
        "title" : titleCont.text,
        "content" : contentCont.text,
        "done" : todo['done']
      };
      final response = await dio.put("http://192.168.40.197:8080/api/todo" ,data: obj );
      final data = response.data; print(data);
      if(data != null){ Navigator.pop(context,true); }
      // 만약에 수정 성공시 뒤로가기 , 즉] 현재 위젯을 제거 하면서 두번재 매개변수로 true 반환
    }catch(e){ print("통신 실패 : ${e}"); }
  }// f end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 수정"),),
      body: Column(
        children: [
          TextField( controller: titleCont , maxLength: 30,),
          SizedBox( height: 20,) ,
          TextField( controller: contentCont, maxLength: 255,maxLines: 5,) , // maxLines : 세로최대길이 - 내용이 넘치면 자동 스크롤
          SizedBox(height: 20,),
          Text("완료여부"),
          Switch(
              value: todo['done'], // true : on , false : off
              onChanged: (value){ setState(() {
                todo['done'] = value;
              }); } ),
          SizedBox( height: 20,) ,
          OutlinedButton(onPressed: update, child: Text("수정하기"))
        ],
      ),
    );
  }// f end
}// class end