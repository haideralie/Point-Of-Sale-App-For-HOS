import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hos_app/Expense.dart';
import 'package:hos_app/login.dart';
import 'package:hos_app/model/outstandingchart.dart';
import 'package:hos_app/purchase.dart';
import 'package:hos_app/sales.dart';
import 'package:hos_app/stock.dart';

import 'outstanding.dart';

class HomeScreen extends StatelessWidget {
  Widget tile(
      {String text, String imagepath, Function ontap, Size size, Color clr}) {
    return InkWell(
      splashColor: clr,
      onTap: ontap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset('images/sales'),
            // Icon(Icons.assessment),
            Container(
              height: size.height * 0.11,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                image: new DecorationImage(
                  image: new AssetImage(imagepath),
                  fit: BoxFit.contain,
                ),
                // boxShadow: [
                //   BoxShadow(
                //       offset: Offset(2, 2), color: Colors.black54)
                // ],
              ),
            ),

            // height: size.height * 0.1,
            // width: 100,
            // padding: EdgeInsets.fromLTRB(30, 70, 0, 0),
            // child:
            Text(
              text,
              //  textAlign: TextAlign.,

              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),

            // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0))
          ],
        ),
      ),

      //child: Center(child: Text('Sales')),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Container(
        width: 160,
        child: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: DrawerHeader(
                    // child: Container(
                    //     padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                    //     child: Text(
                    //       'Menu',
                    //       textDirection: TextDirection.rtl,
                    //       style: TextStyle(fontSize: 20, color: Colors.white),
                    //     )),
                    // decoration: DecorationImage(),

                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),

                    // image: DecorationImage(
                    //     image: AssetImage('images/logo.png'),
                    //     alignment: AlignmentDirectional(-1, 2)),
                  ),
                ),
                Container(
                  height: 140,
                  width: 150,
                  padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage('images/logo.png'),
                    //alignment: AlignmentDirectional(-1, 2)
                  ),
                )
              ],
            ),
            InkWell(
              child: ListTile(
                  title: Text('Sales'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sales()));
                  }),
            ),
            ListTile(
                title: Text('Purchase'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer

                  //  Icon(Icons.assessment, color: Colors.redAccent);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Purchase()));
                }),
            ListTile(
              title: Text('Stock'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Stock()));
              },
            ),
            ListTile(
              title: Text('Expense'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Sales()));
              },
            ),
            ListTile(
              title: Text('Outstandings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Sales()));
              },
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Sales()));
              },
            ),
            ListTile(
              title: Text('General Ledger'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Sales()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        )),
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
          child: Column(children: [
        Container(
          height: size.height * 0.3,
          child: Carousel(
            boxFit: BoxFit.cover,
            images: [
              Image(
                image: CachedNetworkImageProvider(
                  'https://hos.com.pk/MobileApp/1.png',
                ),
                fit: BoxFit.fill,
              ),

              Image(
                image: CachedNetworkImageProvider(
                  'https://hos.com.pk/MobileApp/2.png',
                ),
                fit: BoxFit.fill,
              ),
              Image(
                image: CachedNetworkImageProvider(
                  'https://hos.com.pk/MobileApp/3.png',
                ),
                fit: BoxFit.fill,
              ),
              Image(
                image: CachedNetworkImageProvider(
                  'https://hos.com.pk/MobileApp/4.png',
                ),
                fit: BoxFit.fill,
              ),

              // NetworkImage('https://hos.com.pk/MobileApp/1.png'),
              // NetworkImage('https://hos.com.pk/MobileApp/2.png'),
              // NetworkImage('https://hos.com.pk/MobileApp/3.png'),
              // NetworkImage('https://hos.com.pk/MobileApp/4.png'),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: 100,
        ),
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            childAspectRatio: 1.4,
            crossAxisSpacing: 25,
            mainAxisSpacing: 35,
            crossAxisCount: 2,
            children: [
              tile(
                  text: 'Sales',
                  imagepath: 'images/sales2.png',
                  size: size,
                  clr: Colors.deepPurple,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sales()));
                  }),
              tile(
                  text: 'Purchase',
                  imagepath: 'images/purchases.png',
                  size: size,
                  clr: Colors.yellow,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Purchase()));
                  }),
              tile(
                  text: 'Stocks',
                  imagepath: 'images/stock.png',
                  size: size,
                  clr: Colors.green,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Stock()));
                  }),
              tile(
                  text: 'Expense',
                  imagepath: 'images/expenses.png',
                  size: size,
                  clr: Colors.blue,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Expense()));
                  }),
              tile(
                  text: 'Outstandings',
                  imagepath: 'images/outstanding.png',
                  size: size,
                  clr: Colors.blue,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Outstanding()));
                  }),
              tile(
                  text: 'Dashboard',
                  imagepath: 'images/dashboard1.png',
                  size: size,
                  clr: Colors.redAccent,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sales()));
                  }),
            ],
          ),
        )
      ])

          // Stack(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => Sales()));
          //       },
          //       child: Container(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             //Image.asset('images/sales'),
          //             // Icon(Icons.assessment),
          //             Container(
          //               height: size.height * 0.1,
          //               width: 100,
          //               padding: EdgeInsets.fromLTRB(30, 55, 0, 0),
          //               child: Text(
          //                 'Sales',
          //                 //  textAlign: TextAlign.,
          //
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 16,
          //                     color: Colors.green),
          //               ),
          //             ),
          //             // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0))
          //           ],
          //         ),
          //
          //         height: size.height * 0.11,
          //         width: 150,
          //         decoration: BoxDecoration(
          //           color: Colors.transparent,
          //           borderRadius: BorderRadius.circular(20),
          //           image: new DecorationImage(
          //             image: new AssetImage("images/sales2.png"),
          //             fit: BoxFit.contain,
          //           ),
          //           // boxShadow: [
          //           //   BoxShadow(
          //           //       offset: Offset(2, 2), color: Colors.black54)
          //           // ],
          //         ),
          //         //child: Center(child: Text('Sales')),
          //       ),
          //     ),
          //   ],
          // ),

          //     Stack(
          //       children: [
          //         Container(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               // Icon(Icons.local_grocery_store),
          //               Container(
          //                 height: size.height * 0.1,
          //                 width: 100,
          //                 padding: EdgeInsets.fromLTRB(25, 61, 0, 0),
          //                 child: Text(
          //                   'Stocks',
          //                   //  textAlign: TextAlign.,
          //
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //
          //           height: size.height * 0.11,
          //           width: 150,
          //           decoration: BoxDecoration(
          //             color: Colors.transparent,
          //             borderRadius: BorderRadius.circular(20),
          //             image: new DecorationImage(
          //               image: new AssetImage("images/stock.png"),
          //               fit: BoxFit.contain,
          //             ),
          //             // boxShadow: [
          //             //   BoxShadow(offset: Offset(2, 2), color: Colors.black54)
          //             //  ],
          //           ),
          //           // child: Center(child: Text('Stock')),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 50),
          //     Container(child: Text('aho')),
          //     Stack(
          //       children: [
          //         Container(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               //  Icon(Icons.account_balance_wallet),
          //               Container(
          //                 height: size.height * 0.11,
          //                 width: 150,
          //                 padding: EdgeInsets.fromLTRB(25, 65, 0, 0),
          //                 child: Text(
          //                   'Outstandings',
          //                   //  textAlign: TextAlign.,
          //
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 15.5,
          //                     color: Colors.blue,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //
          //           height: size.height * 0.11,
          //           width: 150,
          //           decoration: BoxDecoration(
          //             color: Colors.transparent,
          //             borderRadius: BorderRadius.circular(20),
          //             image: new DecorationImage(
          //               image: new AssetImage("images/outstanding.png"),
          //               fit: BoxFit.contain,
          //             ),
          //             // boxShadow: [
          //             //   BoxShadow(offset: Offset(2, 2), color: Colors.black54)
          //             // ],
          //           ),
          //           // child: Center(child: Text('Outstanding')),
          //         )
          //       ],
          //     ),
          //   ],
          // ),

          // Stack(
          //   children: [
          //     Container(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           //  Icon(Icons.credit_card),
          //           Container(
          //             height: size.height * 0.11,
          //             width: 150,
          //             padding: EdgeInsets.fromLTRB(35, 61, 0, 0),
          //             child: Text(
          //               'Purchases',
          //               //  textAlign: TextAlign.,
          //
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //
          //       height: size.height * 0.11,
          //       width: 150,
          //       decoration: BoxDecoration(
          //         color: Colors.transparent,
          //         borderRadius: BorderRadius.circular(20),
          //         image: new DecorationImage(
          //           image: new AssetImage("images/purchases.png"),
          //           fit: BoxFit.contain,
          //         ),
          //         // boxShadow: [
          //         //   BoxShadow(offset: Offset(2, 2), color: Colors.black54)
          //         // ],
          //       ),
          //       // child: Center(child: Text('Purchase')),
          //     ),
          //   ],
          // ),

          // Stack(
          //   children: [
          //     Container(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           //  Icon(Icons.book),
          //           Container(
          //             height: size.height * 0.1,
          //             width: 100,
          //             padding: EdgeInsets.fromLTRB(18, 61, 0, 0),
          //             child: Text(
          //               'Expense',
          //               //  textAlign: TextAlign.,
          //
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //
          //       height: size.height * 0.11,
          //       width: 150,
          //       decoration: BoxDecoration(
          //         color: Colors.transparent,
          //         borderRadius: BorderRadius.circular(20),
          //         image: new DecorationImage(
          //           image: new AssetImage("images/expenses.png"),
          //           fit: BoxFit.contain,
          //         ),
          //         // boxShadow: [
          //         //   BoxShadow(offset: Offset(2, 2), color: Colors.black54)
          //         // ],
          //       ),
          //       // child: Center(child: Text('Expense')),
          //     ),
          //   ],
          // ),

          // Stack(
          //   children: [
          //     Container(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           //  Icon(Icons.dashboard),
          //           Container(
          //             height: size.height * 0.11,
          //             width: 150,
          //             padding: EdgeInsets.fromLTRB(36, 61, 0, 0),
          //             child: Text(
          //               'Dashboard',
          //               //  textAlign: TextAlign.,
          //
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //
          //       height: size.height * 0.11,
          //       width: 150,
          //       decoration: BoxDecoration(
          //         color: Colors.transparent,
          //         borderRadius: BorderRadius.circular(20),
          //         image: new DecorationImage(
          //           image: new AssetImage("images/dashboard1.png"),
          //           fit: BoxFit.contain,
          //         ),
          //         // boxShadow: [
          //         //   BoxShadow(offset: Offset(2, 2), color: Colors.black54)
          //         // ],
          //       ),
          //       //  child: Center(child: Text('Dashboard'),
          //     ),
          //   ],
          // ),

          ),
    );
  }
}
