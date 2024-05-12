import 'choose_option.dart';

void main() {
  List<Map<String, dynamic>> entries = [];
  while (true) {
    var selectedoption = chooseoption(entries);
    if (selectedoption == null) {
      print('Exiting...');
      break;
    } else {
      selectedoption();
    }
  }
}
