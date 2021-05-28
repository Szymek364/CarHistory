import 'package:car_history/models/fuel_data_collection.dart';
import 'package:car_history/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FuelListScreen extends StatefulWidget {
  @override
  _FuelListScreenState createState() => _FuelListScreenState();
}

class _FuelListScreenState extends State<FuelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historia tankowania'),
      ),
      body: SafeArea(child: Consumer<FuelDataCollection>(
        builder: (context, fuelCollection, child) {
          return Center(
              child: ListView.builder(
            itemCount: fuelCollection.fuelCollectionLength,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.ev_station),
                ),
                trailing: Text(fuelCollection.fuelCollection[index].totalCost
                        .toStringAsFixed(2) +
                    ' zł'),
                title: Text('Tankowanie'),
                subtitle: Text(DateFormat("dd-MM-yyyy  hh:mm")
                    .format(fuelCollection.fuelCollection[index].date)
                    .toString()),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.editFuelEvent,
                      arguments: fuelCollection.fuelCollection[index]);
                },
              );
            },
          ));
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addFuelEvent);
        },
      ),
    );
  }
}
