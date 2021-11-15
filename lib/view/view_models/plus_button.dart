import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:expense_tracker_gsheets/theme/themes.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  final function;
  const PlusButton({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
            color: ThemeService.instance.theme.backgroundColor,
            shape: BoxShape.circle,
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
          child: Text(
            "+",
            style: plusButton,
          ),
        ),
      ),
    );
  }
}
