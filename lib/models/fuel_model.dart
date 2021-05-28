class FuelModel {
  DateTime date;
  String course;
  String amount;
  String pricePerLiter;

  FuelModel({this.date, this.course, this.amount, this.pricePerLiter});

  double get totalCost =>
      double.parse(this.amount) * double.parse(this.pricePerLiter);

  void update(
      String amount, String course, DateTime date, String pricePerLiter) {
    this.amount = amount;
    this.course = course;
    this.date = date;
    this.pricePerLiter = pricePerLiter;
  }
}
