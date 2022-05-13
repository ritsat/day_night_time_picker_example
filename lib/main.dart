import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Day Night Time Picker Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            "Open time picker",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).push(showPicker(
                value: _time,
                onChange: (TimeOfDay time) {
                  setState(() {
                    _time = time;
                  });
                  print(_time);
                },
                onChangeDateTime: (DateTime dateTime) {},
                is24HrFormat: false,
                iosStylePicker: false,
                disableHour: false,
                //minuteInterval: MinuteInterval.FIVE,
                //sunAsset: Image.asset("assets/sun.png"),
                //moonAsset: Image.asset("assets/moon.png"),
                displayHeader: true));
          },
        ),
      ),
    );
  }
}
