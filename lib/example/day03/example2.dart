// lib/example/day03/example2.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
final dio = Dio();
// [1]
void main(){ // main.jsx
  runApp( MyApp() ); // 최초로 실행할 위젯
}// main end

// [2] 위젯 만들기 < 최초 메인 위젯 , App.jsx 같은 역할 >
class MyApp extends StatelessWidget{ // 상태(useState)가 없는 위젯
  @override // 위젯이란? 클래스 기반 이라서 , 위젯 만든다는것은 객체 생성한다는 뜻
  Widget build(BuildContext context) {
    return MaterialApp( home: GoodsWidget() );
  }// f end
}// class end

// [3] 위젯 만들기2 < 페이지 > , 컴포넌트 역할
class GoodsWidget extends StatefulWidget{ // 상태(useState) 가 있는 위젯
  // 상태 위젯 생성/등록
  GoodsWidgetState createState () => GoodsWidgetState();
}// class end

// [4] 상태 하위 위젯
class GoodsWidgetState extends State<GoodsWidget>{

  // [4-1] 입력 상자의 컨트롤러
  TextEditingController nameCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  // [4-2] goodsSave 함수정의
  void goodsSave() async {
    final obj = { "gname" : nameCont.text , "gprice" : priceCont.text , "gdesc" : descCont.text };
    print(obj);
    try{ // 주의할점 : web[HTTP있음] 모바일[HTTP없음]
      // (web) 빌드시 : localhost:8080 가능 , (mobile) 빌드시 : 192.168.40.197 만 가능
      // 스프링 컨트롤러에서 @CrossOrigin(origins = "*") 추가 또는 corsConfig
      final response = await dio.post("http://192.168.40.197:8080/api/goods" , data: obj );
      final data = response.data;
      print("요청 성공 : ${data}");
      // (1) 저장 성공한 자료를 추가하여 재렌더링 또는 (2) goodsAll 재호출
      goodsAll(); // vs // setState(() { goodsList.add( data ); });
    }catch(e){ print("요청 실패 : ${e}"); }
  }// f end

  // [4-3] GET 요청 함수 정의 , useEffect( () => { } , [] ) 처음 위젯이 최초 열렸을때 1번 실행
  void goodsAll() async{
    try{
      final response = await dio.get("http://192.168.40.197:8080/api/goods");
      final data = response.data;
      print("요청 성공 : ${data}");
      // 통신 결과를 함수 밖 변수(상태) 업데이트(렌더링)
      setState( () { goodsList = data; } );
    }catch(e){ print("요청 실패 : ${e}"); }
  }// f end
  
  // [4-4] initState() 함수 오버라이딩 하여 위젯의 초기 상태 
  @override // 오버라이딩
  void initState() { // 현재 위젯이 최초로 실행될때 1번 goodsAll 함수 실행
    goodsAll();
  }// f end

  // [4-5] dio로 가져온 데이터를 저장하는 상태 변수
  dynamic goodsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("제품 현황") ),
      body: Padding(
        padding: EdgeInsets.all(20) ,
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(labelText: "제품명") ,
                controller: nameCont,
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(labelText: "제품가격"),
              keyboardType: TextInputType.number, // 모바일 환경에서 키보드 형식을 숫자패드
              controller: priceCont,
            ),
            SizedBox(height: 20,),
            TextField(
                decoration: InputDecoration(labelText: "제품설명"),
                controller: descCont,
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: goodsSave , child: Text("제품등록")  ),
            SizedBox(height: 50,),

            Expanded(child: ListView.builder(
                itemCount: goodsList.length, // 리스트의 개수 정의
                itemBuilder: (context,index){
                  dynamic goods = goodsList[index]; // index 번째 goods 1개 반환
                  return Card(
                    child: ListTile(
                      title: Text( goods['gname'] ), // 객체명['속성명']
                      subtitle: Text( goods['gdesc'] ),
                    ),
                  );
                })
            )
          ], // children end
        ),
      )
    );
  }// f end
}// class end
// Padding : 안쪽 여백
// Column( children : [ 위젯 , 위젯 ,위젯 ] ) : 세로 정렬 , Row : 가로 정렬