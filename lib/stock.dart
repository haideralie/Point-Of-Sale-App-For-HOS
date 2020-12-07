import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hos_app/customreport.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';

int _value = 1;
int _value2 = 1;
int _value3 = 1;

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  Map itemdata;
  List itemlist = List();
  List supplierlist = List();

  String val;
  int selectitem_index, selectsupplier_index;

  var abc;

  Future<String> getdata() async {
    var response = await http.get(
        Uri.encodeFull('http://192.168.10.50:8081/api/Account/Purchase'),
        headers: {'Accepts': 'application/json'});
    Map<String, dynamic> map = json.decode(response.body);

    setState(() {
      itemlist = map['item'];
      supplierlist = map['supplier'];
    });
  }

  bool asTabs = false;
  String selectedValue;
  String preselectedValue = "dolor sit";
  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];

  //static const String appTitle = "Search Choices demo";
  // final String quickaction =
  //     "Today Report, 1 WeekReport, 2 WeekReport ,3 WeekReport, 4 WeekReport ,5 WeekReport ,6 WeekReport.";
  @override
  void initState() {
    super.initState();

    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stock Report'),
        ),
        body: SafeArea(
            child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(height: 30),
                  Text(
                    'Products',
                    style: TextStyle(color: Colors.blue),
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
                        itemlist.map((e) {
                          if (e['iteM_NAME'] == value) {
                            setState(() {
                              val = value;
                              selectitem_index = itemlist.indexOf(e);
                            });
                          }
                        });

                        print(val);
                        Toast.show(value, context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      },
                      hint: Text('Select Product'),
                      items: itemlist.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item['iteM_NAME']),
                          value: item['iteM_CODE'].toString(),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Generate Report',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ]))));
  }
}
