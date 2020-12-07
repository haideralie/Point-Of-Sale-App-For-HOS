import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hos_app/model/outstandingchart.dart';
import 'package:http/http.dart';

class Outstanding extends StatefulWidget {
  @override
  _OutstandingState createState() => _OutstandingState();
}

class _OutstandingState extends State<Outstanding> {
  List _paylist = [];

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
        print(_recievelist);
        return _recievelist;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    paydata = paychart();
    recievechart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.blue, child: Text('Payable/Recievable')),
      ),
      body: Container(
        child: Text(_paylist.toString()),
      ),
    );
  }
}
