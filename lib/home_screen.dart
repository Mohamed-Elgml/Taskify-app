import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_rout_cours/add_task_bottom_sheet.dart';
import 'package:todo_rout_cours/my_provider.dart';
import 'package:todo_rout_cours/tabs/settings_tab.dart';
import 'package:todo_rout_cours/tabs/tasks_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          "ToDo${provider.userModel?.userName }",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet(),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: Colors.white,
              width: 3,
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
           index=value;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            ),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    TasksTab(),
    SettingsTab(),
  ];
}
