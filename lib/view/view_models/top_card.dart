// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expense_tracker_gsheets/theme/theme_data.dart';
import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:expense_tracker_gsheets/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopNeuCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expense;
  final BuildContext context;

  const TopNeuCard(
      {Key? key,
      required this.balance,
      required this.income,
      required this.expense,
      required this.context})
      : super(key: key);

  void changeTheme() {
    Provider.of<CustomThemeDataModal>(context, listen: false).setThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ThemeService.instance.theme.backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: ThemeService.instance.theme.primaryColorLight,
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: ThemeService.instance.theme.primaryColorDark,
                  offset: Offset(6.0, 6.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  changeTheme();
                },
                child: Icon(
                  ThemeService.instance.isDarkMode()
                      ? Icons.wb_sunny
                      : Icons.nightlight_rounded,
                  size: 24,
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("B A L A N C E", style: headingStyle),
                  SizedBox(height: 10),
                  Text('\$' + balance, style: headingMoneyStyle),
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
                                Text("income", style: subheadingStyle),
                                Text("\$ $income",
                                    style:
                                        subheadingStyle.copyWith(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            circleIcon(Icons.arrow_downward, Colors.red),
                            Column(
                              children: [
                                Text("expense", style: subheadingStyle),
                                Text("\$ $expense",
                                    style:
                                        subheadingStyle.copyWith(fontSize: 16)),
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
          ],
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
          color: ThemeService.instance.isDarkMode()
              ? darkHeaderClr
              : Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
