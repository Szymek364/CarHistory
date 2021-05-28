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
}
