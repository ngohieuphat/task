import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDelete;

  Task({required this.title, required this.id, this.isDone, this.isDelete}) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }
  Task CopyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDelete,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        id,
        isDone,
        isDelete,
      ];
}
