import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title:Text("상세보기")),
      body: Center(
        child: Column(
          children: [
            Text("상세페이지입니다."),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);// 뒤로가기 함수
              },
              child: Text("뒤로가기")
            )
          ],
        ),
      )
    );
  } // Matereal end
}// class end