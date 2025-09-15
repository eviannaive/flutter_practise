import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime _datetime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // 2000.1.1的意思
      lastDate: DateTime(2025, 12, 31), // 一定要在 initialDate 之後
    ).then((value) {
      setState(() {
        if (value != null) {
          _datetime = value!;
        }
      });
    });
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.inputOnly,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        if (value != null) {
          _timeOfDay = value!;
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Date: ${_datetime.toString()}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Time: ${_timeOfDay.format(context).toString()}',
              style: TextStyle(fontSize: 20),
            ),
            RichText(
              text: TextSpan(
                text: '日期: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: '${_datetime.year}'),
                  TextSpan(text: '年'),
                  TextSpan(text: '${_datetime.month}'),
                  TextSpan(text: '月'),
                  TextSpan(text: '${_datetime.day}'),
                  TextSpan(text: '日'),
                ],
              ),
            ),
            // Text('Date: ${_datetime.year}', style: TextStyle(fontSize: 20)),
            // Text('Date: ${_datetime.month}', style: TextStyle(fontSize: 20)),
            // Text('Date: ${_datetime.day}', style: TextStyle(fontSize: 20)),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: _showDatePicker,
              child: Text(
                'Select Date',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: _showTimePicker,
              child: Text(
                'Select Time',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
