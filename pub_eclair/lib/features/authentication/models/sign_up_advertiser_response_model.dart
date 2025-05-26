import 'dart:convert';

SignUpAdvertiserResponseModel signUpAdvertiserResponseModel(String str) {
  return SignUpAdvertiserResponseModel.fromJson(json.decode(str));
}

class SignUpAdvertiserResponseModel {
  SignUpAdvertiserResponseModel({
    required this.advertiser,
  });
  late final Advertiser? advertiser;
  
  SignUpAdvertiserResponseModel.fromJson(Map<String, dynamic> json){
    advertiser = json["advertiser"] !=null ? Advertiser.fromJson(json['advertiser']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['advertiser'] = advertiser!.toJson();
    return _data;
  }
}

class Advertiser {
  Advertiser({
    required this.nameShop,
    required this.advertiserLastName,
    required this.advertiserFirstName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.location,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String nameShop;
  late final String advertiserLastName;
  late final String advertiserFirstName;
  late final String email;
  late final String phoneNumber;
  late final String password;
  late final String location;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  
  Advertiser.fromJson(Map<String, dynamic> json){
    nameShop = json['nameShop'];
    advertiserLastName = json['advertiserLastName'];
    advertiserFirstName = json['advertiserFirstName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    location = json['location'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
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
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}