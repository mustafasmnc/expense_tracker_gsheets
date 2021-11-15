import 'package:expense_tracker_gsheets/core/google_sheets_api.dart';
import 'package:expense_tracker_gsheets/theme/theme_data.dart';
import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:expense_tracker_gsheets/view/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  await ThemeService.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CustomThemeDataModal(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<CustomThemeDataModal>(context).getThemeData,
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      home: HomePage(),
    );
  }
}
