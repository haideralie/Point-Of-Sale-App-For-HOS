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

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  Map itemdata;
  List itemlist = List();
  List customerlist = List();

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

    items.add(
      DropdownMenuItem(
        key: Key('1'),
        child: Text('Today Report'),
        value: 1,
      ),
    );
    items.add(
      DropdownMenuItem(
        key: Key('2'),
        child: Text('1 Week Report'),
        value: 2,
      ),
    );
    items.add(
      DropdownMenuItem(
        key: Key('1'),
        child: Text('2 Week Report'),
        value: 3,
      ),
    );
    items.add(
      DropdownMenuItem(
        key: Key('1'),
        child: Text('3 Week Report'),
        value: 4,
      ),
    );
    items.add(
      DropdownMenuItem(
        key: Key('1'),
        child: Text('4 Week Report'),
        value: 5,
      ),
    );
    items.add(
      DropdownMenuItem(
        key: Key('1'),
        child: Text('5 Week Report'),
        value: 6,
      ),
    );

    // // TODO: implement initState
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
    //   Map<String, Widget> widgets;
    //   widgets = {
    //     "Single dialog": SearchableDropdown.single(
    //       items: items,
    //       value: selectedValue,
    //       hint: "Select one",
    //       searchHint: "Select one",
    //       onChanged: (value) {
    //         setState(() {
    //           selectedValue = value;
    //         });
    //       },
    //       isExpanded: true,
    //     ),
    //   };

    return Scaffold(
        appBar: AppBar(
          title: Text('Sales'),
        ),
        body: SafeArea(
            child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Padding(padding: EdgeInsets.fromLTRB(0, 0, 50, 0)),
                              Container(
                                  // color: Colors.blue,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20))),
                                  child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Quick Action',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(20))),
                                child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Customreport()));
                                    },
                                    child: Text(
                                      'Custom Report',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ]),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Text(
                    'Quick Action',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.left,
                  ),

                  Container(
                    height: 100,
                    width: 500,
                    child: SearchableDropdown.single(
                      items: items,
                      value: selectedValue,
                      hint: "Select one",
                      searchHint: "Select one",
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),

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
                          value: item['iteM_NAME'].toString(),
                        );
                      }).toList(),
                    ),
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
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      },
                      hint: Text('Select Customer'),
                      items: customerlist.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item['cuS_NAME']),
                          value: item['cuS_NAME'].toString(),
                        );
                      }).toList(),
                    ),
                  ),
                  //
                  //       Text(
                  //         'Quick Action',
                  //         style: TextStyle(color: Colors.blue),
                  //       ),
                  //
                  //       // DropdownButton(
                  //       //     value: _value,
                  //       //     items: [
                  //       //       DropdownMenuItem(
                  //       //         child: Text('Today Report'),
                  //       //         value: 1,
                  //       //       ),
                  //       //       DropdownMenuItem(
                  //       //         child: Text("1 Week Report"),
                  //       //         value: 2,
                  //       //       ),
                  //       //       DropdownMenuItem(
                  //       //         child: Text("2 Week Report"),
                  //       //         value: 3,
                  //       //       ),
                  //       //       DropdownMenuItem(
                  //       //         child: Text("3 Week Report"),
                  //       //         value: 4,
                  //       //       ),
                  //       //       DropdownMenuItem(
                  //       //         child: Text("4 Week Report"),
                  //       //         value: 5,
                  //       //       ),
                  //       //     ],
                  //       //     onChanged: (value) {
                  //       //       setState(() {
                  //       //         _value = value;
                  //       //       });
                  //       //     }),
                  //       Container(
                  //         child: Column(
                  //           children: [
                  //             Text(
                  //               'Product',
                  //               style: TextStyle(color: Colors.blue),
                  //             ),
                  //             DropdownButton(
                  //                 value: _value2,
                  //                 items: [
                  //                   DropdownMenuItem(
                  //                     child: Text('Choose Product'),
                  //                     value: 1,
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text('Product 1'),
                  //                     value: 2,
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text('Product 2'),
                  //                     value: 3,
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text('Product 3'),
                  //                     value: 4,
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text('Product 4'),
                  //                     value: 5,
                  //                   ),
                  //                 ],
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _value2 = value;
                  //                   });
                  //                 }),
                  //             Container(
                  //               child: Column(
                  //                 children: [
                  //                   Text(
                  //                     'Customer',
                  //                     style: TextStyle(color: Colors.blue),
                  //                   ),
                  //                   DropdownButton(
                  //                       value: _value3,
                  //                       items: [
                  //                         DropdownMenuItem(
                  //                           child: Text('Customer 1'),
                  //                           value: 1,
                  //                         ),
                  //                         DropdownMenuItem(
                  //                           child: Text('Customer 2'),
                  //                           value: 2,
                  //                         )
                  //                       ],
                  //                       onChanged: (value) {
                  //                         setState(() {
                  //                           _value3 = value;
                  //                         });
                  //                       }),
                  //                 ],
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ]))));
  }
}
