import 'package:flutter/material.dart';
import 'package:fromzero/blocs/bloc/tasks_state.dart';
import 'package:fromzero/blocs/bloc_exports.dart';
import 'package:fromzero/screens/my_drawer.dart';
import 'package:fromzero/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Recycle Bin'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${state.removedTasks.length}Tasks')),
            ),
            TasksList(tasksList: state.removedTasks)
          ],
        ),
      );
    });
  }
}
