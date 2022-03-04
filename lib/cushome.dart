import 'package:flutter/material.dart';
import 'package:haksikhelper/provider.dart';
import 'package:provider/provider.dart';
class customerHome extends StatefulWidget {
  const customerHome({Key? key}) : super(key: key);
  @override
  State<customerHome> createState() => _customerHomeState();
}

class _customerHomeState extends State<customerHome> {
  @override
  Widget build(BuildContext context) {
    var guideBar = Container(
      padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  boxColor[4],
                  boxColor[3],
                  boxColor[2],
                  boxColor[1],
                  boxColor[0]
                ]),
            border:
            Border.all(color: Color.fromRGBO(236, 247, 255, 10), width: 1),
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );

    return ListView(
      children: [
        Container(
          color: Color.fromRGBO(243, 255, 254, 1),
          child: Text(
            "구역별 포화도",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(214, 219, 223, 10),
                border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
            child: Row(
              // 홈화면에서 윗부분 학식 구역 나누는 부분.
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          // 식사 2구역
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.20,
                          color: Color.fromRGBO(243, 255, 254, 1),
                          child: main_box(
                            BC: boxColor[3],
                          ),
                        ),
                        Container(
                          // 식사 3구역
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 100),
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: MediaQuery.of(context).size.height * 0.20,
                          color: Color.fromRGBO(243, 255, 254, 1),
                          child: main_box(
                            BC: boxColor[4],
                          ),
                        )
                      ],
                    ),
                    Container(
                      // 식사 1구역
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.10,
                      color: Color.fromRGBO(243, 255, 254, 1),
                      child: main_box(BC: boxColor[1]),
                    )
                  ],
                ),
                Container(
                  // 대기줄 1구역
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.30,
                  color: Color.fromRGBO(243, 255, 254, 1),
                  child: main_box(BC: boxColor[1]),
                ),
                Container(
                  // 포화도 표시 가이드바.
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: MediaQuery.of(context).size.height * 0.30,
                  color: Color.fromRGBO(243, 255, 254, 1),
                  child: guideBar,
                )
              ],
            )),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 255, 254, 1),
              ),
              child: Text('식단'),
            ), // 학식 식단
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('월요일 식단'),
                          content: Text('월월'),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      day[0],
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1, color: Colors.grey))),
                          child: ListView.builder(
                              itemCount: mon.length,
                              itemBuilder: (c, i) {
                                return ListTile(
                                  leading: mon[i],
                                );
                              })),
                    ],
                  ), //MON
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('월요일 식단'),
                          content: Text('월월'),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      day[1],
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1, color: Colors.grey))),
                          child: ListView.builder(
                              itemCount: mon.length,
                              itemBuilder: (c, i) {
                                return ListTile(
                                  leading: mon[i],
                                );
                              })),
                    ],
                  ),
                ), //TUE
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('월요일 식단'),
                          content: Text('월월'),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      day[2],
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1, color: Colors.grey))),
                          child: ListView.builder(
                              itemCount: mon.length,
                              itemBuilder: (c, i) {
                                return ListTile(
                                  leading: mon[i],
                                );
                              })),
                    ],
                  ),
                ), //Wed
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('월요일 식단'),
                          content: Text('월월'),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      day[3],
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1, color: Colors.grey))),
                          child: ListView.builder(
                              itemCount: mon.length,
                              itemBuilder: (c, i) {
                                return ListTile(
                                  leading: mon[i],
                                );
                              })),
                    ],
                  ), //MON
                ), //Thu
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('월요일 식단'),
                          content: Text('월월'),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      day[4],
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: ListView.builder(
                              itemCount: mon.length,
                              itemBuilder: (c, i) {
                                return ListTile(
                                  leading: mon[i],
                                );
                              })),
                    ],
                  ),
                ), //FRI
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/banner1.jpeg"), fit: BoxFit.cover)),
        ), //Event banner
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/banner2.jpeg"), fit: BoxFit.cover)),
        ), //Event banner 2
      ],
    );
  }
}
// data from server

var currentD = DateTime.now();
var t = currentD.second;
List<Color> boxColor = [
  Colors.green,
  Colors.lightGreenAccent,
  Colors.yellow,
  Colors.orange,
  Colors.red
];
List<Text> mon = [Text('밥'), Text('국'), Text('김치')];
List<Text> day = [
  Text('MON'),
  Text('TUE'),
  Text('WED'),
  Text('THU'),
  Text('FRI')
];

class main_box extends StatelessWidget {
  main_box({Key? key, this.BC}) : super(key: key);
  final BC;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        decoration: BoxDecoration(
          color: BC,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        duration: Duration(seconds: 1));
  }
}

