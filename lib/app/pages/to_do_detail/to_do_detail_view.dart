import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:squamobi_to_do/app/pages/to_do_detail/to_do_detail_controller.dart';

class ToDoDetailView extends View {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _ToDoDetailViewState
    extends ViewState<ToDoDetailView, ToDoDetailController> {
  _ToDoDetailViewState(ToDoDetailController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    return Scaffold(
      key: globalKey,
    );
  }
}
