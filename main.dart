import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 102, 85, 255)),
        useMaterial3: true,
      ),
      home: const TodaApp(),
    );
  }
}

class TodaApp extends StatefulWidget {
  const TodaApp({
    super.key,
  });

  @override
  State<TodaApp> createState() => _TodaAppState();
}

class _TodaAppState extends State<TodaApp> {
  late TextEditingController _controller;
  final List<String> _myList = [];
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void addTodoHandle(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add New Task"),
            content: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "input your task"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _myList.add(_controller.text);
                    });
                    _controller.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text("Save"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('Hello Teammy'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodoHandle(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
