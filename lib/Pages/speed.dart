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

  String? selectedDropdownValue = 'm/sec';
  TextEditingController _controller = TextEditingController(text: '0');
  String speed = "0.0";
  final borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10));
  void abc() {
    final data = double.parse(_controller.text);
    double loc = 0.0;
    switch (selectedDropdownValue) {
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

    print("$data : $speed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SPEED",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              SizedBox(
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
                value: selectedDropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                underline: Container(
                  padding: EdgeInsets.all(20),
                  height: 0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDropdownValue = newValue;
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
                    fixedSize:
                        WidgetStatePropertyAll(Size(double.maxFinite, 50))),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$selectedDropdownValue : $speed',
                style: TextStyle(
                    fontSize: 24, decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
