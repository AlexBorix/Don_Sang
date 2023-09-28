import 'package:flutter/material.dart';

class NeedForm extends StatefulWidget {
  const NeedForm({super.key});

  @override
  State<NeedForm> createState() => _NeedFormState();
}

class _NeedFormState extends State<NeedForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Don de Sang form'),
        ),
        ),
    );
  }
}