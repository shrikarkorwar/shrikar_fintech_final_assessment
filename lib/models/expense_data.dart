import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'expense_data.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class ExpenseData {
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? expenseTitle;
  @HiveField(2)
  String? expenseAmount;
  @HiveField(3)
  String? category;
  @HiveField(4)
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