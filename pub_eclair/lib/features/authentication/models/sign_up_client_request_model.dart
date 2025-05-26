class SignUpClientRequestModel {
  SignUpClientRequestModel({
    required this.lastName,
    required this.firstname,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  late final String lastName;
  late final String firstname;
  late final String email;
  late final String phoneNumber;
  late final String password;
  
  SignUpClientRequestModel.fromJson(Map<String, dynamic> json){
    lastName = json['lastName'];
    firstname = json['firstname'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lastName'] = lastName;
    _data['firstname'] = firstname;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    return _data;
  }
}