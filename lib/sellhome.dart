import 'package:flutter/material.dart';
import 'package:haksikhelper/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  List<Text> menu = [Text('짜장밥'),Text('짬뽕국물'),Text('김치')];
  @override
  void initState() {
    data = [
      _ChartData('MON', 12, 0.5),
      _ChartData('TUE', 15, 0.3),
      _ChartData('WED', 30, 0.34),
      _ChartData('THU', 6.4, 0.29),
      _ChartData('FRI', 14, 0.12)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

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
          title: const Text('최대 이용자 수'),
        ),
        body: ListView(children: [
          Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/common.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<_ChartData, String>>[
                    BubbleSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        sizeValueMapper: (_ChartData data, _) => data.size,
                        name: 'Gold',
                        color: Color.fromRGBO(8, 142, 255, 1),
                        gradient: gradientColors),
                  ])),
          Container(
            child: Column(
              children: [
                Container(child: Text('피크 시간'),),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('5시 30분'),
                      Text('12시 33분'),
                      Text('15시 40분')
                    ],
                  ),
                )
              ],
            )
          ),
          TextButton(onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('월요일 식단'),
                  content: Column(
                    children: [
                      TextField(
                        controller: textController,
                      ),
                      TextButton(onPressed: (){
                      }, child: Text('추가'))
                    ],
                  ),
                );
              },
            );
          }, child: Text('학식 메뉴 수정')),
        ]

        ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.size);

  final String x;
  final double y;
  final double size;
}
