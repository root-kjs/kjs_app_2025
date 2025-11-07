import 'package:flutter/material.dart';
import 'package:kjs_app_2025/example/practice1107/pages/DetailPage.dart';
import 'package:kjs_app_2025/example/practice1107/pages/GetPage.dart';
import 'package:kjs_app_2025/example/practice1107/pages/MainPage.dart';
import 'package:kjs_app_2025/example/practice1107/pages/PostPage.dart';

void main(){
  runApp( MyApp() );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp( // Flutter 앱의 전체 테마·라우팅·네비게이션 구조를 잡아주는 앱의 뼈대 위젯.
      initialRoute: "/",
      routes: {
        // context는 지금 그 위젯이 어디에 있는지 알려주는 위치 정보.화면 이동, 테마, 사이즈, 상위 위젯 정보 등을 가져올 때 필요.
        "/": (context) => MainPage(),// context는 위젯 트리 속 위치를 나타내는 신분증 같은 역할.
        "/post" : (context) => PostPage(),
        "/get" : (context) => GetPage(),
        "/detail":(context) => DetailPage()
      },
    );// MaterialApp end
  }// build end
}// class end