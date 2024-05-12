import 'dart:io';

searchByCategory(
  List<Map<String, dynamic>> entries,
) {
  stdout.write('Enter category to search:');
  String category = stdin.readLineSync()!;
  List<Map<String, dynamic>> searchResult = [];
  for (var entry in entries) {
    if (entry['Category'].toLowerCase() == category.toLowerCase()) {
      searchResult.add(entry);
    }
  }
  if (searchResult.isEmpty) {
    print('Not entries found for category');
  } else {
    print('Search  found for category:$category');
    for (var result in searchResult) {
      print(result);
    }
  }
}
