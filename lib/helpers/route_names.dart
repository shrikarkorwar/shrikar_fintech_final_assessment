class RouteNames {
  static const loginPage ='login';
  static const dashboard ='dashboard';
}

extension GoRouterPath on String {
  String path()=>'/$this';
}