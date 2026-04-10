import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  @override
  void initState() {
    // TODO: read value from shared preferences
    print('screen initiated ***********************');
    readStoredValue();
    super.initState();
  }

  readStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? storedValue = prefs.getInt('rahat');

    _counter = storedValue ?? 50;

    setState(() {

    });

  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });

    // Todo: write the counter value in shared preferences
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an integer value to 'counter' key.
    await prefs.setInt('rahat', _counter);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('Counter'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}