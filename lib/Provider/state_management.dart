import 'package:flutter/material.dart';
import 'package:flutter_absensi/Model/riwayat_kehadiran.dart';
import 'package:flutter_absensi/Model/student.dart';

class AttendanceProvider extends ChangeNotifier {
  List<Student> students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
    Student(name: 'Leo'),
  ];

  List<AttendanceHistory> history = [];

  void saveAttendance() {
    int presentCount = students.where((s) => s.isPresent).length;
    int absentCount = students.length - presentCount;

    history.insert(0, AttendanceHistory(
      date: DateTime.now(),
      presentCount: presentCount,
      absentCount: absentCount,
    ));

    // Reset kehadiran
    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
