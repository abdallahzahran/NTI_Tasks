import '../models/task_model.dart';

class TasksRepo{
  List<TaskModel> _Tasks=[];

  void addTask(TaskModel task){
    _Tasks.add(task);
  }

  List<TaskModel> grtTask(TaskModel task){
   return _Tasks;
  }
}