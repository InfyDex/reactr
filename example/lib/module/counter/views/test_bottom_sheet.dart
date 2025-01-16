import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

class TestBottomSheet extends StatelessWidget {
  const TestBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        Text('This is a bottom sheet'),
        ElevatedButton(
          onPressed: Reactr.back,
          child: Text('Close'),
        ),
      ],
    );
  }
}
