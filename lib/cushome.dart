import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haksikhelper/provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Palette.dart';

class customerHome extends StatefulWidget {
  const customerHome({Key? key}) : super(key: key);
  @override
  State<customerHome> createState() => _customerHomeState();
}

class _customerHomeState extends State<customerHome> {
  late List<Color> getColor;

  @override
  Widget build(BuildContext context) {
    @override
    void initState(){


    }

    bool isSignupScreen = true;

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
          shadowColor: Colors.transparent,
          title: Text('학식도우미',style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
      backgroundColor: Color.fromRGBO(210, 255, 251, 1)),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color.fromRGBO(243, 255, 254, 1),
              child: Text(
                "구역별 포화도",
                textAlign: TextAlign.center,
              ),
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
                              BC: boxColor[1],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                // 식사 3구역
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                width: MediaQuery.of(context).size.width * 0.50,
                                height: MediaQuery.of(context).size.height * 0.10,
                                color: Color.fromRGBO(243, 255, 254, 1),
                                child: main_box(
                                  BC: boxColor[1],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                width: MediaQuery.of(context).size.width * 0.50,
                                height: MediaQuery.of(context).size.height * 0.10,
                                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/guide.png'),fit: BoxFit.fill)),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        // 식사 1구역
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.10,
                        color: Color.fromRGBO(243, 255, 254, 1),
                        child: main_box(BC: boxColor[3]),
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
                  color: Color.fromRGBO(210, 255, 251, 1),
                  border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text('금주의 식단',style: GoogleFonts.notoSans(fontSize: 15 ,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = false;
                        print(isSignupScreen);
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          '1코너',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: !isSignupScreen
                                  ? Palette.activeColor
                                  : Palette.textColor1),
                        ),
                        if (!isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = true;
                        print(isSignupScreen);
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          '2코너',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSignupScreen
                                  ? Palette.activeColor
                                  : Palette.textColor1),
                        ),
                        if (isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          )
                      ],
                    ),
                  )
                ],
              ),

                if(isSignupScreen)
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('sikdan/FPa6UWoqdCj0t2rllkXD/monday').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:docs.length,
                          itemBuilder: (context, index){
                            return Container(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child : day[index]
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Row(
                                        children: [
                                          SizedBox(
                                          width: 35
                                          ,child: Text('중식')),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                                            ),
                                          width: 250,
                                          child: Text(
                                            docs[index]['lunch'],
                                            style: Theme.of(context).textTheme.subtitle1,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 35,
                                          child: Text('석식')),
                                          Container(
                                            width: 250,
                                            child: Text(
                                              docs[index]['dinner'],
                                              style: Theme.of(context).textTheme.subtitle1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  )
                                ],
                              )
                              //child: Text(docs[index]['morning']),
                            );
                          }
                      );
                    },

                  ),
                if(!isSignupScreen)
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('sikdan/FPa6UWoqdCj0t2rllkXD/corner2').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:docs.length,
                          itemBuilder: (context, index){
                            return Container(

                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 100,
                                        child : day[index]
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(docs[index]['lunch']),
                                        Text(docs[index]['dinner']),
                                      ],
                                    )
                                  ],
                                )
                              //child: Text(docs[index]['morning']),
                            );
                          }
                      );
                    },
                  ),
              // 학식 식단
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/banner1.png"), fit: BoxFit.cover)),
          ), //Event banner
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/banner2.png"), fit: BoxFit.cover)),
          ), //Event banner 2
        ],
      ),
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
  Text('MON', style: TextStyle(fontSize: 17),),
  Text('TUE', style: TextStyle(fontSize: 17)),
  Text('WED', style: TextStyle(fontSize: 17)),
  Text('THU', style: TextStyle(fontSize: 17)),
  Text('FRI', style: TextStyle(fontSize: 17))
];
List<String> a= [
  'monday1'
  'monday2',
  'tuesday1',
  'tuesday2',
  'wednesday1'
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

