import 'package:flutter/material.dart';
//import 'package:todoey_flutter/Form_Widgets/daily_provider.dart';

class DailYFormBottomScreen extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedDailY;

  const DailYFormBottomScreen({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedDailY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTitle(),
          const SizedBox(
            height: 15,
          ),
          buildDescription(),
          const SizedBox(
            height: 15,
          ),
          buildElevatedButton(),
        ],
      ),
    );
  }

  TextFormField buildTitle() => TextFormField(
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        maxLines: 1,
        textCapitalization: TextCapitalization.sentences,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
      );

  TextFormField buildDescription() => TextFormField(
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: const InputDecoration(
          hintText: 'Description',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 3,
        textCapitalization: TextCapitalization.sentences,
      );

  ElevatedButton buildElevatedButton() => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade900),
        ),
        onPressed: onSavedDailY,
        child: const Text('Click to Add'),
      );
}
