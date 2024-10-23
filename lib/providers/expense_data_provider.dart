import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shrikar_fintech_final_assessment/models/expense_data.dart';

class ExpenseDataProvider extends StateNotifier<ExpenseData>{
  ExpenseDataProvider():super(ExpenseData(date: DateTime.now().day.toString(),expenseTitle: "Loan",expenseAmount: "3000",category: "misc"));

  void addExpense(ExpenseData data) async {
    final expenseBox = await Hive.openBox<List<ExpenseData>>('expenseBoxName');
    List<ExpenseData> newlist = [ExpenseData()];
    if(state.expenseData!=null){
    newlist = state.expenseData!;
    newlist.add(data);
    }else{
       newlist = [ExpenseData(date: data.date,expenseTitle: data.expenseTitle,expenseAmount: data.expenseAmount,category: data.category)];
    }

    if(expenseBox.isOpen){
      expenseBox.put(newlist.length, newlist);
    }
    
   
    state = state.copyWith(expenseData: newlist);
    
  }

   Future<List<ExpenseData>> getAllExpenseFromHive() async{
     final expenseBox = await Hive.openBox<List<ExpenseData>>('expenseBoxName');
    if(expenseBox.isOpen){
      if(expenseBox.values.isNotEmpty){
        try{
          return expenseBox.values.first;
        }catch(Exception){
        return [ExpenseData(date: DateTime.now().toString(),expenseTitle: 'Test expense title',expenseAmount: '200',category: 'Misc')];
        }
       }
       else{
        return [ExpenseData(date: DateTime.now().toString(),expenseTitle: 'Test expense title',expenseAmount: '200',category: 'Misc')];
       }
    }else{
      throw Exception('Box is not open');
    }
  }
}

final expenseDataProvider = StateNotifierProvider<ExpenseDataProvider,ExpenseData>((ref) => ExpenseDataProvider());