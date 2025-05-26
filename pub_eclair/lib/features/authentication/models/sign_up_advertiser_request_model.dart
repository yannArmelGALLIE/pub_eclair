class SignUpAdvertiserRequestModel {
  SignUpAdvertiserRequestModel({
    required this.nameShop,
    required this.advertiserLastName,
    required this.advertiserFirstName,
    required this.email,
    required this.phoneNumber,
    required this.password,
     this.location,
  });
  late final String nameShop;
  late final String advertiserLastName;
  late final String advertiserFirstName;
  late final String email;
  late final String phoneNumber;
  late final String password;
  late final String? location;
  
  SignUpAdvertiserRequestModel.fromJson(Map<String, dynamic> json){
    nameShop = json['nameShop'];
    advertiserLastName = json['advertiserLastName'];
    advertiserFirstName = json['advertiserFirstName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    location = "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nameShop'] = nameShop;
    _data['advertiserLastName'] = advertiserLastName;
    _data['advertiserFirstName'] = advertiserFirstName;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    _data['location'] = location;
    return _data;
  }
}