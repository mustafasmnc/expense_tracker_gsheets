import 'package:expense_tracker_gsheets/core/google_sheets_api.dart';
import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:expense_tracker_gsheets/theme/themes.dart';
import 'package:expense_tracker_gsheets/view/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTransaction extends StatefulWidget {
  final int rowId;
  final String transactionId;
  final String transactionName;
  final String transactionMoney;
  final String expenseOrIncome;
  const MyTransaction({
    Key? key,
    required this.transactionId,
    required this.transactionName,
    required this.transactionMoney,
    required this.expenseOrIncome,
    required this.rowId,
  }) : super(key: key);

  @override
  State<MyTransaction> createState() => _MyTransactionState();
}

class _MyTransactionState extends State<MyTransaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:
                  ThemeService.instance.theme.backgroundColor.withOpacity(.1),
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
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  arrowIcon(
                      widget.expenseOrIncome == 'expense'
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      widget.expenseOrIncome == 'expense'
                          ? Colors.red
                          : Colors.green),
                  Text(widget.transactionName,
                      style: titleStyle.copyWith(
                        color: widget.expenseOrIncome == 'expense'
                            ? Colors.red
                            : Colors.green,
                      )),
                ],
              ),
              Text(
                (widget.expenseOrIncome == 'expense' ? '-' : '+') +
                    "\$ ${widget.transactionMoney}",
                style: titleStyle.copyWith(
                    color: (widget.expenseOrIncome == 'expense'
                        ? Colors.red
                        : Colors.green),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget arrowIcon(IconData icon, Color color) {
    return Icon(
      icon,
      color: color,
    );
  }
}
