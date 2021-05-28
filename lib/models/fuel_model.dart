class FuelModel {
  DateTime date;
  String course;
  String amount;
  String pricePerLiter;

  FuelModel({this.date, this.course, this.amount, this.pricePerLiter});

  double get totalCost =>
      double.parse(this.amount) + double.parse(this.pricePerLiter);
}
