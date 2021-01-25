import 'package:car_history/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'helper/FuelCollection.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> getEvents() {
      return FuelCollection.collection.length > 0
          ? FuelCollection.collection
              .map((e) => ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.ev_station),
                    ),
                    title: Text('Tankowanie'),
                    subtitle: Text(DateFormat("dd-MM-yyyy  hh:mm")
                        .format(e.date)
                        .toString()),
                  ))
              .toList()
          : [Center(child: const Text('No items'))];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Historia'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getEvents(),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addFuelEvent),
      ),
    );
  }
}
