import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LamanUtama(title: 'Lazy Caterer Sequence'),
    );
  }
}

class LamanUtama extends StatefulWidget {
  const LamanUtama({super.key, required this.title});

  final String title;

  @override
  State<LamanUtama> createState() => _LamanUtamaState();
}

class _LamanUtamaState extends State<LamanUtama> {
  TextEditingController lazy1 = TextEditingController();
  TextEditingController lazyhasil = TextEditingController();

  void calculateLazyCaterer() {
    int? n = int.tryParse(lazy1.text);
    if (n != null && n >= 0) {
      List<int> sequence = List.generate(n, (i) => lazyCaterer(i));
      lazyhasil.text = sequence.join(", ");
    } else {
      lazyhasil.text = "Invalid input";
    }
  }

  int lazyCaterer(int n) {
    return (n * (n + 1)) ~/ 2 + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: lazy1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Input Nilai (n)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: calculateLazyCaterer,
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: lazyhasil,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Hasil",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
