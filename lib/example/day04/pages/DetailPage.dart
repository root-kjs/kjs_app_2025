import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text("상세"),),
      body: Center(
        child: Column(
          children: [
            Text("상세페이지 입니다."),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context); // 뒤로가기 함수
                },
                child: Text("뒤로가기")
            )
          ],
        ),
      ),
    );
  }// build end
}// class end

// 페이지 신규 생성시, 라우터에 등록해야 한다.
// 메인.dart 라우터 기록
