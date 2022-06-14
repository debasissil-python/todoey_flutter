import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Form_Widgets/daily_form_bottom_screen.dart';
import '../Provider/daily_provider.dart';
import '../daily_framework.dart';

class EditDailyScreen extends StatefulWidget {
  final DailYFrames dailyFrames;

  const EditDailyScreen({
    Key? key,
    required this.dailyFrames,
  }) : super(key: key);

  @override
  State<EditDailyScreen> createState() => _EditDailyScreenState();
}

class _EditDailyScreenState extends State<EditDailyScreen> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.dailyFrames.title;
    description = widget.dailyFrames.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit DailY',
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<DailYProvider>(context, listen: false);
                provider.removeDaily(widget.dailyFrames);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: DailYFormBottomScreen(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedDailY: saveDaily,
            ),
          ),
        ),
      );

  void saveDaily() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<DailYProvider>(context, listen: false);

      provider.updateDaily(widget.dailyFrames, title, description);

      Navigator.of(context).pop();
    }
  }
}
