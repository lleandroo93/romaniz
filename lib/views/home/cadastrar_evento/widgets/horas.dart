import 'package:flutter/material.dart';

TimeOfDay get horaAtual {
  final now = TimeOfDay.now();
  final hour = now.hour;
  final minute = now.minute;

  return TimeOfDay(hour: hour, minute: minute > 30 ? 30 : 0);
}

const horas = [
  TimeOfDay(hour: 0, minute: 0),
  TimeOfDay(hour: 0, minute: 30),
  TimeOfDay(hour: 1, minute: 0),
  TimeOfDay(hour: 1, minute: 30),
  TimeOfDay(hour: 2, minute: 0),
  TimeOfDay(hour: 2, minute: 30),
  TimeOfDay(hour: 3, minute: 0),
  TimeOfDay(hour: 3, minute: 30),
  TimeOfDay(hour: 4, minute: 0),
  TimeOfDay(hour: 4, minute: 30),
  TimeOfDay(hour: 5, minute: 0),
  TimeOfDay(hour: 5, minute: 30),
  TimeOfDay(hour: 6, minute: 0),
  TimeOfDay(hour: 6, minute: 30),
  TimeOfDay(hour: 7, minute: 0),
  TimeOfDay(hour: 7, minute: 30),
  TimeOfDay(hour: 8, minute: 0),
  TimeOfDay(hour: 8, minute: 30),
  TimeOfDay(hour: 9, minute: 0),
  TimeOfDay(hour: 9, minute: 30),
  TimeOfDay(hour: 10, minute: 0),
  TimeOfDay(hour: 10, minute: 30),
  TimeOfDay(hour: 11, minute: 0),
  TimeOfDay(hour: 11, minute: 30),
  TimeOfDay(hour: 12, minute: 0),
  TimeOfDay(hour: 12, minute: 30),
  TimeOfDay(hour: 13, minute: 0),
  TimeOfDay(hour: 13, minute: 30),
  TimeOfDay(hour: 14, minute: 0),
  TimeOfDay(hour: 14, minute: 30),
  TimeOfDay(hour: 15, minute: 0),
  TimeOfDay(hour: 15, minute: 30),
  TimeOfDay(hour: 16, minute: 0),
  TimeOfDay(hour: 16, minute: 30),
  TimeOfDay(hour: 17, minute: 0),
  TimeOfDay(hour: 17, minute: 30),
  TimeOfDay(hour: 18, minute: 0),
  TimeOfDay(hour: 18, minute: 30),
  TimeOfDay(hour: 19, minute: 0),
  TimeOfDay(hour: 19, minute: 30),
  TimeOfDay(hour: 20, minute: 0),
  TimeOfDay(hour: 20, minute: 30),
  TimeOfDay(hour: 21, minute: 0),
  TimeOfDay(hour: 21, minute: 30),
  TimeOfDay(hour: 22, minute: 0),
  TimeOfDay(hour: 22, minute: 30),
  TimeOfDay(hour: 23, minute: 0),
  TimeOfDay(hour: 23, minute: 30),
];
