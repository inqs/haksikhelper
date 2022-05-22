import 'package:flutter/material.dart';
import 'package:haksikhelper/addMenu.dart';
import 'package:haksikhelper/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haksikhelper/realtimeChart.dart';
class SellHome extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SellHome({Key? key}) : super(key: key);

  @override
  _SellHomeState createState() => _SellHomeState();
}

class _SellHomeState extends State<SellHome> {
  final textController = TextEditingController();
  late TooltipBehavior _tooltip;
  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.blue[50]!);
    color.add(Colors.blue[100]!);
    color.add(Colors.blue);
    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);
    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Scaffold(
        appBar: AppBar(
          title: const Text('영양사',style: TextStyle(color: Colors.grey),),
            backgroundColor: Color.fromRGBO(210, 255, 251, 1)
        ),
        body: ListView(children: [
          Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.30,
              child: LiveChartWidget(title: 'live chart',),
              ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Container(
            padding: EdgeInsets.all(10),
                  child: Text('피크 시간'),),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all()
                          ),
                          child: Text('5시 30분')),
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all()
                          ),
                          child: Text('12시 33분')),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all()
                        ),
                          child: Text('17시 40분'))
                    ],
                  ),
                )
              ],
            )
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.grey,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    shape: StadiumBorder()),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>addMenu())
                  );
                },
                child: Text(
                  '식단 추가하기',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white54,
                    backgroundColor: Colors.white54,
                    padding: EdgeInsets.all(15),
                    shape: StadiumBorder()),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>addMenu())
                  );
                },
                child: Text(
                  '이벤트',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ]

        ));
  }
}
