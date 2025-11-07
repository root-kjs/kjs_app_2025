import 'package:flutter/material.dart';
import 'package:kjs_app_2025/example/day04/pages/HomePage.dart';
import 'package:kjs_app_2025/example/day04/pages/InfoPage.dart';
import 'package:kjs_app_2025/example/day04/pages/SettingPage.dart';

// 1. 상위 
class MainPage extends StatefulWidget{
  // 하위 상태 함수 불러오기
  MainPageState createState() => MainPageState();

}// class end

// 2. 하위(상태있음)
class MainPageState extends State<MainPage>{

  //********** 현재 페이지 초기값 / 전역변수 설정 ***********
  int currentPageIndex = 0;

  // ************* 인덱스별 위젯(페이지) 목록 *************
  // List<Widget> pages =[]; vs
  dynamic pages = [
    HomePage(),   // 인덱스 0 -> 홈페이지 지정
    InfoPage(),  // 인덱스 1 -> 정보페이지 지정
    SettingPage()// 인덱스 2 -> 셋팅페이지 지정
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack( index: currentPageIndex, children: pages,), // HomePage() 페이지
      bottomNavigationBar: BottomNavigationBar(
        // 현재 선택된 버튼 번호 설정
        currentIndex: currentPageIndex, // 0 상수를 currentPageIndex 변경
        onTap: (index){setState(() {
          currentPageIndex = index;
        });}, //
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:"홈"), // 0번, 아이콘 설정 가능
          BottomNavigationBarItem(icon: Icon(Icons.info, size: 30, color: Colors.blue,), label: "정보"),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 20, color: Color.fromRGBO(10, 125, 146, 0.7,)), label: "설정"),
        ]
      ), // 주사용메뉴
    );
  }// build end
}// class end