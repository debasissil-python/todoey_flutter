import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Screens/bottom_screen.dart';
import '../Form_Widgets/completed_list_widget.dart';
import '../Form_Widgets/daily_list_widget.dart';
import '../Provider/daily_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  late Widget buildBottomSheet;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const AllList(),
      const CompletedList(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade400,
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey.shade900,
          child: const Icon(
            Icons.add_circle_outline_outlined,
            size: 30,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const TaskBottomSheet(),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 15,
          backgroundColor: Colors.blue.shade400,
          unselectedItemColor: Colors.white.withOpacity(.7),
          selectedItemColor: Colors.white,
          unselectedFontSize: 16,
          selectedFontSize: 20,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'DailY List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_rounded),
              label: 'Completed',
            ),
          ],
        ),
      ),
    );
  }
}

class AllList extends StatelessWidget {
  const AllList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DailYProvider>(context);
    final dailyL = provider.dailys;
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              bottom: 30,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.wysiwyg,
                        size: 50,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'DailY',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Your '),
                      TextSpan(
                        text: 'DailY List',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  dailyL.length.toString() + ' Tasks To Do',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: const DailYListWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedList extends StatelessWidget {
  const CompletedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<DailYProvider>(context);
    //final dailyC = provider.dailys;
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              bottom: 30,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.wysiwyg,
                        size: 50,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'DailY',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Your '),
                      TextSpan(
                        text: 'Completed List',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                // Text(
                //   dailyC.length.toString() + ' Completed Tasks',
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 15,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: const CompletedListWidget(),
            ),
          )
        ],
      ),
    );
  }
}
