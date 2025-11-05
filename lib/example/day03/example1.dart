//플러터 라이브러리 : https://pub.dev
// dependencies:
//  flutter:
//   sdk: flutter
//  dio: ^5.9.0
// Dio는 HTTP 요청/응답을 처리하기 위한 강력한 Flutter 패키지
import 'package:dio/dio.dart';

final dio = Dio(); // dio 상수에 Dio 객체를 저장

// 1. GET 방식의 요청 함수
void getEvent()async {
  // dart의 람다식은 ()=>{} ----> (){} 이것을 많이 사용
  try{
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print("1. Get 성공! ${response.data}");
  }catch(e){
    print("1. Get 실패! ${e}");
  }
}

// 2. POST 방식의 요청 함수
void postEvent() async {
  // dart의 람다식은 ()=>{} ----> (){} 이것을 많이 사용
  try{
    final obj = { 'title': 'foo11', 'body': 'bar11', 'userId': 1 };
    final response = await dio.post("https://jsonplaceholder.typicode.com/posts", data:obj);
    print("2. POST 성공! ${response.data}");
  }catch(e){
    print("2. POST 실패! ${e}");
  }
}

/** 메인 함수 */
void main(){
  print("다트 프로그램 시작점");
  getEvent();   //GET 호출
  postEvent();  //POST 호출
}//main end