import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../notifications/notification_dialog.dart';

class DateTimePickerWidget extends StatefulWidget {
  final String text;
  DateTimePickerWidget(this.text);
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy   HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        FlatButton(
          //decoration:InputBoxDecoration(),
          child: Text(widget.text),
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
                  setState(() {
                    this.selectedDate = selectedDate;
                  });
                });
          },
        ),
      ],
    );
  }
}