import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'daily_widget.dart';
import 'package:todoey_flutter/Provider/daily_provider.dart';

class DailYListWidget extends StatelessWidget {
  const DailYListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DailYProvider>(context);
    final dailyL = provider.dailys;

    return dailyL.isEmpty
        ? const Center(
            child: Text(
              'No DailYs \n \n Add Your DailYs now !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 12),
            itemCount: dailyL.length,
            itemBuilder: (context, index) {
              final todo = dailyL[index];

              return DailYWidget(dailyFrames: todo);
            },
          );
  }
}
