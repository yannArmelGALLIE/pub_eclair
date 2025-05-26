import 'dart:convert';

SignInAdvertiserResponseModel signInAdvertiserResponseJson(String str) {
  return SignInAdvertiserResponseModel.fromJson(json.decode(str));
}

class SignInAdvertiserResponseModel {
  SignInAdvertiserResponseModel({
    required this.advertiser,
    required this.token,
  });
  late final Advertiser advertiser;
  late final String token;
  
  SignInAdvertiserResponseModel.fromJson(Map<String, dynamic> json){
    advertiser = Advertiser.fromJson(json['advertiser']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['advertiser'] = advertiser.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Advertiser {
  Advertiser({
    required this.id,
    required this.nameShop,
    required this.advertiserLastName,
    required this.advertiserFirstName,
    required this.email,
    required this.phoneNumber,
    required this.password,
     this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String nameShop;
  late final String advertiserLastName;
  late final String advertiserFirstName;
  late final String email;
  late final String phoneNumber;
  late final String password;
  late final Null location;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  
  Advertiser.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    nameShop = json['nameShop'];
    advertiserLastName = json['advertiserLastName'];
    advertiserFirstName = json['advertiserFirstName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    location = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['nameShop'] = nameShop;
    _data['advertiserLastName'] = advertiserLastName;
    _data['advertiserFirstName'] = advertiserFirstName;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    _data['location'] = location;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}