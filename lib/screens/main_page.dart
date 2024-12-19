import 'package:flutter/material.dart';
import 'package:sould_mind_body/components/thought_input_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Thoughts')),
      body: const ThoughtInputWidget(),
    );
  }
}
