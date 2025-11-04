// 상태가 없는 경우 : 재렌더링 없는 경우 사용

import 'package:flutter/material.dart';

void main(){ runApp( MyApp() ); }// new 생략 가능

// 위젯 3개
class MyApp extends StatelessWidget{
  // 버튼 이벤트 함수
   int count = 0;
   void increment(){ count++; print(count); }
  //

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return MaterialApp( home: Text("플러터"),);
    return MaterialApp( home: Scaffold(
      appBar: AppBar(title: Text("상단제목"),),// 상단바
      body: Center( 
        child : Column(
          children: [
            Text("세로정렬 1번째 위젯1"),
            Text("세로정렬 2번째 위젯2"),
            TextButton(onPressed: increment , child: Text("세로정렬 3번째 위젯3"),),
            Text("세로정렬 4번째 위젯 + count : ${ count }")
          ],),), // 본문
    )
    );
  }
}// class end