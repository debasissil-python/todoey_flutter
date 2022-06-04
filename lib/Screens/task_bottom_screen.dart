import 'package:flutter/material.dart';
import '../Form_Widgets/daily_form_individual.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              'Add DailY Tasks',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DailYFormIndividual(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedDailY: () {},
            ),
          ],
        ),
      ),
    );
  }
}
