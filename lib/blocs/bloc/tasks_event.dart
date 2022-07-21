import 'package:equatable/equatable.dart';
import 'package:fromzero/models/task.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });
  List<Object> get props => [task];
}
class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });
  List<Object> get props => [task];
}

class RemovedTask extends TasksEvent {
  final Task task;
  const RemovedTask({
    required this.task,
  });
  List<Object> get props => [task];
}
