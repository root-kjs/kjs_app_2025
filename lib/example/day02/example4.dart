import 'package:flutter/material.dart';

// 1. 실행
void main(){ runApp( MyApp() ); }// 최초로 실행할 위젯/ 고정  나중에는 1개만 사용

// 2. 상위
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp( home: IOwidget() ); // 대문자로 시작되는 아이 :  위젯
  }
}// class end

// 3. 하위 : 상태가 있는 위젯
class IOwidget extends StatefulWidget {
  IOwidgetState createState()=> IOwidgetState();
}

// 4. 하위 : 상태 상속받은 위젯
class IOwidgetState extends State< IOwidget > {
  // 텍스트 필드로부터 입력받은 값들을 제어하는 제어 변수
  // ★★★★ 입력상자 1개당 1개씩 필요함. ★★★★
  TextEditingController nameCont = TextEditingController(); // 입력받은 값들을 가지고 있는 == useState, 일일이 할 필요는 없음
  TextEditingController ageCont = TextEditingController();
  // 버튼 액션(onPressed) 메소드
  void onSave(){
    print( nameCont.text ); //컨트롤러명.text : 현재 입력받은 값 반환
    print( ageCont.text );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title : Text("입출력 실습")),
      body:Column(
        children: [
          TextField( controller: nameCont,),
          TextField( controller: ageCont, decoration: InputDecoration( labelText: "나이 입력"),),//decoration == placeholder
          TextButton(onPressed: onSave, child: Text("등록"))
        ],
      )
    );
  }//
}// class end
