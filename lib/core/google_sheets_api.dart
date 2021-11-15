import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  //create credentials
  static const _credentials = r'''
  //Enter your credentials here
  ''';

  //set up & connect to the spreedsheet
  static final _spreadsheetId = 'Enter your spreadsheet id here';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  //some variables to keep track of
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  //initialise the spreadsheet
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Worksheet1');
    countRows();
  }

  //count the number of notes
  Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    //now we know how many notes to load, let's load them
    loadTransactions();
  }

  //load existing notes from the spreedsheet
  static Future loadTransactions() async {
    if (_worksheet == null) print("worksheet null");

    for (int i = 0; i < numberOfTransactions - 1; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 2);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 2);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 2);
      if (currentTransactions.length < numberOfTransactions - 1) {
        currentTransactions
            .add([transactionName, transactionAmount, transactionType]);
      }
    }
    print(currentTransactions);
    loading = false;
  }

  //insert a new transaction
  static Future insert(String name, String amount, bool isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions
        .add([name, amount, isIncome == true ? 'income' : 'expense']);
    await _worksheet!.values
        .appendRow([name, amount, isIncome == true ? 'income' : 'expense']);
  }

  //calculate the total income
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }
  
  //calculate the total expense
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
