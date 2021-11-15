// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:expense_tracker_gsheets/core/google_sheets_api.dart';
import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:expense_tracker_gsheets/theme/themes.dart';
import 'package:expense_tracker_gsheets/view/view_models/loading_circle.dart';
import 'package:expense_tracker_gsheets/view/view_models/plus_button.dart';
import 'package:expense_tracker_gsheets/view/view_models/top_card.dart';
import 'package:expense_tracker_gsheets/view/view_models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //collect user input
  final _textControllerAmount = TextEditingController();
  final _textControllerItem = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isIncome = false;

  //enter the new transaction into the spreadsheet
  void _enterTransaction() {
    GoogleSheetsApi.insert(
        _textControllerItem.text, _textControllerAmount.text, _isIncome);
    setState(() {});
  }

  //new transacion
  void _newTransaction() {
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('NEW TRANSACTION'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Expense'),
                        Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            }),
                        Text('Income')
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                            child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Amount?',
                                  ),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Enter an amount!';
                                    }
                                    return null;
                                  },
                                  controller: _textControllerAmount,
                                )))
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'For what??',
                          ),
                          controller: _textControllerItem,
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                MaterialButton(
                    color: Colors.grey[600],
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                MaterialButton(
                    color: Colors.grey[600],
                    child: Text(
                      'Enter',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _enterTransaction();
                        Navigator.of(context).pop();
                        _textControllerAmount.clear();
                        _textControllerItem.clear();
                        _isIncome = false;
                      }
                    })
              ],
            );
          });
        });
  }

  //wait for the data to be fetched from google sheets
  bool timerHasStarted = false;
  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    //start loading until the data arrives
    if (GoogleSheetsApi.loading == true) {
      startLoading();
    }
    return Scaffold(
      backgroundColor: ThemeService.instance.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TopNeuCard(
                context: context,
                balance: double.parse((GoogleSheetsApi.calculateIncome() -
                            GoogleSheetsApi.calculateExpense())
                        .toStringAsFixed(2))
                    .toString(),
                income: GoogleSheetsApi.calculateIncome().toString(),
                expense: GoogleSheetsApi.calculateExpense().toString(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Expanded(
                      child: GoogleSheetsApi.loading == true
                          ? LoadingCircle()
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              itemCount:
                                  GoogleSheetsApi.currentTransactions.length,
                              itemBuilder: (context, index) {
                                return MyTransaction(
                                    rowId: index,
                                    transactionId: GoogleSheetsApi
                                        .currentTransactions[index][0],
                                    transactionName: GoogleSheetsApi
                                        .currentTransactions[index][1],
                                    transactionMoney: GoogleSheetsApi
                                        .currentTransactions[index][2],
                                    expenseOrIncome: GoogleSheetsApi
                                        .currentTransactions[index][3]);
                              }))
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: PlusButton(
                function: _newTransaction,
              ),
            )
          ],
        ),
      ),
    );
  }
}
