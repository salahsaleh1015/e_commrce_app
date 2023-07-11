class CheckOutModel {
  String streetOne;
  String streetTwo;
  String city;

  CheckOutModel(
      {required this.streetOne, required this.streetTwo, required this.city});

  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    return CheckOutModel(
        streetOne: json['streetOne'],
        streetTwo: json['streetTwo'],
        city: json['city']);
  }

  Map<String, dynamic> toJson() {
    return {
      'field1': streetOne,
      'field2': streetTwo,
      'city': city,
    };
  }
}
