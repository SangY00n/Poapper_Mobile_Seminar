import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBTI Test',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MBTI 유형 검사'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'MBTI 검사',
            ),
            FlatButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return TestPage(); // 여기에 검사페이지로 가는 거 넣으면 됨
              }));
            }, child: Container(
                color: Colors.green,
                child: Text("시작하기"))),
          ],
        ),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  // List<String> _questions=['나는 평소','질문2','질문3', '질문4',
  //   '질문5', '질문6', '질문7', '질문8',
  //   '질문9', '질문10', '질문11', '질문12',
  //   '질문13', '질문14', '질문15', '질문16'];
  String question='두 문장 중 내 성격이 어느 쪽에 더 가까운지 생각한 후에\n둘 중 하나를 선택하십시오.\n\n';
  List<String> _answers1=['밖에서 활동하기 좋아하는 편이다.', '말을 많이 하는 편이다.', '폭넓게 친구를 사귀는 편이다.', '사람들과 만나는 것을 즐기는 편이다.', '다양한 활동을 선호하는 편이다.',
    '경험에 의존하는 편이다.', '확실한 것을 선호하는 편이다.', '실효성이 높은 것을 선호하는 편이다.', '확실한 데이터를 믿는 편이다.', '세부적인 것을 따지는 편이다.',
    '원칙대로 하는 편이다.', '냉철한 이성으로 판단하는 편이다.', '따질 것은 따지는 편이다.', '결과를 중요하게 생각하는 편이다.', '일 위주로 하는 편이다.',
    '사전에 계획하는 편이다.', '계획이 짜여 있어야 마음이 편하다.', '결론을 잘 내리는 편이다.', '목표가 분명한 편이다.', '끝맺음을 잘 하는 편이다.'];
  List<String> _answers2=['실내에 있기를 좋아한다.', '말을 적게 하는 편이다.', '소수의 친한 친구를 사귀는 편이다.', '혼자 있어도 싫지 않은 편이다.', '한 가지에 집중하는 편이다.',
    '아이디어에 의존하는 편이다.', '애매해도 참신한 것을 선호하는 편이다.', '좋은 명분이 있는 것을 선호하는 편이다.', '본능적인 느낌을 믿는 편이다.', '종합적인 큰 그림을 보는 편이다.',
    '조화를 생각해서 하는 편이다.', '내가 공감한 대로 판단하는 편이다.', '가능하면 좋게 생각하는 편이다.', '과정을 중요하게 여기는 편이다.', '관계된 사람 위주로 하는 편이다.',
    '일단 해가면서 계획하는 편이다.', '계획이 없어야 마음이 자유롭다.', '아이디어를 잘 받아들이는 편이다.', '목표를 상황에 따라 바꾸는 편이다.','일을 잘 벌이는 편이다.'];
  int _index=0;
  List<int> _ansCount=[0,0,0,0];

  void _incrementIndex() {
    setState((){
        if(_index<19){
          _index++;
          print('인덱스 증가: $_index');
        }

      }
    );
  }

  void _incrementAnsCount(int i) {
    setState((){
        _ansCount[i]=_ansCount[i]+1;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('MBTI 유형 검사 페이지'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              question, // 질문
            ),
            // 답안 1
            FlatButton(onPressed: (){
              if(_index<19) {
                _incrementAnsCount(_index~/5);
                _incrementIndex();
              } else {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return ResultPage(ansCount: _ansCount);
                }));
              }
            }, child: Container(
                color: Colors.red,
                child: Text(_answers1[_index]))),
            // 답안 2
            FlatButton(onPressed: (){
              if(_index<19) {
                // _incrementAnsCount(_index~/4);
                _incrementIndex();
              } else {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return ResultPage(ansCount: _ansCount);
                }));
              }
            }, child: Container(
                color: Colors.blue,
                child: Text(_answers2[_index]))),
          ],
        ),
      ),
    );
  }
}



class ResultPage extends StatelessWidget {
  final List<int> ansCount;
  const ResultPage({
    required this.ansCount, Key? key}) : super(key: key);

  String _printResult(){
    int i=0;
    String str='';

    for(i=0;i<4;i++){
      if(i==0){
        if(ansCount[i]>=3) {
          str=str+'E';
        } else {
          str=str+'I';
        }
      } else if(i==1){
        if(ansCount[i]>=3) {
          str=str+'S';
        } else {
          str=str+'N';
        }
      } else if(i==2){
        if(ansCount[i]>=3) {
          str=str+'T';
        } else {
          str=str+'F';
        }
      } else if(i==3){
        if(ansCount[i]>=3) {
          str=str+'J';
        } else {
          str=str+'P';
        }
      }

    }

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('MBTI 유형 검사 결과'),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '당신의 MBTI는 ${_printResult()} 입니다.', // 결과 출력
            ),
            FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: Container(
                color: Colors.green,
                child: Icon(Icons.home))),
          ],
        ),

      ),
    );
  }
}