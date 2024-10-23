import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shrikar_fintech_final_assessment/models/expense_data.dart';

class ExpenseDataProvider extends StateNotifier<ExpenseData>{
  ExpenseDataProvider():super(ExpenseData(date: DateTime.now().day.toString(),expenseTitle: "Loan",expenseAmount: "3000",category: "misc"));

  void addExpense(ExpenseData data){
    List<ExpenseData> newlist = [ExpenseData()];
    if(state.expenseData!=null){
    newlist = state.expenseData!;
    newlist.add(data);
    }else{
       newlist = [];
    }
   
    state = state.copyWith(expenseData: newlist);
  }
}

final expenseDataProvider = StateNotifierProvider<ExpenseDataProvider,ExpenseData>((ref) => ExpenseDataProvider());