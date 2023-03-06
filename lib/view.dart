import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyebusy_sms/controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SmsController smsController = Get.put(SmsController());
  // ignore: prefer_typing_uninitialized_variables
  var messages;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    messages = await smsController.fetch();
    debugPrint(messages.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OyeBusy SMS'),
      ),
      body: FutureBuilder(
          future: fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text('Something went wrong'));
              }
            }
            return ListView.separated(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(messages[index][0].toString()),
                  title: Text(messages[index][1].toString()),
                  subtitle: Text(messages[index][2].toString()),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.lightBlueAccent),
              child: const Text(
                'Fetch Messages',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  messages = smsController.fetch();
                  debugPrint(messages.toString());
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.lightBlueAccent),
              child: const Text(
                'Send SMS',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                smsController.send(messages);
              },
            )
          ],
        ),
      ),
    );
  }
}
