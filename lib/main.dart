import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shrikar_fintech_final_assessment/models/expense_data.dart';
import 'package:shrikar_fintech_final_assessment/providers/go_router_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   Hive.registerAdapter(ExpenseDataAdapter());
  runApp(const ProviderScope(child: FintechApp()));
 
}


class FintechApp extends ConsumerStatefulWidget {
  const FintechApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FintechAppState();
}

class _FintechAppState extends ConsumerState<FintechApp> {

  @override
  Widget build(BuildContext context) {
    final goRouter =ref.watch(goRouterProvider);
    return MaterialApp.router(routerConfig: goRouter);
  }
}
