import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../notifications/notification_dialog.dart';

class TextTimeInput extends StatefulWidget {
  final String text;

  TextTimeInput(this.text);

  @override
  _TextTimeInputState createState() => _TextTimeInputState();
}

class _TextTimeInputState extends State<TextTimeInput> {
  DateTime selectedDate = DateTime.now();
  DateTime from_to;

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy   HH:mm');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDateTimeDialog(context, initialDate: selectedDate,
            onSelectedDate: (selectedDate) {
              setState(() {
                this.selectedDate = selectedDate;
                from_to=selectedDate;
                print(this.selectedDate);
                var diffDt =
                this.selectedDate.difference(this.selectedDate);
                print(diffDt);
                print(diffDt.inDays);
                print(diffDt.inHours);
                print(diffDt.inMinutes);
              });
            });
      },
      child: AbsorbPointer(
        child: TextFormField(
          autocorrect: true,
          decoration: InputDecoration(
            labelText: '${widget.text}\t\t\t\t\t\t\t\t\t\t\t\t\t ${dateFormat.format(selectedDate)}',
            labelStyle: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
            //suffix: Text('FROM $selectedDate'),
            suffixIcon: Icon(
              Icons.access_time,
              color: Color(0xff4A306D),
              size: 30,
            ),
            hintText: widget.text,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xff4A306D), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xff4A306D)),
            ),
          ),
        ),
      ),
    );
  }
}
