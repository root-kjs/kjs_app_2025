import 'package:flutter/material.dart';

// [1. 등록페이지 UI]
class PostPage extends StatefulWidget{

  PostPageState createState() => PostPageState();

}// class end

//** ----------------- 2. 등록페이지 상태 로직 ] ----------------- */
class PostPageState extends State<PostPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text("등록"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("등록페이지 입니다.")
          ],
        ),
      )
    );
  }//build end
}// class end

