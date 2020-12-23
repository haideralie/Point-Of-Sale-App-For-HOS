import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hos_app/model/outstandingchart.dart';
import 'package:hos_app/piechart.dart';
import 'package:hos_app/sales.dart';
import 'package:http/http.dart';
import 'indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';

class Outstanding extends StatefulWidget {
  @override
  _OutstandingState createState() => _OutstandingState();
}

class _OutstandingState extends State<Outstanding> {
  List _paylist = [];

  // PieChartSample2 piechart;

  Future paydata;
  Future recievedata;

  List _recievelist = [];

  Future<List> paychart() async {
    var response =
        await get('http://192.168.10.50:8081/api/Account/LedgerBalance');
    if (response.statusCode == 200) {
      var mydata = await jsonDecode(response.body);

      Outstandingchart _outstand = await Outstandingchart.fromJson(mydata);
      for (var temp in _outstand.payableTotal) {
        PayableTotal payableTotal =
            PayableTotal(totalBalance: temp.totalBalance);
        _paylist.add(payableTotal.totalBalance);

        // _paylist.indexOf('e');

        print(_paylist);
        return _paylist;
      }
    }
  }

  Future<List> recievechart() async {
    var response =
        await get('http://192.168.10.50:8081/api/Account/LedgerBalance');
    if (response.statusCode == 200) {
      var mydata = await jsonDecode(response.body);

      Outstandingchart _outstand = await Outstandingchart.fromJson(mydata);
      for (var temp in _outstand.receivableTotal) {
        ReceivableTotal receivableTotal =
            ReceivableTotal(totalBalance: temp.totalBalance);
        _recievelist.add(receivableTotal.totalBalance);
        //  _recievelist.indexOf('e');

        print(_recievelist);
        // print("New Srting:${_recievelist.replaceAll('')}");

        return _recievelist;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    paydata = paychart();
    recievedata = recievechart();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      //ChartData('Hello', double.parse(paydata).sign),

      ChartData(paydata.toString(), 50),
      ChartData(recievedata.toString(), 80),

      // ChartData('Total Recievable', recievedata),

      // ChartData('David', 25),
      // ChartData('Steve', 38),
      // ChartData('Jack', 34),
      // ChartData('Others', 52)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.blue, child: Text('Payable/Recievable')),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: FutureBuilder(
              future: paydata,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      'Total Recievable Rs.${snapshot.data.toString()}');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        Container(
          child: FutureBuilder(
              future: recievedata,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Total Payable Rs.${snapshot.data.toString()}');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        Container(
            child: SfCircularChart(
                legend: Legend(isVisible: true),
                series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]))
      ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
