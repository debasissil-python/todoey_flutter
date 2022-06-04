import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/daily_provider.dart';
import 'Screens/task_screen.dart';

void main() {
  runApp(const Daily());
}

class Daily extends StatelessWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        DailYListProvider;
      },
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
