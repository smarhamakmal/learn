import 'dart:io';

import 'expense_entry.dart';

SearchbyDate(
  List<Map<String, dynamic>> entries,
) {
  stdout.write('Enter date to search:');
  String? date = stdin.readLineSync()!;
  if (isValidDate(date)) {
    List<Map<String, dynamic>> searchResult = [];

    for (var entry in entries) {
      if (entry['Date'].toLowerCase() == date.toLowerCase()) {
        searchResult.add(entry);
      }
    }
    if (searchResult.isEmpty) {
      print('Not entries found for date');
    } else {
      print('Search for date:$date');
      for (var result in searchResult) {
        print(result);
      }
    }
  } else {
    print('Invalid date format. Please use YYYY-MM-DD format.');
  }
}
