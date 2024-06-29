import 'package:flutter/material.dart';

class Distance extends StatefulWidget {
  const Distance({super.key});

  @override
  State<Distance> createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {
  List<String> dropdownItems = [
    'Kilometer',
    'Centimeter',
    'Meter',
  ];

  String? selectedDropdownValue = 'Kilometer';
  TextEditingController _controller = TextEditingController(text: '0');
  String len = "0.0";
  final borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10));
  void abc() {
    final data = double.parse(_controller.text);
    double loc = 0.0;
    switch (selectedDropdownValue) {
      case 'Kilometer':
        loc = data / 1000;
        break;
      case 'Centimeter':
        loc = data * 100;
        break;
      default:
        loc = data;
    }
    setState(() {
      len = loc.toStringAsFixed(1);
    });

    print("$data : $len");
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
                "DISTANCE",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 50,
              ),
              const Text(
                "Enter Your Length in Meters",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Length',
                  enabledBorder: borders,
                  focusedBorder: borders,
                ),
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
                    len = '0.0';
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
                '$selectedDropdownValue : $len',
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
