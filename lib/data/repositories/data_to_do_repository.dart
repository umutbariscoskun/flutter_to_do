import 'dart:async';

import 'package:squamobi_to_do/domain/entities/to_do_card.dart';
import 'package:squamobi_to_do/domain/repositories/to_do_repository.dart';

class DataToDoRepository implements ToDoRepository {
  static final _instance = DataToDoRepository._internal();
  DataToDoRepository._internal();
  factory DataToDoRepository() => _instance;

  List<ToDoCard> _toDos = [
    ToDoCard(
      "",
      "title",
      "description",
      "https://cf.bstatic.com/xdata/images/hotel/max1024x768/200332548.jpg?k=81c26152eed74143cfb59626b17a177124efa259ee0138673ffdc50b1d66c498&o=&hp=1",
    ),
    ToDoCard(
      "",
      "title",
      "description",
      "https://cf.bstatic.com/xdata/images/hotel/max1024x768/200332548.jpg?k=81c26152eed74143cfb59626b17a177124efa259ee0138673ffdc50b1d66c498&o=&hp=1",
    ),
    ToDoCard(
      "",
      "title",
      "description",
      "https://cf.bstatic.com/xdata/images/hotel/max1024x768/200332548.jpg?k=81c26152eed74143cfb59626b17a177124efa259ee0138673ffdc50b1d66c498&o=&hp=1",
    ),
  ];

  StreamController<List<ToDoCard>> _streamController =
      StreamController.broadcast();

  @override
  Future<void> addToDo(ToDoCard toDoCard) async {
    try {
      _toDos.add(toDoCard);
      _streamController.add(_toDos);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> removeToDo(String toDoId) async {
    try {
      print(toDoId);
      _toDos.remove(_toDos.firstWhere((toDo) => toDo.id == toDoId));
      _streamController.add(_toDos);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  // TODO: implement toDoCards
  Stream<List<ToDoCard>> get toDoCards {
    try {
      Future.delayed(Duration.zero).then(
        (_) => _streamController.add(_toDos),
      );
      return _streamController.stream;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
