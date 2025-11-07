import 'package:flutter/material.dart';
import 'package:kjs_app_2025/example/day04/pages/DetailPage.dart';
import 'package:kjs_app_2025/example/day04/pages/HomePage.dart';
import 'package:kjs_app_2025/example/day04/pages/InfoPage.dart';
import 'package:kjs_app_2025/example/day04/pages/MainPage.dart';
import 'package:kjs_app_2025/example/day04/pages/SettingPage.dart'; //ctrl + space


// 프로그램의 시작점
void main(){
  runApp( MyApp()); // runApp() 플러터 앱을 시작하는 함수, MyApp() -->  내가 만든 루트(최초) 위젯, new 생략 가능
}

// 앱 전체의 루트 위젯 정의(라우터)
class MyApp extends StatelessWidget{ // 앱 전체의 루트 위젯 정의
  // 상태없는 위젯으로부터의 상속받기
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // rreturn MaterialApp( routes: {"경로" : (context) => 위젯명()},);
    return MaterialApp(
      initialRoute: "/", // 최초의 경로 지정
      routes: { // 정의한 경로와 해당 위젯을 연결하는 맵 형식
        "/" : (context) => MainPage() ,
        "/home" : (context) => HomePage() ,
        "/info" : (context) => InfoPage() ,
        "/setting" : (context) => SettingPage() ,
        "/detail" : (context) => Detailpage()
      },
    ); // M end
  } //build end
}// class end