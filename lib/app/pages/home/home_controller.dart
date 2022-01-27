import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:squamobi_to_do/app/pages/home/home_presenter.dart';
import 'package:squamobi_to_do/domain/entities/to_do_card.dart';
import 'package:squamobi_to_do/domain/repositories/to_do_repository.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(ToDoRepository toDoRepository)
      : _presenter = HomePresenter(toDoRepository);

  List<ToDoCard>? toDos;

  @override
  void onInitState() {
    _presenter.getToDoCards();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getToDoCardsOnNext = (List<ToDoCard>? response) {
      if (response != null) {
        toDos = response;
        refreshUI();
      }
    };

    _presenter.getToDoCardsOnError = (e) {};

    _presenter.removeToDoCardOnComplete = () {};

    _presenter.removeToDoCardOnError = (e) {};

    _presenter.addToDoCardOnComplete = () {};

    _presenter..addToDoCardOnError = (e) {};
  }

  void addToDo(ToDoCard toDo) {
    _presenter.addToDo(toDo);
    refreshUI();
  }

  void removeToDo(String toDoId) {
    _presenter.removeToDo(toDoId);
    refreshUI();
  }
}
