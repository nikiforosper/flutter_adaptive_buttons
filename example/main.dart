import 'package:flutter/material.dart';

import 'elevated_button/elevated_buttons.dart';
import 'icon_button/icon_buttons.dart';
import 'outlined_button/outlined_buttons.dart';
import 'text_button/text_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Buttons',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Adaptive Buttons"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButtons(),
              Divider(),
              TextButtons(),
              Divider(),
              OutlinedButtons(),
              Divider(),
              SizedBox(height: 16),
              Divider(),
              IconButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
