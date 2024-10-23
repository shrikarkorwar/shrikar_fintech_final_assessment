import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shrikar_fintech_final_assessment/helpers/route_names.dart';
import 'package:shrikar_fintech_final_assessment/models/expense_data.dart';
import 'package:shrikar_fintech_final_assessment/providers/expense_data_provider.dart';
import 'package:shrikar_fintech_final_assessment/ui/screens/login_screen.dart';


class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notfier = ref.watch(expenseDataProvider).expenseData;
    return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(pinned: true,expandedHeight: 200,actions: [Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(icon: Icon(Icons.add_to_photos),onPressed: () {
            context.go(RouteNames.addExpense.path());
          },),
        )],flexibleSpace: FlexibleSpaceBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            Text('User Account:Shrikar',style: TextStyle(color: Colors.black,fontSize: 8)),
            Text('Total Expenses:400',style: TextStyle(color: Colors.black,fontSize: 8)),
            Text('Monthly Balance:15000',style: TextStyle(color: Colors.black,fontSize: 8)),
          ],),
        background:Image.network(
                fit: BoxFit.cover,
                'https://play-lh.googleusercontent.com/27oDxUYHG9xiHxgktqespIj16pilDpimWsuJY0UDMl3mpAn9P2kGodn8Rr1ejNvULw',
                width: double.infinity,
              ),),
        ),
        SliverList.builder(itemCount: notfier?.length,itemBuilder: (context, index) {
          return TransactionDetails(expenseData: notfier![index]);
        },)
      ],
    ),);
  }
}


class TransactionDetails extends StatelessWidget {

   ExpenseData expenseData;
   TransactionDetails({
    required this.expenseData
  });


  @override
  Widget build(BuildContext context) {
    return Container(height: 100,width: double.infinity,
    child: Column(children: [
      Text(expenseData.expenseTitle.toString()),
      Text(expenseData.expenseAmount.toString()),
      Text(expenseData.date.toString()),
      Text(expenseData.category.toString()),
    ],),decoration: BoxDecoration(color: Colors.amber,border: Border.all(width:  8)),);
  }
}