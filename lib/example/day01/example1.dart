// example1.dart 파일 생성
// 1. void main(){} 이용한 최초 실행 코드 작성한다 ( 메인스레드 포함 )
// 2. 위젯을 작성/구현한다. 위젯이란? 화면을 구성하는 가장 작은 단위 ( == 컴포넌트 )

// [1] 위젯 만들기 :
// (1)StatelessWidget 상속받는다
// (2) build 함수 재구현한다
// (3) build 함수의 return 에 'MaterialApp' 반환한다
// (4) main() 함수 안에서 최초로 실행할 위젯 넣어주기
import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget{
  // extends 이란? 특정 클래스로부터 물려받는 행위
  @override // 오버라이딩 @override , 빈 공간에 컨트롤+스페이스바
    Widget build(BuildContext context) {
      return MaterialApp( home: Text("안녕하세요") );
    }// f end
}// class end

class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 자바 : new 클래스명( 매개변수 ) vs DART : 클래스명( 속성명 : 값 )
    // return MaterialApp( 속성명 : 출력할위젯 );
    return MaterialApp( home: Scaffold(
        appBar: AppBar( title: Text("여기가 상단바")) ,                      // 상단 바
        body : Center( child: Text("여기가 본문")) ,                        // 본문
        bottomNavigationBar : BottomAppBar( child: Text("여기가 하단바") ) ,// 하단 바
      ), // Scaffold end
    ); // MaterialApp end
  }// f end
}// class end

void main(){ // public static void main(){} 와 비슷한 main스레드 갖는다
  print("==dart 입니다=="); // System.out.print() 와 비슷한 출력함수
  // runApp( MyApp1() ); // runApp(최초로실행될위젯) // 최초로 실행되는 위젯 실행 , 리액트에서 App.jsx
  runApp( MyApp2() );
}
// 함수의 반환타입이 없다는 뜻
// main 함수명 , 자바와 비슷하게 최초 실행은 void main 시작