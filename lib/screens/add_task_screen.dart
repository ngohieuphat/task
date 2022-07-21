import 'package:flutter/material.dart';
import 'package:fromzero/blocs/bloc/tasks_event.dart';
import 'package:fromzero/blocs/bloc_exports.dart';
import 'package:fromzero/models/task.dart';
import 'package:fromzero/services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var task =
                      Task(title: titleController.text, id: GUIDGen.generate());

                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: Text('Add'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
