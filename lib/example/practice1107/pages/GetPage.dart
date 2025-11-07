import 'package:flutter/material.dart';

//** 1. 전체 조회 페이지 > UI  */
class GetPage extends StatefulWidget{
  GetPageState createState() => GetPageState();
}//class end

//** -------------------- 2. 전체 조회 페이지 > 로직 ------------------- */
class GetPageState extends State<GetPage>{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( 
      appBar: AppBar( title: Text("전체조회"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("전체조회 페이지입니다."), 
            ElevatedButton(
              onPressed: (){ Navigator.pushNamed(context, "/detail");}, 
              child: Text("상세보기")),
            ElevatedButton(
                onPressed: (){ Navigator.pushNamed(context, "/post");},
                child: Text("등록")),
          ],
        ),
      ),
    );
  }// build end
}//class end