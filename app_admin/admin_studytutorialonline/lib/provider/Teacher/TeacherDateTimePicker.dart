import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherDateTimePicker {
  Future<void> _selectedDate(BuildContext context, DateTime _date) async {
    DateTime? _datetime = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2030));
  }
}
