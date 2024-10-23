class RouteNames {
  static const loginPage ='login';
  static const dashboard ='dashboard';
  static const addExpense ='addexpense';
}

extension GoRouterPath on String {
  String path()=>'/$this';
}