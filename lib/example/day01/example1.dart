// 1. void main(){} 함수를 이용한 최초 실행 코드 작성
// 2. 위젯을 구현/작성한다. 위젯이란? 화면을 구성하는 가장 작은 단위(== 컴포넌트)

// 위젯만들기
// (1) 1.
import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget{
  // extends이란?
  // 오버라이딩?

  @override
  Widget build(BuildContext context ) {
    // TODO: implement build
    return MaterialApp( home : Text("안녕!") );
  }
}
class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // new 클래스명( 값 ) vs 클래스명( 속성명 : 값 )
    // Material( 속성명: 출력할 위젯 )
    // return MaterialApp( home : Text("하잉!")  );
    // Scaffold 발판 :  return MaterialApp( home : Scaffold( 속겅명 : 값 , 속성명 : 값) )
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar( title: Text("상단바11"),),                     // 상단바
        body: Center( child: Text("본문"),),                          // 본문
        bottomNavigationBar: BottomAppBar( child: Text("하단바!"),),    // 하단바
      ),
    );
  }// build end
}// class(위젯) end

void main (){ // main thread
  print( "dart 시작합니다. "); // System.out.print(); 자바 비슷한 출력함수
  //runApp( MyApp1() ); // runApp--> 1개만 실행 가능
  runApp( MyApp2() );
}// main end