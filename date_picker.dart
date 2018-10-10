import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key key, this.labelText, this.initialDate})
      : super(key: key);
  final labelText;
  final initialDate;

  @override
  State<StatefulWidget> createState() => DatePickerView();
}

abstract class DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    date = widget.initialDate ?? DateTime.now();
  }
}

class DatePickerView extends DatePickerState {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          pickDate(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: widget.labelText,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(DateFormat.yMMMd().format(date)),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ));
  }

  Future<Null> pickDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 100),
    );
    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }
}
