import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// 1. main
void main(){
  runApp( MyApp()); // 최초 실행 위젯
}

final dio = Dio(); // dio 객체 생성

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
  // 상태 위젯 등록
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
  void goodsSave () async{
    print( nameCont.text ); // 컨트롤러명.text 속성 이용하여 입력받은 값 가져오기
    final obj = { 'gname':nameCont.text, 'gprice':priceCont.text, 'gdesc':descCont.text };
    print(obj);
    try{
      // 웹에서는 되지만(localhost:8080 가능) 모바일에서는 http 작동 안함.  loacalhost 안됨  **IP로 해야 함.
      // IPv4 주소 . . . . . . . . . : 192.168.40.186
      // 스프링 컨트롤러에서 CrossOrigin(ori)
      final response = await dio.post("http://192.168.40.186:8080/api/goods", data:obj); // 주의 : web(http), 플러터(모바일)는 .exe SW라 http 없음.
      final data = response.data;
      print( data );
      // **** 저장성공된 자료를 추가하여 재렌더링
      // goodsAll();// 1번 더 서버 터치
      setState(() {
        goodsList.add( data );
      });
    }catch(e){
      print("POST 실패! ${e}");
    }
  }

  // 3) 전체 조회 useEffect( ()=>{} , [] ) 처럼 최초 열렸을 때 1번 실행
   void goodsAll() async{
    try{
      final response = await dio.get("http://192.168.40.186:8080/api/goods/list");
      final data = response.data;
      print( data ); // 통신결과
      setState(() {
        goodsList = data;
      });// ********************* 통신 결과를 함수 밖 변수(상태) 업데이트(렌더링) *********************

    }catch(e){ print( e ); }
   }//

  // 4) initState() 함수 오버라이딩하여 위젯의 초기상태
  @override
  void initState(){ goodsAll(); } // 최초 1회 goodsAll(); 실행!

  // 5) dio로 가져온 데이터를 저장하는 상태변수
  dynamic goodsList = []; //? 까지 하면 null 포함
  // dynamic --> 동적 타입

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

            ElevatedButton(onPressed: goodsSave , child: Text("제품등록")),
            // map 비슷
            // List.map( (goods, index) => return  )
            Expanded(
              child: ListView.builder(
                itemCount: goodsList.length,        // 리스트 갯수 정의
                itemBuilder: (context, index){      // 배열
                dynamic goods = goodsList[index]; // index번째 1개 반환.
                // print( goods );
                return Card( child: ListTile(
                  title : Text( goods['gname'] ), // 객체명['속성명']
                  subtitle : Text( goods['gdesc'] ),
                ));
              })
            )
          ],
        ),
      ),
    );
  }
}








