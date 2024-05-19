import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_rout_cours/fire_base_function.dart';
import 'package:todo_rout_cours/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel model;

  TaskItem({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        extentRatio: .5,
        children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTask(model.id);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: "DELETE",
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            label: "EDIT",
          ),
        ],
      ),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 80,
              width: 3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: ListTile(
                title: Text(model.title),
                subtitle: Text(model.description),
                trailing: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
      ),
    );
  }
}
