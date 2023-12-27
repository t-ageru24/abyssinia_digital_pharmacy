import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To set alarms'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('Assets/wh12.jpg'),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,

              child: Container(
                margin: const EdgeInsets.all(25),
                child: Column(

                  children: [
                    Text(
                      DateFormat.yMMMEd()
                          .format(DateTime.now()),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 27,color: Colors.black54),
                    ),Text(


                      DateFormat.jm().format(DateTime.now()),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black54),
                    ),
                    Center(
                        child: Column(children: <Widget>[
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11)),
                                child: Center(
                                  child: TextField(
                                    controller: hourController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11)),
                                child: Center(
                                  child: TextField(
                                    controller: minuteController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              child: TextButton(
                                child: const Text(
                                  'Create alarm',
                                  style: TextStyle(fontSize: 25.0,color: Colors.black54),
                                ),
                                onPressed: () {
                                  int hour;
                                  int minutes;
                                  hour = int.parse(hourController.text);
                                  minutes = int.parse(minuteController.text);

                                  // creating alarm after converting hour
                                  // and minute into integer
                                  FlutterAlarmClock.createAlarm(hour, minutes);
                                },
                              ),
                            ),
                          ),
                          new SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // show alarm
                                FlutterAlarmClock.showAlarms();
                              },style:ElevatedButton.styleFrom(
                                primary: Colors.black38
                            ),
                              child: const Text(
                                'Show Alarms',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 50,)
                        ])),
                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}