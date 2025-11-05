import 'package:flutter/material.dart';

// 1. main
void main(){
  runApp( MyApp()); // 최초 실행 위젯
}

// 2. 위젯 만들기 :: App.jsx
class MyApp extends StatelessWidget{ // 리렌더링 없는(상태 없는) 위젯
  @override // 위젯이란 클래스 기반이라서 위젯을 만든다는 것은 객체를 생성한다는 뜻
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp( home: GoodsWidget() ,);
  }
}//

// 3. 위젯 만들기(페이지) :: 컴포넌트 역할
class GoodsWidget extends StatefulWidget{ // 상태 있는(useState) 위젯 만들기
  // 상테 위젯 등록
  @override
  GoodsWidgetState createState() => GoodsWidgetState();
}// class end

// 4. 상태 하위 위젯
class GoodsWidgetState extends State<GoodsWidget>{

  // 1) 입력상자의 컨트롤러 생성
  TextEditingController nameCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  // 2) goodsSave 함수 정의
  void goodsSave (){
    print( nameCont.text ); // 컨트롤러명.text 속성 이용하여 입력받은 값 가져오기
    final obj = { 'gname':nameCont.text, 'gprice':priceCont.text, 'gdesc':descCont.text };
    print(obj);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("제품현황")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("세로정렬대상 위젯"),
            TextField(
              decoration: InputDecoration(labelText: "제품명"),
              controller: nameCont,),
            SizedBox( height: 20),

            TextField(
                decoration: InputDecoration(labelText: "제품가격"),
                keyboardType: TextInputType.number,
                controller : priceCont),
            SizedBox( height: 20),

            TextField(
              decoration: InputDecoration(labelText: "제품설명"),
              controller: descCont,),
            SizedBox( height: 20),

            ElevatedButton(onPressed: goodsSave , child: Text("제품등록"))
          ],
        ),
      ),
    );
  }
}








