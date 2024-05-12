import 'dart:io';

import 'budget_func.dart';

expenseEntry(List<Map<String, dynamic>> entries) {
  while (true) {
    // Prompt the user to choose an action
    if (entries.isEmpty) {
      MonthlyBudget = "0";
      stdout.write('Enter Monthly Budget: ');
      String? amountInput = stdin.readLineSync();
      if (amountInput != null && amountInput.isNotEmpty) {
        MonthlyBudget = amountInput;
      }
    }
    Map<String, dynamic> userinput = {};

    // amount input from userSS
    stdout.write('Enter amount of product: ');
    String? amountInput = stdin.readLineSync();
    if (amountInput == null) {
      print('Amount cannot be null. Please enter a valid number.');
      continue;
    }
    double? amount = double.tryParse(amountInput);
    if (amount == null) {
      print('Invalid amount format. Please enter a valid number.');
      continue;
    }
    userinput['Amount'] = amount;

    //input category from user
    stdout.write('Enter Category of product: ');
    String? inputcategory = stdin.readLineSync();
    if (inputcategory == null || inputcategory.isEmpty) {
      print('Invalid category format. category cannot be null or empty ');
      continue;
    }

    userinput['Category'] = inputcategory;

    //input date from user
    stdout.write('Enter date(YYYY-MM-DD): ');
    String inputdate = stdin.readLineSync()!;
    if (!isValidDate(inputdate)) {
      print('Invalid date format. Please use YYYY-MM-DD format.');
      continue;
    }
    userinput['Date'] = inputdate;

    entries.add(userinput);

    //Ask user if they want to add more  entry

    stdout.write('Do you want to add more entry? (yes/no):');
    String countinueInput = stdin.readLineSync()!.toLowerCase();
    if (countinueInput != 'yes') {
      break;
    }
  }
  print('Expense List:');
  for (var entry in entries) {
    print(entry);
  }
  print(showBudget(entries));
}

bool isValidDate(String dateInput) {
  RegExp regExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  return regExp.hasMatch(dateInput);
}
