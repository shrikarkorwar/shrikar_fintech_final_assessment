import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shrikar_fintech_final_assessment/helpers/route_names.dart';
import 'package:shrikar_fintech_final_assessment/models/expense_data.dart';
import 'package:shrikar_fintech_final_assessment/providers/expense_data_provider.dart';
import 'package:shrikar_fintech_final_assessment/providers/go_router_provider.dart';



class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
final globalKey = GlobalKey<FormState>();
final expenseTitleEditingController = TextEditingController();
final amountEditingController = TextEditingController();
List categoryItems = ['bills','shopping','groceries','utilities','misc'];
int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expenses')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(key: globalKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Date: ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'),
          SizedBox(height: 10),
          TextFormField(controller: expenseTitleEditingController,
          decoration: InputDecorationMethod('Enter Expense details'),
          ),
          SizedBox(height: 10),
          TextFormField(controller: amountEditingController,
          decoration: InputDecorationMethod('Enter Amount'),
          ),
          SizedBox(height: 10),
          Text('Select Category'),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(itemCount: categoryItems.length,gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 100,
            childAspectRatio: 1), itemBuilder: (context, index) {
             return GestureDetector(
              onTap: () {
                SelectedIndex = index;
                setState(() {
                });
              },child: Container(decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8),color: SelectedIndex==index?Colors.blue:Colors.red),child: Center(child: Text(categoryItems[index],style: TextStyle(color: Colors.white),)),));
              
            },),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
            child: FloatingActionButton.extended(onPressed: (){
            ref.read(expenseDataProvider.notifier).addExpense(
              ExpenseData(
                date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                expenseTitle: expenseTitleEditingController.text,
                expenseAmount: amountEditingController.text,
                category: categoryItems[SelectedIndex]
              ));
              context.go(RouteNames.dashboard.path());
            },label: Text('Add Expense'),),
          )
        
        ],)),
      ),
    );
  }

  InputDecoration InputDecorationMethod(String hintText) {
    return InputDecoration(
                      hintText: hintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      filled: true,
                      fillColor: Colors.white);
  }
}