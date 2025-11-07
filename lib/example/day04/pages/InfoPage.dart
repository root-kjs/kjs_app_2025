import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text("정보"),),
      body: Text("정보 페이지입니다~"),
    );
  }// build end
}// class end

// 페이지 신규 생성시, 라우터에 등록해야 한다.
// 메인.dart 라우터 기록