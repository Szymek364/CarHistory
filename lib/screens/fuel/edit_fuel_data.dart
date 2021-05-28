import 'package:car_history/models/fuel_data_collection.dart';
import 'package:car_history/models/fuel_model.dart';
import 'package:car_history/widgets/fuel/FuelFormWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFuelScreen extends StatefulWidget {
  @override
  _EditFuelScreenState createState() => _EditFuelScreenState();
}

class _EditFuelScreenState extends State<EditFuelScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fuelModel = ModalRoute.of(context).settings.arguments as FuelModel;
    final courseController = TextEditingController(text: fuelModel.course);
    final pricePerLiterController =
        TextEditingController(text: fuelModel.pricePerLiter);
    final totalLiterController = TextEditingController(text: fuelModel.amount);
    DateTime date = fuelModel.date;

    Function onDateUpdate = (newDate) {
      setState(() {
        date = newDate;
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Edycja"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState.validate()) {
                    Provider.of<FuelDataCollection>(context, listen: false)
                        .updateFuelEvent(
                            fuelModel,
                            totalLiterController.text,
                            courseController.text,
                            date,
                            pricePerLiterController.text);
                    Navigator.pop(context);
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
          child: FuelFormWidget(
              onDateUpdate: onDateUpdate,
              courseController: courseController,
              totalLiterController: totalLiterController,
              pricePerLiterController: pricePerLiterController,
              formKey: this.formKey)),
    );
  }
}
