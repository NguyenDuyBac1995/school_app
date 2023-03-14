import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestDateTime extends StatefulWidget {
  const TestDateTime({Key? key}) : super(key: key);

  @override
  State<TestDateTime> createState() => _TestDateTimeState();
}

class _TestDateTimeState extends State<TestDateTime> {
 DateTime lastDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        child:  ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            lastDayOfMonth.day,
                (index) => Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${index + 1}",
                  ),
                      () {
                    final currentDate =
                    lastDayOfMonth.add(Duration(days: index + 1));
                    final dateName =
                    DateFormat('E').format(currentDate);
                    return Text(dateName);
                  }()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

