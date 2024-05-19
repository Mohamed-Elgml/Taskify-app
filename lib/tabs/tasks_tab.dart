import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_rout_cours/fire_base_function.dart';
import 'package:todo_rout_cours/task_item.dart';
import 'package:todo_rout_cours/task_model.dart';

class TasksTab extends StatefulWidget {
  TasksTab({Key? key}) : super(key: key);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          height: 90,
          locale: "en",
          initialSelectedDate: selectedDate,
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            selectedDate = date;
            setState(() {});
          },
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(""),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Try Again"),
                    ),
                  ],
                );
              }
              List<TaskModel> tasksList =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (tasksList.isEmpty) {
                return Center(
                  child: Text(
                    "NO TASKS",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: tasksList[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 12,
                ),
                itemCount: tasksList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
