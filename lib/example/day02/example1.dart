void main(){
  // 1. 기본 타입
  int age = 25;
  print("나이 :${ age }");

  double height = 175.5;
  bool isStudent = false;

  String name ="홍길동";
  print("이름 : ${ name }, 키 : ${ height }, 학생여부 : ${ isStudent} ");

  // 2. 주요변수/상수 키워드
  var city = "서울"; // js처럼 자동타입 추론 - 타입변경 불가능
  dynamic count = 123; // ★★★★ 자동타입 ★★★★ + 타입변경가능 dynamic == Object 같은, 외부 데이터를 받을 때 유용하게 사용할 수 있다.
  count ="123명";
  const PI = 3.141562; // js처럼 const 상수 --> 런타임할때(실행도중) 상수를 처리
  final country = "대한민국"; //java 처럼 final 상수 -> 컴파일(기계어 번역시) 시점시 상수 처리

  // 3. List, Map, Set ( 컬렉션 )
  List<String> fruits = ["사과","바나나","포도"];
  fruits.add("감");
  print("과일목록 : ${fruits}");

  Map< String, int> scores = {  "국어" : 90, "수학" : 100, "영어" : 50 }; // 랩퍼타입이 없어서 기본 타입 제네릭 가능
  print("점수목록 : ${ scores }");

  // dynamic 으로 모든 형타입 대응 가능하지만 자료타입을 개발자가 알아야 하기 때문에 장단이 있다.
  Set< int> numbers = {  1,2,3,3,2 }; // 중복값이 없는 집합, 리스트는 인덱스 기준으로 여러 항목 나열. 맵은 키와 값을 기준으로 나열
  print( "중복없는 집합 : ${ numbers }");

  // 4. 함수 , --> 자바와 다르게 public 이런거 없음
  int add( int a, int b ){ return  a+b; }
  int result = add( 3, 5);
  print( result );

  // 5. 익명함수( == 화살표 함수) =>  도 삭제함.
  //var 함수명 = (){}
  var multiply = ( int x, int y ){ return x + y; };
  int result2 = multiply(3, 5);
  print( result2 );

  // 6. 클래스(멤버변수/생성자) /객체
  // 플러터는 프론트엔드 기반이라 입출력 담당/프론트에서 데이터를 가공하는 것은 보안상 좋지 않다.
  // 리액트에서도 객체 만드는 것은 지양
  // new 없음 , 위젯이란> 미리 만들어진 클래스, 또는 내가 만든 클래스
  Person p1 = new Person("신동엽", 10);
  Person p2 = Person("강호동", 40);

  // 7. null을 갖는 타입, 타입명 뒤에 ?
  String? nickName;
  nickName = null;
  print("닉네임 : ${ nickName ?? '미정'}" );

  // 8. if/for문




}// main end

// 클래스 : 메인 함수 밖에 만들 것
class Person{
  // 멤버 변수
  String name;
  int age;
  // 생성자
  Person( this.name , this.age );

}