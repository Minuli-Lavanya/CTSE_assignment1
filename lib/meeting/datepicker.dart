import 'package:flutter/material.dart';

void main() {
  runApp(const Datepicker ());
}

class Datepicker extends StatelessWidget {
  const Datepicker ({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'select date',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Select date'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime = DateTime(2022);
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 20);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month
                    .toString().padLeft(2, '0')}-${dateTime.year}',
                style: const TextStyle(fontSize: 50),
              ),
              ElevatedButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: dateTime,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2300)
                    );
                    if (newDate == null) {
                      setState(() {
                        dateTime = newDate!;
                      });
                    }
                  },
                  child: const Text ("Choose Date")
              )

            ],
          ),
        )
    );




  }
}