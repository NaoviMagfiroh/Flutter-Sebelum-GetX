import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final myController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              print("Build Widget Text");
              return Text(
                "${myController.data.value}",
                style: TextStyle(fontSize: 60),
              );
            }),
            ElevatedButton(
              onPressed: () {
                myController.decrement();
              },
              child: Text("-"),
            ),
            ElevatedButton(
              onPressed: () {
                myController.increment();
              },
              child: Text("+"),
            )
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  var data = 0.obs;
  increment() {
    data = data + 1;
  }

  decrement() {
    data = data - 1;
  }
}
