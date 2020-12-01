//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';
import 'dart:async';

class Customreport extends StatefulWidget {
  @override
  _CustomreportState createState() => _CustomreportState();
}

class _CustomreportState extends State<Customreport> {
  Map itemdata;
  List itemlist = List();
  List customerlist = List();

  String datetotext(DateTime dateTime) {
    if (dateTime == null) {
      return 'Start Date';
    } else {
      return "${dateTime.toLocal()}".split(' ')[0];
    }
  }

  String val;
  int selectitem_index, selectcustomer_index;

  var abc;

  Future<String> getdata() async {
    var response = await http.get(
        Uri.encodeFull('http://192.168.10.50:8081/api/Account/Sale'),
        headers: {'Accepts': 'application/json'});
    Map<String, dynamic> map = json.decode(response.body);

    setState(() {
      itemlist = map['item'];
      customerlist = map['customer'];
    });
  }

  DateTime selectedDate = null;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  DateTime startDate = DateTime.now();

  Future<Null> _startDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  // bool asTabs = false;
  // String selectedValue;
  // String preselectedValue = "dolor sit";
  // List<int> selectedItems = [];
  // final List<DropdownMenuItem> items = [];

  //static const String appTitle = "Search Choices demo";
  // final String quickaction =
  //     "Today Report, 1 WeekReport, 2 WeekReport ,3 WeekReport, 4 WeekReport ,5 WeekReport ,6 WeekReport.";
  @override
  void initState() {
    // TODO: implement initState

    getdata();

    //
    // String wordPair = "";
    // quickaction
    //     .toLowerCase()
    //     .replaceAll(",", "")
    //     .replaceAll(".", "")
    //     .split(" ")
    //     .forEach((word) {
    //   if (wordPair.isEmpty) {
    //     wordPair = word + " ";
    //   } else {
    //     wordPair += word;
    //     if (items.indexWhere((item) {
    //           return (item.value == wordPair);
    //         }) ==
    //         -1) {
    //       items.add(DropdownMenuItem(
    //         child: Text(wordPair),
    //         value: wordPair,
    //       ));
    //     }
    //     wordPair = "";
    //   }
    // });
    //
  }

  // List<Widget> get appBarActions {
  //   return ([
  //     Center(child: Text("Tabs:")),
  //     Switch(
  //       activeColor: Colors.white,
  //       value: asTabs,
  //       onChanged: (value) {
  //         setState(() {
  //           asTabs = value;
  //         });
  //       },
  //     )
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    // Map<String, Widget> widgets;
    // widgets = {
    //   "Single dialog": SearchableDropdown.single(
    //     items: items,
    //     value: selectedValue,
    //     hint: "Select One",
    //     searchHint: "Select One",
    //     onChanged: (value) {
    //       setState(() {
    //         selectedValue = value;
    //       });
    //     },
    //     isExpanded: true,
    //   ),
    // };

    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.blue, child: Text('Custom Report')),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(35, 100, 50, 50)),

                    GestureDetector(
                      onTap: () => _startDate(context),

                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        height: 30,
                        width: 100,
                        child: Text(
                          datetotext(selectedDate),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      // decoration: BoxDecoration(
                      //     color: Colors.deepPurple,
                      //     borderRadius: BorderRadius.horizontal(
                      //         right: Radius.elliptical(2, 20))),
                      // child: Center(
                      //   child: Text(
                      //     'Start Date',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ),

                    Padding(padding: EdgeInsets.all(20)),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        height: 30, width: 100,

                        child: Text("${selectedDate.toLocal()}".split(' ')[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),

                        // SizedBox(
                        //   height: 20.0,
                        // ),
                        // child: RaisedButton(
                        //
                        //   child: Text('Select date'),
                        // ),
                      ),
                    ),

                    //  color: Colors.blue,

                    // decoration: BoxDecoration(
                    // //     color: Colors.deepPurple,
                    // //     borderRadius: BorderRadius.horizontal(
                    // //         right: Radius.elliptical(2, 20))),
                    // // child: Center(
                    // //   child: Text(
                    // //     'End Date',
                    // //     style: TextStyle(color: Colors.white),
                    //   ),
                  ],
                ),
                Text(
                  'Customer',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 100,
                  width: 500,
                  child: SearchableDropdown.single(
                    isExpanded: true,

                    isCaseSensitiveSearch: false,
                    searchHint: new Text('Search Customer'),
                    value: val,
                    onChanged: (String value) {
                      customerlist.map((e) {
                        if (e['cuS_NAME'] == value) {
                          setState(() {
                            val = value;
                            selectcustomer_index = customerlist.indexOf(e);
                          });
                        }
                      });

                      print(val);
                      Toast.show(value, context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },

                    hint: Text('Select Customer'),

                    items: customerlist.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['cuS_NAME']),
                        value: item['cuS_NAME'].toString(),
                      );
                    }).toList(),

                    // items: items,
                    // value: selectedValue,
                    // hint: "Select one",
                    // searchHint: "Select one",
                    // onChanged: (value) {
                    //   setState(() {
                    //     selectedValue = value;
                    //   });
                    // },
                  ),
                ),
                Text(
                  'Products',
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
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },

                    hint: Text('Choose Product'),

                    items: itemlist.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['iteM_NAME']),
                        value: item['iteM_NAME'].toString(),
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
