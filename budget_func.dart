String MonthlyBudget = "0";
showBudget(List<Map<String, dynamic>> entries) {
  double remainingBudget = 0;
  double myBudget = double.parse(MonthlyBudget);

  double totalExpense = 0;
  for (var i = 0; i < entries.length; i++) {
    totalExpense += double.parse(entries[i]['Amount'].toString());
    remainingBudget = myBudget - totalExpense;
  }
  print("Monthly budget is: $MonthlyBudget & Remaining is $remainingBudget");
  if (remainingBudget <= 0) {
    return 'You are out of budget';
  }
  return 'You are within your budget';
}
