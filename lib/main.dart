import 'package:flutter/material.dart';
import 'package:med_form/view/med_input_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 54, 174, 230)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine Form'),
          backgroundColor: const Color.fromARGB(255, 82, 200, 255),
        ),
        body: const MedInputView(),
      ),
    );
  }
}
