import 'package:flutter/foundation.dart';

import 'fuel_model.dart';

class FuelDataCollection extends ChangeNotifier {
  List<FuelModel> fuelCollection = [];

  addFuelElement(FuelModel newModel) {
    this.fuelCollection.insert(0, newModel);
    this.notifyListeners();
  }

  get fuelCollectionLength {
    return this.fuelCollection.length;
  }
}
