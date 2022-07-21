import 'package:flutter/material.dart';
import 'package:fromzero/blocs/bloc/tasks_state.dart';
import 'package:fromzero/blocs/bloc_exports.dart';
import 'package:fromzero/screens/recycle_bin.dart';
import 'package:fromzero/screens/tasks_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TaskScreen.id),
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('My Tasks'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            },
          ),
          Divider(),
          BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
              child: ListTile(
                leading: Icon(Icons.folder_special),
                title: Text('Bin'),
                trailing: Text('${state.removedTasks.length}'),
              ),
            );
          })
        ],
      )),
    );
  }
}
