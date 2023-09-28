import 'package:flutter/material.dart';

class NeedRealPage extends StatefulWidget {
  const NeedRealPage({super.key});

  @override
  State<NeedRealPage> createState() => _NeedRealPageState();
}

class _NeedRealPageState extends State<NeedRealPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Don de Sang reg'),
        ),
        ),
    );
  }
}