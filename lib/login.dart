import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hos_app/home.dart';

// void getHttp() async {
//   try {
//     Response response = await Dio().get("http://www.google.com");
//     print(response);
//   } catch (e) {
//     print(e);
//   }
// }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<bool> loginWithCredentials(email, password) async {
    try {
      Dio _dio = new Dio();
      print(email);
      print(password);
      Response response = await _dio.post(
          'http://192.168.10.50:8081/api/account/login?email=$email&password=$password');
      print(response.data);
      if (response.data == 'success') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
        return true;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
  // Future<void> getdata() async {
  //   var res = http.get(
  //       "http://192.168.10.50:8081/api/account/login?email=admin&password=a");
  //   print(res);
  // }

  //final formkey =GlobalKey<FormState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Login'),
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 100, 10, 500),
                // height: 100,
                //width: 50,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/logo.png'))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: emailTextController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordTextController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (formkey.currentState.validate()) {
                            bool result = await loginWithCredentials(
                                emailTextController.text,
                                passwordTextController.text);
                            if (result == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            } else {
                              print('Try Again');
                            }
                          }
                        },
                        child: Text('Login'),
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )

        //   decoration: BoxDecoration(
        //       image: DecorationImage(image: AssetImage('images/logo.png'))),
        //   child: Container(
        //     padding: EdgeInsets.all(20.0),
        //     child: Form(
        //       //key:formkey,
        //
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           TextFormField(
        //             onChanged: (value) {
        //               setState(() {
        //                 username = value;
        //               });
        //             },
        //             decoration: InputDecoration(
        //               labelText: 'Enter your username',
        //               labelStyle: TextStyle(fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //           TextFormField(
        //             onChanged: (value) {
        //               setState(() {
        //                 password = value;
        //               });
        //             },
        //             decoration: InputDecoration(
        //                 labelText: 'Enter your Password',
        //                 labelStyle: TextStyle(fontWeight: FontWeight.bold)),
        //           ),
        //           RaisedButton(
        //             onPressed: getdata,
        //             child: Text('Login'),
        //             color: Colors.blue,
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
