import 'package:flutter/material.dart';
import 'package:unit_conversion/Pages/distance.dart';
import 'package:unit_conversion/Pages/speed.dart';
import 'package:unit_conversion/Pages/temperature.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPage = '';
  Widget _currentPage = Temperature();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Converter",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: _drawer(),
      body: _currentPage,
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            child: Text(
              'Select Conversion',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.straighten),
            title: const Text('Distance'),
            onTap: () {
              setState(() {
                _currentPage = Distance();
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.thermostat),
            title: const Text('Temperature'),
            onTap: () {
              setState(() {
                _currentPage = Temperature();
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.speed),
            title: const Text('Speed'),
            onTap: () {
              setState(() {
                _currentPage = Speed();
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
