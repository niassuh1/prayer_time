import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrayerTimePanel extends StatelessWidget {
  final String prayer;
  final String time;
  const PrayerTimePanel({super.key, required this.prayer, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(4)),
      child: Row(children: [Text(prayer), Spacer(), Text(time)]),
    );
  }
}
