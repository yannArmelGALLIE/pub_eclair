class SignInRequestModel {
  SignInRequestModel({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;
  
  SignInRequestModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}