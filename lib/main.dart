import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  double result = 0;

  void calculate(String operation) {
    setState(() {
      double num1 = double.tryParse(firstController.text) ?? 0;
      double num2 = double.tryParse(secondController.text) ?? 0;

      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num2 != 0 ? num1 / num2 : 0;
          break;
      }
    });
  }

  void clearFields() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("+", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.calculate, size: 40),
                  onPressed: () => calculate('+'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("-",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.calculate, size: 40),
                  onPressed: () => calculate('-'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("*",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.calculate, size: 40),
                  onPressed: () => calculate('*'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("/",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.calculate, size: 40),
                  onPressed: () => calculate('/'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text('Result: $result', style: const TextStyle(fontSize: 30)),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: clearFields,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 18),
                textStyle: const TextStyle(fontSize: 18),
                shadowColor: const Color.fromARGB(255, 90, 7, 95),
                elevation: 5.0 ),
              child: const Text("CLEAR", style:TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
