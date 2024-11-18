import 'package:flutter/material.dart';
import 'package:flutter_absensi/Provider/state_management.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: provider.history.length,
          itemBuilder: (context, index) {
            final record = provider.history[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(
                  DateFormat('EEEE, dd MMM yyyy').format(record.date),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                leading: Icon(Icons.event_note, color: Colors.indigo),
              ),
            );
          },
        ),
      ),
    );
  }
}