import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(pinned: true,expandedHeight: 200,actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.wallet_giftcard),
        )],flexibleSpace: FlexibleSpaceBar(
          title: Text('Money Manager'),
        background:Image.network(
                fit: BoxFit.cover,
                'https://play-lh.googleusercontent.com/27oDxUYHG9xiHxgktqespIj16pilDpimWsuJY0UDMl3mpAn9P2kGodn8Rr1ejNvULw',
                width: double.infinity,
              ),),
        ),
        SliverList.builder(itemCount: 80,itemBuilder: (context, index) {
          return Text('Items $index',style: TextStyle(color: Colors.black),);
        },)
      ],
    ),);
  }
}