import 'dart:async';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveChartWidget extends StatefulWidget {
  LiveChartWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LiveChartWidgetState createState() => _LiveChartWidgetState();
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 15), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    color: const Color.fromRGBO(192, 108, 132, 1),
                    xValueMapper: (LiveData people, _) => int.parse(people.time),
                    yValueMapper: (LiveData people, _) => people.speed,
                  )
                ],
                primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 3,
                    title: AxisTitle(text: '시간별 이용자 수 추이   ')),
                primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    ))));
  }

  int time = 1238;
  void updateDataSource(Timer timer) {
    int a = (math.Random().nextInt(60) + 30);
    chartData.add(LiveData((time++).toString(), a));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData('1230', 12),
      LiveData('1231', 23),
      LiveData('1232', 43),
      LiveData('1233', 34),
      LiveData('1234', 30),
      LiveData('1235', 34),
      LiveData('1236', 45),
      LiveData('1237', 50),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final String time;
  final num speed;
}