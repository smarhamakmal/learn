import 'dart:io';

import 'budget_func.dart';
import 'expense_editing.dart';
import 'expense_entry.dart';
import 'search_option.dart';

chooseoption(List<Map<String, dynamic>> entries) {
// Prompt the user to choose an action
  print('Choose an action:');
  print('1. Add new expense');
  print('2. Edit existing expense');
  print('3. Monthly Budget');
  print('4. Search expense');
  print('5. Done');
  stdout.write('Enter your choice: ');
  int select = int.parse(stdin.readLineSync()!);

  if (select == 1) {
    return () => expenseEntry(entries);
  } else if (select == 2) {
    return () => editExpense(entries);
  } else if (select == 3) {
    return () => showBudget(entries);
  } else if (select == 4) {
    return () => searchoption(entries); // search
  } else if (select == 5) {
    return null; //exit
  } else {
    print('Invalid option.Please select again');
  }
  return () => chooseoption(entries);
}
