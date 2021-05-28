import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuelFormWidget extends StatefulWidget {
  final courseController;
  final pricePerLiterController;
  final totalLiterController;
  final formKey;
  Function onDateUpdate;

  FuelFormWidget(
      {this.onDateUpdate,
      this.pricePerLiterController,
      this.courseController,
      this.totalLiterController,
      this.formKey});

  @override
  _FuelFormWidgetState createState() => _FuelFormWidgetState(
      onDateUpdate: this.onDateUpdate,
      courseController: this.courseController,
      totalLiterController: this.totalLiterController,
      pricePerLiterController: this.pricePerLiterController,
      formKey: this.formKey);
}

/// This is the private State class that goes with MyStatefulWidget.
class _FuelFormWidgetState extends State<FuelFormWidget> {
  final courseController;
  final pricePerLiterController;
  final totalLiterController;
  final formKey;
  final Function onDateUpdate;
  DateTime _date = DateTime.now();

  _FuelFormWidgetState(
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
