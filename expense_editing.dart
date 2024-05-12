import 'dart:io';

import 'budget_func.dart';

editExpense(List<Map<String, dynamic>> entries) {
  if (entries.isEmpty) {
    print('Please add expense to edit');
  } else {
    for (var i = 0; i < entries.length; i++) {
      print('$i ${entries[i]}');
    }
    //select which expense to edit

    stdout.write('Enter the index of expense to edit');
    int index = int.parse(stdin.readLineSync()!);

    if (index < 0 || index >= entries.length) {
      print('Invalid index.Please enter a valid index');
      return;
    }
    //propmt user for new amount value
    Map<String, dynamic> updatedExpenses = {};
    stdout.write('Enter Amount of product to Update: ');

    String? amountInput = stdin.readLineSync();
    if (amountInput == null) {
      print('Amount cannot be null.Please enter valid number ');
      return;
    }
    double? amount = double.tryParse(amountInput);
    if (amount == null) {
      print('Invalid amount format. Please enter a valid number.');
      return;
    }
    updatedExpenses['Amount'] = amount;

    //prompt user for new category value

    stdout.write('Enter Category of product to Update:');
    String? inputCategory = stdin.readLineSync();
    if (inputCategory == null || inputCategory.isEmpty) {
      print('Category cannot be null.Please enter valid format');
      return;
    }
    updatedExpenses['Category'] = inputCategory;

    //prompt user for new date value

    stdout.write('Enter Date(YYYY-MM-DD):');
    String inputdate = stdin.readLineSync()!;
    if (!isvalidDate(inputdate)) {
      print('Invalid date format.Please use (YYYY-MM-DD ) format');
      return;
    }
    updatedExpenses['Date'] = inputdate;

    entries[index] = updatedExpenses;

    print('List Updated Sucessfully:');
    for (var entry in entries) {
      print(entry);
    }
    print(showBudget(entries));
  }
}

bool isvalidDate(String dateInput) {
  RegExp regExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  return regExp.hasMatch(dateInput);
}
