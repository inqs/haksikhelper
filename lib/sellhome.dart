import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

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
        body: Container(
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
                primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
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
                ])));
  }
}
class _ChartData {
  _ChartData(this.x, this.y, this.size);

  final String x;
  final double y;
  final double size;
}

