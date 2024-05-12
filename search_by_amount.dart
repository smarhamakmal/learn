import 'dart:io';

searchByAmount(
  List<Map<String, dynamic>> entries,
) {
  List<Map<String, dynamic>> searchResult = [];
  stdout.write('Enter amount to search:');
  String? input = stdin.readLineSync();
  if (input == null) {
    print('no value entered');
    return;
  }
  if (RegExp(r'^-?\d+(\.\d+)?$').hasMatch(input)) {
    double amount = double.parse(input);
    for (var entry in entries) {
      if (entry['Amount'] == amount) {
        searchResult.add(entry);
      }
    }

    if (searchResult.isEmpty) {
      print('No entries found for amount');
    } else {
      print('Search for amount:$amount');
      for (var result in searchResult) {
        print(result);
      }
    }
  } else {
    print('Invalid Input :$input is not valid amount');
  }
}
