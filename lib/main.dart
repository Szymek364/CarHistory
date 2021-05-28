import 'package:car_history/routes.dart';
import 'package:car_history/screens/fuel/edit_fuel_data.dart';
import 'package:car_history/screens/main/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/fuel_data_collection.dart';
import 'screens/fuel/add_fuel_data.dart';
import 'screens/fuel/fuel_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FuelDataCollection>(
      create: (context) => FuelDataCollection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Historia samochodu',
        routes: {
          AppRoutes.homeScreen: (ctx) => HomeScreen(),
          AppRoutes.fuelList: (ctx) => FuelListScreen(),
          AppRoutes.addFuelEvent: (ctx) => AddFuelScreen(),
          AppRoutes.editFuelEvent: (ctx) => EditFuelScreen(),
        },
        home: Main(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  static List<Widget> _widgetOptions = <Widget>[HomeScreen(), FuelListScreen()];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Strona Główna',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ev_station),
            label: 'Paliwo',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
