import 'package:car_history/models/fuel_data_collection.dart';
import 'package:car_history/models/fuel_model.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFuelScreen extends StatefulWidget {
  @override
  _AddFuelScreenState createState() => _AddFuelScreenState();
}

class _AddFuelScreenState extends State<AddFuelScreen> {
  final courseController = TextEditingController();
  final pricePerLiterController = TextEditingController();
  final totalLiterController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Function onDateUpdate = (newDate) {
      setState(() {
        this.date = newDate;
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Nowe tankowanie"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState.validate()) {
                    var newModel = FuelModel(
                        amount: totalLiterController.text,
                        course: courseController.text,
                        date: date,
                        pricePerLiter: pricePerLiterController.text);
                    Provider.of<FuelDataCollection>(context, listen: false)
                        .addFuelElement(newModel);
                    Navigator.pop(context, newModel);
                  }
                },
                child: Icon(
                  Icons.done,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(
          child: AddFuelWidget(
              onDateUpdate: onDateUpdate,
              courseController: this.courseController,
              totalLiterController: this.totalLiterController,
              pricePerLiterController: this.pricePerLiterController,
              formKey: this.formKey)),
    );
  }
}

class AddFuelWidget extends StatefulWidget {
  final courseController;
  final pricePerLiterController;
  final totalLiterController;
  final formKey;
  Function onDateUpdate;

  AddFuelWidget(
      {this.onDateUpdate,
      this.pricePerLiterController,
      this.courseController,
      this.totalLiterController,
      this.formKey});

  @override
  _AddFuelWidgetState createState() => _AddFuelWidgetState(
      onDateUpdate: this.onDateUpdate,
      courseController: this.courseController,
      totalLiterController: this.totalLiterController,
      pricePerLiterController: this.pricePerLiterController,
      formKey: this.formKey);
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddFuelWidgetState extends State<AddFuelWidget> {
  final courseController;
  final pricePerLiterController;
  final totalLiterController;
  final formKey;
  final Function onDateUpdate;
  DateTime _date = DateTime.now();

  _AddFuelWidgetState(
      {this.pricePerLiterController,
      this.courseController,
      this.totalLiterController,
      this.formKey,
      this.onDateUpdate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
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
                      lastDate: DateTime.now(),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: DateTime.now(),
                      onDateSelected: (DateTime value) {
                        _date = new DateTime(value.year, value.month, value.day,
                            _date.hour ?? 0, _date.minute ?? 0);
                        onDateUpdate(_date);
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
                      onDateSelected: (DateTime value) {
                        setState(() {
                          _date = new DateTime(_date.year, _date.month,
                              _date.day, value.hour, value.minute);
                          onDateUpdate(_date);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Stan licznika',
                  icon: Icon(
                    Icons.time_to_leave_sharp,
                  ),
                  suffixText: 'KM'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Proszę wpisać stan licznika';
                }
                return null;
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: courseController,
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
                      if (value == null || value.isEmpty) {
                        return 'Proszę wpisać ilość';
                      }
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Proszę wpisać cene za litr';
                      }
                      return null;
                    },
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
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
