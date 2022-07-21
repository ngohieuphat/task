import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromzero/blocs/bloc/tasks_event.dart';
import 'package:fromzero/blocs/bloc/tasks_state.dart';
import 'package:fromzero/blocs/bloc_exports.dart';
import 'package:fromzero/models/task.dart';
import 'package:fromzero/screens/add_task_screen.dart';
import 'package:fromzero/screens/my_drawer.dart';
import 'package:fromzero/widgets/tasks_list.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
        appBar: AppBar(
          title: Text('Tasks App'),
          actions: [
            IconButton(
                onPressed: () => _addTask(context), icon: Icon(Icons.add))
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${state.allTasks.length}Tasks')),
            ),
            TasksList(tasksList: tasksList)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(context),
          tooltip: 'Add Task',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
