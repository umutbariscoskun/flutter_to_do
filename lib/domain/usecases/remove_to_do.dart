import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:squamobi_to_do/domain/repositories/to_do_repository.dart';

class RemoveToDo extends UseCase<void, RemoveToDoParams> {
  final ToDoRepository _toDoRepository;

  RemoveToDo(
    this._toDoRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(RemoveToDoParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _toDoRepository.removeToDo(params!.toDoId);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class RemoveToDoParams {
  final String toDoId;

  RemoveToDoParams(this.toDoId);
}
