import 'dart:convert';

SignUpClientResponseModel signUpClientResponseModel(String str) =>
  SignUpClientResponseModel.fromJson(json.decode(str));

class SignUpClientResponseModel {
  SignUpClientResponseModel({
    required this.client,
  });
  late final Client? client;
  
  SignUpClientResponseModel.fromJson(Map<String, dynamic> json){
    client = json["client"] !=null ? Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['client'] = client!.toJson();
    return _data;
  }
}

class Client {
  Client({
    required this.lastName,
    required this.firstname,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String lastName;
  late final String firstname;
  late final String email;
  late final String phoneNumber;
  late final String password;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  
  Client.fromJson(Map<String, dynamic> json){
    lastName = json['lastName'];
    firstname = json['firstname'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lastName'] = lastName;
    _data['firstname'] = firstname;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}