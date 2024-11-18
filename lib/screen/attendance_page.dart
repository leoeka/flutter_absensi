import 'package:flutter/material.dart';
import 'package:flutter_absensi/Provider/state_management.dart';
import 'package:provider/provider.dart';


class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pencatatan Kehadiran'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: provider.students.length,
                separatorBuilder: (context, index) => Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  final student = provider.students[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    title: Text(
                      student.name,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: student.isPresent,
                      activeColor: Colors.indigo,
                      onChanged: (value) {
                        student.isPresent = value!;
                        provider.notifyListeners();
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: provider.students.any((s) => s.isPresent)
                  ? provider.saveAttendance
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                disabledBackgroundColor: Colors.grey,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Simpan Kehadiran',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}