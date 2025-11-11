import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Update extends StatefulWidget{
  UpdateState createState() => UpdateState();
}

class UpdateState extends State<Update>{


  // 4. 이동한 위젯에서 매개변수 받기(확인)
  @override //
  void didChangeDependencies() {
    // 부모로 부터 받은 int type 가져오기
    int tno = ModalRoute.of( context )!.settings.arguments as int;
    findById(tno);
  }


  //5. [Update.dart] Spring 서버로 부터 개별 삭제 함수
  dynamic todo = {};
  // 2. 수정할 데이터 가져오기
  void findById( int tno ) async{
    try{
      final response = await dio.get("http://192.168.40.186:8080/api/todo/detail?tno=${tno}");
      final data = await response.data;
      setState(() {
        todo = data;
        titleCont.text = data['title'];
        contentCont.text = data['content'];
      });

    }catch(e){ print(e); }
  }

  // 입력상자 제어하는 컨트롤러
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  // 수정 함수
  void update() async{
    try{
      final obj = {
        "tno" : todo['tno'],
        "title" : titleCont.text,
        "content" : contentCont.text,
        "done" : todo['done']
      };
      final response = await dio.put("http://192.168.40.186:8080/api/todo", data: obj);
      final data = await response.data;
      print(data);
      if( data != null){
        // 업데이트가 완료( pop) 되어 이전 페이지로 가게 되면 스크립트가 아니라서
        Navigator.pop( context , true); // 만약에 성공하면 뒤로가기,

      }
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( 
      appBar: AppBar( title: Text("수정"),),
      body: Column(
        children: [
          TextField( controller: titleCont, maxLength: 30),
          SizedBox( height: 20,),

          TextField( controller: contentCont, maxLength: 255, maxLines: 5, ),// 최대 5줄
          SizedBox( height: 20,),
          
          Text(" 완료여부"),
          Switch(
              value: todo['done'],// true : on, false : off
              onChanged: ( value ){ setState(() {
                todo['done'] = value;
              });}
          ), 
          SizedBox( height: 20,),
          OutlinedButton(onPressed: update, child: Text("수정"))
          
        ],
      ),
    );
  }
}