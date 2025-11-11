import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final dio = Dio(); // dio 상수에 Dio 객체를 저장

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}
class HomeState extends State<Home>{

  @override void initState() { // 1. 위젯이 최초로 열렸을때 실행하는 함수
    findAll();
  }
  // 전체 조회 dynamic todoList = []; // 3. 가져온 todo목록
  List<dynamic> todoList = []; // 3. 가져온 todo목록
  void findAll() async{ // 2. Spring 서버로 부터 todo (전체)목록 가져오기
    try{
      final response = await dio.get( "http://192.168.40.186:8080/api/todo" );
      final data = await response.data;
      setState(() { todoList = data;  });
      //print(data);
    }catch(e){ print(e);}
  }

  // 개별 삭제
  void delete(int tno)  async{
    try{
      final response = await dio.delete("http://192.168.40.186:8080/api/todo?tno=${tno}");
      final data = await response.data;
      print(data);
      if( data == true ){ findAll(); }
    }catch( e ){ print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO"),),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView(
              children: todoList.map((todo){ // map 반복문은 dynamic 타입 매핑이 안된다. dynamic을 사용할 경우에는 빌더를 사용 .
                    return Card( child: ListTile(
                      title: Text(todo['title']),
                      subtitle: Row( children: [
                        Text( todo['content'] ),
                        //Text( todo['createDate'] )
                      ],),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,// 정렬/사이즈, 오른쪽 버튼들의 위젯들의 넓이를 카드 기준으로 자동으로 최소크기 할당
                        children: [
                          //TextButton(onPressed: (){}, child: Text("버튼"))
                          IconButton(onPressed: (){ delete(todo['tno']);}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () async{
                            final result = await Navigator.pushNamed(context, "/update", arguments: todo['tno']);
                            print(result); //  수정 성공여부 확인
                            // 만약에 푸시한 위젯이 pop을 했을때 반환값을 받아서 특정 로직 구현
                            if( result == true ){ findAll(); } // 업데이트 했을 경우, 성공 반환값을 받아서 다시 리스트 재렌더링
                            }, icon: Icon(Icons.edit)),
                          // context : 현재 위젯을 가르킴 , arguments 이동할 경로에 전달할 매개변수
                          IconButton(onPressed: (){ Navigator.pushNamed(context, "/detail", arguments: todo['tno'] );}, icon: Icon(Icons.info))
                        ],
                      )//가로배치,
                    ),);
                  }).toList(),// map end 리스크 뷰에 여러개 카드 대입
              )
            ),// 확장형 세로 스크롤
          ],
        ),
      )
    );
  }
}