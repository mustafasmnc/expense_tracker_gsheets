import 'package:flutter/material.dart';

class MyTransaction extends StatelessWidget {
  final String transactionName;
  final String transactionMoney;
  final String expenseOrIncome;
  const MyTransaction(
      {Key? key,
      required this.transactionName,
      required this.transactionMoney,
      required this.expenseOrIncome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          color: Colors.grey[200],
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  arrowIcon(
                      expenseOrIncome == 'expense'
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      expenseOrIncome == 'expense' ? Colors.red : Colors.green),
                  Text(
                    transactionName,
                    style: TextStyle(
                        color: expenseOrIncome == 'expense'
                            ? Colors.red
                            : Colors.green,
                        fontSize: 16),
                  ),
                ],
              ),
              Text(
                (expenseOrIncome == 'expense' ? '-' : '+') +
                    "\$ $transactionMoney",
                style: TextStyle(
                    color: (expenseOrIncome == 'expense'
                        ? Colors.red
                        : Colors.green),
                    fontSize: 18),
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
