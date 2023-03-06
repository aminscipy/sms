import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OyeBusy SMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: prefer_typing_uninitialized_variables
var recipents;
String message = '';

void send(String message, List<String> recipents) async {
  String result = await sendSMS(
    message: message,
    recipients: recipents,
    sendDirect: true
  ).catchError((onError) {
    Fluttertoast.showToast(msg: onError);
    return 'error';
  });
  Fluttertoast.showToast(msg: result);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OyeBusy SMS'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  child: TextField(
                onChanged: (value) {
                  recipents = value.split('_');
                },
                maxLines: 10,
                decoration: const InputDecoration(
                    hintText: 'List of recipient numbers here seperated with underscore'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  child: TextField(
                onChanged: (value) {
                  message = value;
                },
                maxLines: 10,
                decoration: const InputDecoration(hintText: 'Message here'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.blueGrey),
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onPressed: () {
                      send(message, recipents);
                      print(recipents);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
