import 'package:flutter/material.dart';

class Portal extends StatelessWidget {
  final Widget child;
  final String title;

  const Portal({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(fontSize: 16)),
          backgroundColor: Colors.blue,
        ),
        body: child);
  }
}
