import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shrikar_fintech_final_assessment/providers/go_router_provider.dart';

void main() {
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
