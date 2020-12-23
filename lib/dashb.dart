//import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';
import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashb extends StatefulWidget {
  @override
  _DashbState createState() => _DashbState();
}

class _DashbState extends State<Dashb> {
  Map dashdata;
  List paylist = List();
  List receivelist = List();
  //String value;

  String val;
  int selectpay_index, selectreceive_index;
  var abc;

  Future<String> getdata() async {
    var response = await http.get(
        Uri.encodeFull('http://192.168.10.50:8081/api/Account/LedgerBalance'),
        headers: {'Accepts': 'application/json'});
    Map<String, dynamic> map = json.decode(response.body);

    setState(() {
      paylist = map['payableTotal'];
      receivelist = map['receivableTotal'];
    });

    paylist.map((e) {
      setState(() {
        e['totalBalance'] == val;

        val = val;
        selectpay_index = paylist.indexOf(e);
      });
    });
  }

  // value: val,
  // onChanged: (String value) {
  //   paylist.map((e) {
  //     if (e['totalBalance'] == value) {
  //       setState(() {
  //         val = value;
  //         selectpay_index = paylist.indexOf(e);
  //       });
  //     }
  //   });
  //
  //   print(val);
  //   Toast.show(value, context,
  //       duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  // },

  @override
  void initState() {
    // TODO: implement initState

    getdata();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      //ChartData('Hello', double.parse(paydata).sign),

      ChartData(paylist.toString(), 50),
      ChartData(receivelist.toString(), 80),

      // ChartData('Total Recievable', recievedata),

      // ChartData('David', 25),
      // ChartData('Steve', 38),
      // ChartData('Jack', 34),
      // ChartData('Others', 52)
    ];

    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.blue, child: Text('payable/receivable')),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Text(
                  'Payable',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Container(),

                Container(
                    height: 100,
                    width: 500,
                    child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper: (ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ],
                    )),

                // Container(
                //   height: 100,
                //   width: 500,
                //   child: SearchableDropdown.single(
                //     isExpanded: true,
                //
                //     isCaseSensitiveSearch: false,
                //     searchHint: new Text('Search Customer'),
                //     value: val,
                //     onChanged: (String value) {
                //       paylist.map((e) {
                //         if (e['totalBalance'] == value) {
                //           setState(() {
                //             val = value;
                //             selectpay_index = paylist.indexOf(e);
                //           });
                //         }
                //       });
                //
                //       print(val);
                //       Toast.show(value, context,
                //           duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                //     },
                //
                //     hint: Text('Select pay'),
                //
                //     items: paylist.map((item) {
                //       return new DropdownMenuItem(
                //         child: new Text(item['totalBalance']),
                //         value: item['totalBalance'].toString(),
                //       );
                //     }).toList(),
                //
                //     // items: items,
                //     // value: selectedValue,
                //     // hint: "Select one",
                //     // searchHint: "Select one",
                //     // onChanged: (value) {
                //     //   setState(() {
                //     //     selectedValue = value;
                //     //   });
                //     // },
                //   ),
                // ),
                Text(
                  'Receivable',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 100,
                  width: 500,
                  child: SearchableDropdown.single(
                    isExpanded: true,
                    isCaseSensitiveSearch: false,
                    searchHint: new Text('Search Product'),
                    value: val,
                    onChanged: (String value) {
                      receivelist.map((e) {
                        if (e['totalBalance'] == value) {
                          setState(() {
                            val = value;
                            selectreceive_index = receivelist.indexOf(e);
                          });
                        }
                      });

                      print(val);
                      Toast.show(value, context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },

                    hint: Text('Choose Product'),

                    items: receivelist.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['totalBalance']),
                        value: item['totalBalance'].toString(),
                      );
                    }).toList(),

                    // items: items,
                    // value: selectedValue,
                    // hint: "Select Product",
                    // searchHint: "Select one",
                    // onChanged: (value) {
                    //   setState(() {
                    //     selectedValue = value;
                    //   });
                    // },
                  ),
                ),
                Container(
                  height: 80,
                  width: 500,
                  padding: EdgeInsets.fromLTRB(0, 30, 10, 5),
                  color: Colors.blue,
                  child: Text(
                    'Generate Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color color;
}
