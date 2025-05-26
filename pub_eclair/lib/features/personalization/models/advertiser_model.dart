class AdvertiserModel {
  final String id;
  final nameShop;
  final advertiserLastName;
  final advertiserFirstName;
  final email;
  final phoneNumber;
  final location;

  AdvertiserModel({
    required this.id,
    required this.nameShop,
    required this.advertiserLastName,
    required this.advertiserFirstName,
    required this.email,
    required this.phoneNumber,
    required this.location,
  });

  factory AdvertiserModel.fromJson(Map<String, dynamic> json) {
    return AdvertiserModel(
      id: json['_id'],
      nameShop: json['nameShop'],
      advertiserLastName: json['advertiserLastName'],
      advertiserFirstName: json['advertiserFirstName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      location: json['location'],
    );
  }
}
