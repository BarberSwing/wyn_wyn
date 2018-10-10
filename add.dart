import 'package:flutter/material.dart';
import 'package:wyn_wyn/date_picker.dart';

class Add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddView();
}

abstract class AddState extends State<Add> {}

class AddView extends AddState {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Theme(
          data: _theme.copyWith(primaryColor: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DatePicker(
              labelText: 'Date',
            ),
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
