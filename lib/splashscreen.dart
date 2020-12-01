import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hos_app/login.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _versionName = 'House Of Solution';
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      child: Stack(fit: StackFit.expand, children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'House Of Solution',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                  CircularProgressIndicator(),
                  Container(
                    height: 50,
                  ),
                  //       Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: <Widget>[
                  //             Spacer(),
                  //             Text(_versionName),
                  //             Spacer(
                  //               flex: 4,
                  //             ),
                  //             Text('A Digital House'),
                  //             Spacer(),
                ]))
          ],
        ),
      ]),
    ));
  }
}
