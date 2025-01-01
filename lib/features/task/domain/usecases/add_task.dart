import 'package:remind_me/core/usecases/usecase.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import '../repositories/task_repository.dart';

class AddTask implements UseCase<void, Task> {
  final TaskRepository repository;

  AddTask(this.repository);

  @override
  Future<void> call(Task task) async {
    return repository.addTask(task);
  }
}
