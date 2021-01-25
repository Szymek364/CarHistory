import 'package:car_history/models/fuel_model.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'helper/FuelCollection.dart';

final counterController = TextEditingController();
final pricePerLiterController = TextEditingController();
final totalLiterController = TextEditingController();
DateTime date = DateTime.now();

class AddFuelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tankowanie"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  FuelCollection.collection.add(FuelModel(
                      amount: totalLiterController.text,
                      counter: counterController.text,
                      date: date,
                      pricePerLiter: pricePerLiterController.text));
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.done,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(child: AddFuelWidget()),
    );
  }
}

class AddFuelWidget extends StatefulWidget {
  @override
  _AddFuelWidgetState createState() => _AddFuelWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddFuelWidgetState extends State<AddFuelWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        icon: Icon(Icons.event_note),
                        labelText: 'Data',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: DateTime.now(),
                      onDateSelected: (DateTime value) {
                        date = new DateTime(value.year, value.month, value.day,
                            date.hour, value.minute);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        labelText: 'Czas',
                      ),
                      mode: DateTimeFieldPickerMode.time,
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: DateTime.now(),
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        date = new DateTime(date.year, date.month, date.day,
                            value.hour, value.minute);
                      },
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Licznik', icon: Icon(Icons.time_to_leave_sharp)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: counterController,
              validator: (value) {
/*                if (value!.isEmpty) {
                  return 'Please enter some text';
                }*/
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: totalLiterController,
                    decoration: const InputDecoration(
                        hintText: 'Ilość', icon: Icon(Icons.ev_station)),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
/*                if (value!.isEmpty) {
                        return 'Please enter some text';
                      }*/
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: pricePerLiterController,
                    decoration: const InputDecoration(
                        hintText: 'Cena za litr',
                        icon: Icon(Icons.monetization_on)),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
/*             if (value!.isEmpty) {
                        return 'Please enter some text';
                      }*/
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
