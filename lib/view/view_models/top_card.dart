// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TopNeuCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expense;

  const TopNeuCard(
      {Key? key,
      required this.balance,
      required this.income,
      required this.expense})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "B A L A N C E",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 22,
                ),
              ),
              Text(
                '\$'+balance,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        circleIcon(Icons.arrow_upward, Colors.green),
                        Column(
                          children: [
                            Text(
                              "income",
                              style: TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            Text("\$ $income",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        circleIcon(Icons.arrow_downward, Colors.red),
                        Column(
                          children: [
                            Text("expense",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20)),
                            Text("\$ $expense",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget circleIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        width: 35,
        child: Icon(
          icon,
          color: color,
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
