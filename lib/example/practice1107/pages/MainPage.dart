import 'package:flutter/material.dart';
import 'package:kjs_app_2025/example/practice1107/pages/GetPage.dart';
import 'package:kjs_app_2025/example/practice1107/pages/PostPage.dart';


// ** [01] 상위( 상태 O ) : StatefulWidget은 변하는 화면을 만들 때 사용한다. */
// MainPage는 껍데기(틀) 이고 MainPageState는 실제로 화면을 그리는 로직(내용물) 이다.
// 즉, 위젯(겉) + 상태(State, 속) 를 두 개로 나눠놓은 구조.
// MainPage = StatefulWidget (변화 가능한 화면의 틀)
class MainPage extends StatefulWidget{

  // createState() = 이 화면의 상태를 관리할 객체를 만든다.
  // MainPageState = 실제 화면 UI + 상태(변수) + 이벤트 처리
  MainPageState createState() => MainPageState();

}// class end


// ** ------------------------ [02] State = 상태 관리 기본 클래스 -------------------*/
// 제너릭(<MainPage>)은 어떤 위젯의 상태인지 정확히 연결하기 위해 필요하다.
// 그래야 Flutter가 해당 State가 어떤 Widget을 다시 그려야 하는지 알고 동작한다.
// 즉, 타입을 명확히 지정하여 구조를 안전하고 명확하게 만드는 것.
class MainPageState extends State<MainPage>{

  //** 현재 페이지 인덱스 초기값 */
  int currentPageIndex = 0;

  //** 페이지(위젯) 인덱스 목록 */
  dynamic pages = [
    PostPage(), // 0 : 등록 페이지
    GetPage()   // 1 : 전체조회 페이지
  ];

  @override
  Widget build(BuildContext context) {
    // build : UI를 구성해서 Widget 형태로 돌려주는 함수.
    // (BuildContext context)
    // → 지금 이 위젯이 어느 위치에 있는지,
    // 즉 부모/자식 구조, 테마(theme), 화면 크기 등을 알 수 있게 해주는 위치 정보 객체.
    return Scaffold( // Scaffold는 화면의 기본 뼈대(틀) 를 만들어주는 위젯.
      // AppBar, Body, BottomNavigationBar 등 기본 화면 구조를 한 번에 세팅할 수 있음.
      // Flutter에서 대부분의 화면은 Scaffold로 시작한다고 보면 됨.
      body: IndexedStack( index: currentPageIndex, children: pages,),

      //** ========== 하단 바 메뉴 스택 쌓기 =============== */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex, // 현재 페이지 인덱스 번호
        onTap: ( index){ setState(() {
          currentPageIndex = index;
        }); },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "등록"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "목록")
        ]
      ),
    );
  }// build end
}// class end