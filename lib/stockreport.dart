import 'package:flutter/material.dart';
import 'package:hos_app/model/stocks.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:hos_app/model/stocks.dart';

class StocksReport extends StatefulWidget {
  @override
  _StocksReportState createState() => _StocksReportState();
}

class _StocksReportState extends State<StocksReport> {
  List _itemlist = [];
  Future itemdata;

  List _opnQtylist = []; //open quantity
  Future opnQtydata;

  List _clsQtylist = []; //closing quantity
  Future clsQtydata;

  Future<List> itemchart() async {
    var response = await get('http://192.168.10.50:8081/api/Account/Stock');
    if (response.statusCode == 200) {
      var mydata = await jsonDecode(response.body);

      Stocks _stock = await Stocks.fromJson(mydata);
      for (var temp in _stock.stock) {
        Stock stock = Stock(itemName: temp.itemName);
        print(stock.itemName);
        _itemlist.add(stock);
        print(_itemlist);
      }
      return _itemlist;
    }
  }

  Future<List> opnQtychart() async {
    var response = await get('http://192.168.10.50:8081/api/Account/Stock');
    if (response.statusCode == 200) {
      var mydata = await jsonDecode(response.body);

      Stocks _stock = await Stocks.fromJson(mydata);
      for (var temp in _stock.stock) {
        Stock stock = Stock(opNQTY: temp.opNQTY);
        print(stock.opNQTY);
        _opnQtylist.add(stock);
        print(_opnQtylist);
      }
      return _opnQtylist;
    }
  }

  @override
  void initState() {
    super.initState();
    itemdata = itemchart();
    print(itemdata);

    opnQtydata = opnQtychart();
    print(opnQtydata);

    //recievedata = recievechart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListViews')),
      body:
          //  BodyLayout(),
          Container(
        child: FutureBuilder(
            future: itemdata,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return Text(snapshot.data[index].itemName);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

// class BodyLayout extends StatefulWidget {
//   @override
//   _BodyLayoutState createState() => _BodyLayoutState();
// }
//
// class _BodyLayoutState extends State<BodyLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return _myListView(context);
//   }
// }

// Custom ListView With Multiple Column
Widget _myListView(BuildContext context) {
  // the Expanded widget lets the columns share the space
  Widget column = Expanded(
    child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //   Text(
          //     'Title',
          //     style: TextStyle(fontSize: 16),
          //   ),
          //   Text('subtitle'),
          // ],
        ]),
  );

  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              column,
              //column,
            ],
          ),
        ),
      );
    },
  );
}

//-> Static listview Code Below

// Widget _myListView(BuildContext context) {
//   return ListView(
//     children: <Widget>[
//       ListTile(
//         title: Text('Sun'),
//       ),
//       ListTile(
//         title: Text('Moon'),
//       ),
//       ListTile(
//         title: Text('Star'),
//       ),
//     ],
//   );
// }

// Dynamic listview

// Widget _myListView(BuildContext context) {
//   // backing data
//   final europeanCountries = [
//     'Albania',
//     'Andorra',
//     'Armenia',
//     'Austria',
//     'Azerbaijan',
//     'Belarus',
//     'Belgium',
//     'Bosnia and Herzegovina',
//     'Bulgaria',
//     'Croatia',
//     'Cyprus',
//     'Czech Republic',
//     'Denmark',
//     'Estonia',
//     'Finland',
//     'France',
//     'Georgia',
//     'Germany',
//     'Greece',
//     'Hungary',
//     'Iceland',
//     'Ireland',
//     'Italy',
//     'Kazakhstan',
//     'Kosovo',
//     'Latvia',
//     'Liechtenstein',
//     'Lithuania',
//     'Luxembourg',
//     'Macedonia',
//     'Malta',
//     'Moldova',
//     'Monaco',
//     'Montenegro',
//     'Netherlands',
//     'Norway',
//     'Poland',
//     'Portugal',
//     'Romania',
//     'Russia',
//     'San Marino',
//     'Serbia',
//     'Slovakia',
//     'Slovenia',
//     'Spain',
//     'Sweden',
//     'Switzerland',
//     'Turkey',
//     'Ukraine',
//     'United Kingdom',
//     'Vatican City'
//   ];
//
//   return ListView.builder(
//     itemCount: europeanCountries.length,
//     itemBuilder: (context, index) {
//       return ListTile(
//         title: Text(europeanCountries[index]),
//       );
//     },
//   );
// }
