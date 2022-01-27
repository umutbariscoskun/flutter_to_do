import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:squamobi_to_do/domain/entities/to_do_card.dart';
import 'package:squamobi_to_do/domain/repositories/to_do_repository.dart';

class AddToDo extends UseCase<void, AddToDoParams> {
  final ToDoRepository _toDoRepository;

  AddToDo(
    this._toDoRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(AddToDoParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _toDoRepository.addToDo(params!.toDo);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class AddToDoParams {
  final ToDoCard toDo;

  AddToDoParams(this.toDo);
}
