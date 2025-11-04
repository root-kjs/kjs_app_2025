// 상태(STATE) 있는 위젯
import 'package:flutter/material.dart';

void main(){ runApp( MyApp() );}

// 상위
class MyApp extends StatefulWidget{
  // 1. StatefulWidget 상속을 받는다.
  // 2. 상태를 관리할 위젯들을 등록한다.
  // 등록할 위젯명 createState()
  MyAppState createState() => MyAppState(); // new 생략 가능

}

// 하위
class MyAppState extends State<MyApp>{
  int count = 0;
  // 상태변경 / 재렌더링
  // void increament(){ count++; print(count);}
  // 리액트와 다르게 통으로
  void increament(){setState(() { count++; });  print(count);}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("상단바"),),
        body: Center(
          child :Column(
            children: [
              Text("count : ${ count}"),
              TextButton(onPressed: increament, child:Text("세로정렬 3번째 위젯3"),),
            ],
          ),
        ),
      ),
    );
  }


}