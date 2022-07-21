import 'package:flutter/material.dart';
import 'package:fromzero/blocs/bloc/tasks_bloc.dart';
import 'package:fromzero/blocs/bloc/tasks_event.dart';
import 'package:fromzero/blocs/bloc_exports.dart';
import 'package:fromzero/models/task.dart';
import 'package:fromzero/widgets/task_title.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return TaskTitle(task: task);
          }),
    );
  }
}

