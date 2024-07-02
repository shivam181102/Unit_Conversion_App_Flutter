import 'package:flutter/material.dart';

class Speed extends StatefulWidget {
  const Speed({super.key});

  @override
  State<Speed> createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  List<String> dropdownItems = [
    'km/hrs',
    'm/sec',
    'km/sec',
  ];

  String? outputUnit = 'm/sec';
  final TextEditingController _controller = TextEditingController(text: '0');
  String speed = "0.0";
  final borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10));
  void abc() {
    final data = double.parse(_controller.text);
    double loc = 0.0;
    switch (outputUnit) {
      case 'm/sec':
        loc = data * 1000 / 3600;
        break;
      case 'km/sec':
        loc = data / 3600;
        break;
      default:
        loc = data;
    }
    setState(() {
      speed = loc.toStringAsFixed(3);
    });

    // print("$data : $speed");
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return (orientation == Orientation.portrait)
          ? potraitView()
          : _landscapeView();
    });
  }

  Scaffold _landscapeView() {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "SPEED",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "From Unit",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButton<String>(
                              value: outputUnit,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              underline: Container(
                                padding: const EdgeInsets.all(20),
                                height: 0,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  outputUnit = newValue;
                                  speed = "0.0";
                                });
                              },
                              items: dropdownItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Enter SPEED",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _controller,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'SPEED',
                                enabledBorder: borders,
                                focusedBorder: borders,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "To Unit",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButton<String>(
                              value: outputUnit,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              underline: Container(
                                padding: const EdgeInsets.all(20),
                                height: 0,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  outputUnit = newValue;
                                  speed = "0.0";
                                });
                              },
                              items: dropdownItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: abc,
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(12),
                      shadowColor: WidgetStateProperty.all(Colors.black),
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                      fixedSize: WidgetStateProperty.all(
                        Size(double.maxFinite, 50),
                      ),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$outputUnit : $speed',
                    style: const TextStyle(
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Scaffold potraitView() {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SPEED",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter Your Speed in km/hrs",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Speed',
                    enabledBorder: borders,
                    focusedBorder: borders),
                keyboardType: TextInputType.number,
              ),
              DropdownButton<String>(
                value: outputUnit,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                underline: Container(
                  padding: const EdgeInsets.all(20),
                  height: 0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    outputUnit = newValue;
                    speed = "0.0";
                  });
                },
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  abc();
                },
                style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(12),
                    shadowColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 0, 0, 0)),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 0, 0, 0)),
                    fixedSize: const WidgetStatePropertyAll(
                        Size(double.maxFinite, 50))),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$outputUnit : $speed',
                style: const TextStyle(
                    fontSize: 24, decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
