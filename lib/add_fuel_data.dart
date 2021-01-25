import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class AddFuelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tankowanie"),
      ),
      body: Center(child: AddFuelWidget()
/*        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/
          ),
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Data',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
              ),
              Expanded(
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Czas',
                  ),
                  mode: DateTimeFieldPickerMode.time,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Licznik', icon: Icon(Icons.countertops)),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                  decoration: const InputDecoration(
                      hintText: 'Ilość', icon: Icon(Icons.countertops)),
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
                  decoration: const InputDecoration(
                      hintText: 'Cena', icon: Icon(Icons.countertops)),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
/*                  if (_formKey.currentState!.validate()) {
                  // Process data.
                }*/
              },
              child: Text('Dodaj'),
            ),
          ),
        ],
      ),
    );
  }
}
