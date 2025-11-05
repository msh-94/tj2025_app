// lib/example/day03/example1.dart
/*
  -- 주요 통신 기술
  JS : Fetch      , JQUERY : AJAX
  REACT : Axios   , Flutter : DIO
  -- Flutter 라이브러리 공유 페이지 : https://pub.dev/
  SPRING : build.gradle
  JS : CDN , <Link href="외부코드링크">
  REACT : package.json , npm , NODE 기반의 패키지 매니저
  Flutter : pubspec,yml , pub
*/

// 1. DIO 설치 : pubspec.yml 파일내 30번줄 정도에 'dependencies : '
// 2. "dio: ^5.9.0" 추가한다. 탭[tab] 주의
/*
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.9.0
*/
// 3. 상단에 [pub get] 버튼 클릭하여 추가된 라이브러리 설치/빌드 한다
// 4. dart 파일 상단에 DIO 객체를 생성한다 , import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
final dio = Dio(); // dio 상수에 Dio 객체를 저장한다

// [1] GET 방식의 요청 함수
void getEvent() async { // dart 의 람다식/익명함수는 ()=>{ } , (){ }
  try{
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print("[GET] 성공 : ${response.data}");
  }catch(e){ print( "[GET] 실패 : ${e}" ); } // dart 의 문자열 템플릿
}// f end

// [2] POST 방식의 요청 함수
void postEvent() async {
  try{
    final obj = { 'title' : 'foo' , 'body' : 'bar' , 'userId' : 1 }; // 보낼 데이터
    // dio.post("https://jsonplaceholder.typicode.com/posts/1",data: 전송할데이터);
    final response = await dio.post("https://jsonplaceholder.typicode.com/posts",data: obj);
    print("[POST] 성공 : ${response.data}");
  }catch(e){ print("[POST] 실패 : ${e}"); }
}// f end

void main(){
  print("DART 프로그램 시작점");
  getEvent(); // [1-2] 호출
  postEvent(); // [2-2] 호출
}// main end