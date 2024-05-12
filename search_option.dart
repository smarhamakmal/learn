import 'dart:io';

import 'search_by_amount.dart';
import 'search_by_category.dart';
import 'search_by_date.dart';

searchoption(List<Map<String, dynamic>> entries) {
  if (entries.isNotEmpty) {
    stdout.write(
        'Do you want to search by category,date or amount(category/date/amount):');
    String searchBy = stdin.readLineSync()!.toLowerCase();
    if (searchBy == 'category') {
      return searchByCategory(entries);
    } else if (searchBy == 'date') {
      return SearchbyDate(entries);
    } else if (searchBy == 'amount') {
      return searchByAmount(entries);
    } else {
      print('Invalid choice please enter category,date or amount to search');
    }
  } else {
    print('There is no expense.Please add expense to search');
  }
}
