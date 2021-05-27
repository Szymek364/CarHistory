import 'package:car_history/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/fuel_data_collection.dart';
import 'screens/fuel/add_fuel_data.dart';
import 'screens/fuel/fuel_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FuelDataCollection>(
      create: (context) => FuelDataCollection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Historia samochodu',
        initialRoute: AppRoutes.fuelList,
        routes: {
          AppRoutes.fuelList: (ctx) => Dashboard(),
          AppRoutes.addFuelEvent: (ctx) => AddFuelScreen()
        },
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Strona Główna',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Paliwo',
              ),
            ],
          ),
        ),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
