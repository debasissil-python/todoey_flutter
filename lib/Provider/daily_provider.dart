import 'package:flutter/material.dart';
import 'package:todoey_flutter/Form_Widgets/daily_form_individual.dart';

// class ListTasks extends StatelessWidget {
//   const ListTasks({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: const [
//         TaskIndividual(
//           oldValue: false,
//           text: 'Hallo',
//         ),
//         TaskIndividual(
//           oldValue: false,
//           text: 'Love',
//         ),
//       ],
//     );
//   }
// }

// leading: ListView.builder(
//   itemCount: listItems,
//   itemBuilder: (BuildContext context, int index) {
//     return Text(
//       index.toString(),
//     );
//   },
// ),

class DailYListProvider extends ChangeNotifier {}
