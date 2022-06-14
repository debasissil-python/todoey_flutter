import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'daily_widget.dart';
import 'package:todoey_flutter/Provider/daily_provider.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DailYProvider>(context);
    final dailyC = provider.dailysCompleted;

    return dailyC.isEmpty
        ? const Center(
            child: Text(
              'No Completed DailYs \n \n Complete Your DailYs now !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 12),
            itemCount: dailyC.length,
            itemBuilder: (context, index) {
              final todoCompleted = dailyC[index];

              return DailYWidget(dailyFrames: todoCompleted);
              //DailYProvider().dailysCompleted.length;
            },
          );
  }
}
