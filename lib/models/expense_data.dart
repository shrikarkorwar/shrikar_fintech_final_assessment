class ExpenseData {
  String? date;
  String? expenseTitle;
  String? expenseAmount;
  String? category;
  List<ExpenseData>? expenseData;

  ExpenseData({this.date,this.expenseTitle,this.expenseAmount,this.category,this.expenseData});

  ExpenseData copyWith({String? date,String? expenseTitle,String? expenseAmount, String? category,List<ExpenseData>? expenseData}){
    return ExpenseData(
      date: date?? this.date,
      expenseTitle: expenseTitle??this.expenseTitle,
      expenseAmount: expenseAmount??this.expenseAmount,
      category: category??this.category,
      expenseData: expenseData??this.expenseData
    );
  }
}