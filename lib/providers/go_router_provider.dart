import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shrikar_fintech_final_assessment/helpers/route_names.dart';
import 'package:shrikar_fintech_final_assessment/ui/screens/add_transaction_screen.dart';
import 'package:shrikar_fintech_final_assessment/ui/screens/dashboard_screen.dart';
import 'package:shrikar_fintech_final_assessment/ui/screens/login_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(initialLocation: RouteNames.loginPage.path(),routes: [
    GoRoute(path: RouteNames.loginPage.path(),name: RouteNames.loginPage,builder: (context, state) {return LoginScreen();},),
    GoRoute(path: RouteNames.dashboard.path(),name: RouteNames.dashboard,builder: (context, state) {return DashboardScreen();}),
    GoRoute(path: RouteNames.addExpense.path(),name: RouteNames.addExpense,builder: (context, state) {return AddTransactionScreen();},)
  ]);
},);