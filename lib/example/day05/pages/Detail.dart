import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Detail extends StatefulWidget{
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {

  @override
  void initState() { // 1. 해당 위젯이 최초로 열렸을 때 함수

  }

  // 2. 이전(부모) 위젯이 변경되었을 때 실행 함수(렌더링)
  @override
  void didChangeDependencies() {
    // 상세보기 버튼을 누를때마다 서로 다른 매개변수를 가져온다.
    // ModalRoute.of(context)!.settings.arguments as 타입 --> http 기반이 아니라서
    int tno = ModalRoute.of(context)!.settings.arguments as int;
    findById(tno);
  }
  // 3. 서버로 부터 개별 조회를 한다.
  dynamic todo = {};
  void findById(int tno ) async{
    try{
      final response = await dio.get("http://192.168.40.186:8080/api/todo/detail?tno=${tno}");
      final data = await response.data;
      setState(() {
        todo = data;
      });
    }catch(e){ print(e);}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text("상세"),),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40,60,40,40), // 안쪽 여백
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,// 세로 배치 방법에서 정렬  start, end, center
          children: [
            Text( "제목 : ${ todo['title'] }" , style: TextStyle( fontSize: 20 ) ) ,
            SizedBox( height:  10 ),
            Text( "내용 : ${ todo['content'] }" , style:  TextStyle( fontSize: 18 , color: Colors.pink ) ) ,
            SizedBox( height: 20 ,) ,
            Text( "완료 여부 : ${ todo['done'] == true ? '완료' : '미완료'}" , style: TextStyle( fontSize: 18 ),),
            SizedBox( height: 20 , ) ,
            Text( "등록일 : ${ todo['createDate'] }" , style: TextStyle( fontSize: 18), ) ,
          ],
        ),
      ),
    );
  }
}