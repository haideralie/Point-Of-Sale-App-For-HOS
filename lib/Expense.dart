//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';
import 'dart:async';

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  String datetotext(DateTime dateTime) {
    if (dateTime == null) {
      return 'Start Date';
    } else {
      print(dateTime);
      return "${dateTime}".split(' ')[0];
    }
  }

  String datetotext1(DateTime dateTime) {
    if (dateTime == null) {
      return 'End Date';
    } else {
      print(dateTime);

      return "${dateTime}".split(' ')[0];
    }
  }

  DateTime selectstartDate = null;

  Future<Null> _selectstartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        // initialDate: selectedDate,

        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectstartDate)
      setState(() {
        selectstartDate = picked;
      });
  }

  DateTime selectendDate = null;

  Future<Null> _selectendDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        // initialDate: selectedDate,

        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectendDate)
      setState(() {
        selectendDate = picked;
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

  DateTime endDate = DateTime.now();

  Future<Null> _endDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.blue, child: Text('Expense Report')),
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
                      onTap: () {
                        setState(() {
                          _selectstartDate(context);
                        });
                      },
                      //_startDate(context),

                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        height: 30,
                        width: 100,
                        child: Text(
                          datetotext(selectstartDate),
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
                      //  onTap: () => _selectDate(context),
                      // onTap: () => _endDate(context),
                      onTap: () {
                        setState(() {
                          _selectendDate(context);
                        });
                      },

                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          height: 30,
                          width: 100,
                          child: Text(
                            datetotext1(selectendDate),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
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
