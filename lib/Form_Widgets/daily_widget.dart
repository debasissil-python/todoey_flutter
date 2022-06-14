import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Provider/daily_provider.dart';
import 'package:todoey_flutter/snack_bar.dart';
import '../Screens/edit_daily_screen.dart';
import '../daily_framework.dart';

class DailYWidget extends StatelessWidget {
  final DailYFrames dailyFrames;

  const DailYWidget({
    Key? key,
    required this.dailyFrames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          key: Key(dailyFrames.id),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                flex: 1,
                onPressed: (context) => editDaily(context, dailyFrames),
                backgroundColor: Colors.green.shade400,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
            extentRatio: 1.5 / 5,
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                flex: 1,
                onPressed: (_) => deleteDaily(context, dailyFrames),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete_forever,
                label: 'Delete',
              ),
            ],
            extentRatio: 1.5 / 5,
          ),
          child: buildDailY(context),
        ),
      );

  Widget buildDailY(BuildContext context) => Container(
        padding: const EdgeInsets.all(15),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.black12,
          //borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              value: dailyFrames.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<DailYProvider>(context, listen: false);
                final isDone = provider.toggleDailyStatus(dailyFrames);

                showSnackBar(
                  context,
                  isDone ? 'Completed the task' : 'Task Incomplete',
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dailyFrames.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  if (dailyFrames.description.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        dailyFrames.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      );

  void editDaily(BuildContext context, DailYFrames dailyFrames) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditDailyScreen(dailyFrames: dailyFrames),
        ),
      );

  void deleteDaily(BuildContext context, DailYFrames dailyFrames) {
    final provider = Provider.of<DailYProvider>(context, listen: false);
    provider.removeDaily(dailyFrames);

    showSnackBar(context, 'Deleted the task');
  }
}
