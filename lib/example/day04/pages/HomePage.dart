import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("더조은 홈페이지"),),
      body: Center(
        child: ElevatedButton(
            // pushNamed 추가 ,
            onPressed: (){ Navigator.pushNamed(context, "/detail"); },
            child: Text("특정페이지 이동")),
      )
    );
  }// build end
}// class end

