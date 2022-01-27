import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:squamobi_to_do/domain/entities/to_do_card.dart';
import 'package:squamobi_to_do/domain/repositories/to_do_repository.dart';
import 'package:squamobi_to_do/domain/usecases/add_to_do.dart';
import 'package:squamobi_to_do/domain/usecases/get_to_do_card.dart';
import 'package:squamobi_to_do/domain/usecases/remove_to_do.dart';

class HomePresenter extends Presenter {
  late Function getToDoCardsOnNext;
  late Function getToDoCardsOnError;

  late Function removeToDoCardOnComplete;
  late Function removeToDoCardOnError;

  late Function addToDoCardOnComplete;
  late Function addToDoCardOnError;

  final GetToDoCards _getToDoCards;
  final RemoveToDo _removeToDo;
  final AddToDo _addToDo;

  HomePresenter(ToDoRepository _toDoRepository)
      : _getToDoCards = GetToDoCards(_toDoRepository),
        _addToDo = AddToDo(_toDoRepository),
        _removeToDo = RemoveToDo(_toDoRepository);

  @override
  void dispose() {
    _getToDoCards.dispose();
    _removeToDo.dispose();
    _addToDo.dispose();
  }

  void getToDoCards() {
    _getToDoCards.execute(_GetToDoCardsObserver(this));
  }

  void addToDo(ToDoCard toDo) {
    _addToDo.execute(_AddToDoObserver(this), AddToDoParams(toDo));
  }

  void removeToDo(String toDoId) {
    _removeToDo.execute(_RemoveToDoObserver(this), RemoveToDoParams(toDoId));
  }
}

class _GetToDoCardsObserver extends Observer<List<ToDoCard>> {
  final HomePresenter _presenter;
  _GetToDoCardsObserver(this._presenter);
  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getToDoCardsOnError(e);
  }

  @override
  void onNext(response) {
    _presenter.getToDoCardsOnNext(response);
  }
}

class _AddToDoObserver extends Observer {
  final HomePresenter _presenter;
  _AddToDoObserver(this._presenter);
  @override
  void onComplete() {
    _presenter.addToDoCardOnComplete();
  }

  @override
  void onError(e) {
    _presenter.addToDoCardOnError(e);
  }

  @override
  void onNext(_) {}
}

class _RemoveToDoObserver extends Observer {
  final HomePresenter _presenter;
  _RemoveToDoObserver(this._presenter);
  @override
  void onComplete() {
    _presenter.removeToDoCardOnComplete();
  }

  @override
  void onError(e) {
    _presenter.removeToDoCardOnError(e);
  }

  @override
  void onNext(_) {}
}
