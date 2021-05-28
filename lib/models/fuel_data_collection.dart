import 'package:flutter/foundation.dart';

import 'fuel_model.dart';

class FuelDataCollection extends ChangeNotifier {
  List<FuelModel> fuelCollection = [];

  addFuelElement(FuelModel newModel) {
    this.fuelCollection.add(newModel);
    this.fuelCollection.sort((a, b) => b.date.compareTo(a.date));
    this.notifyListeners();
  }

  get fuelCollectionLength {
    return this.fuelCollection.length;
  }

  get lastCourseValue {
    if (this.fuelCollectionLength == 0) return null;

    return this.fuelCollection.first.course;
  }

  updateFuelEvent(FuelModel model, String amount, String course, DateTime date,
      String pricePerLiter) {
    model.update(amount, course, date, pricePerLiter);
    notifyListeners();
  }
}
