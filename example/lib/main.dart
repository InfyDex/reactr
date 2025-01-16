import 'package:example/module/counter/bindings/counter_binding.dart';
import 'package:example/module/counter/views/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:reactr/reactr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactrMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () => Reactr.to(
            binding: CounterBinding(),
            builder: () => const CounterView(),
          ),
          child: const Text("Open Counter"),
        ),
      ),
    );
  }
}
