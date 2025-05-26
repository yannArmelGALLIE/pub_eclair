import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pub_eclair/features/authentication/config.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_request_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_response_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_up_client_request_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_up_client_response_model.dart';
import 'package:pub_eclair/features/authentication/services/shared_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(SignInRequestModel model) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json"
    };

    var url = Uri.http(Config.apiUrl, Config.signInAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      final responseModel = signInResponseJson(response.body);
      await SharedService.setLoginDetails(responseModel);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', responseModel.client.id);
      await prefs.setString("lastName", responseModel.client.lastName);
      await prefs.setString("firstname", responseModel.client.firstname);
      await prefs.setString("emailUser", responseModel.client.email);
      return true;
    } else {
      return false;
    }
  }

  static Future<SignUpClientResponseModel> register(
    SignUpClientRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json"
    };

    var url = Uri.http(Config.apiUrl, Config.signUpClientAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return signUpClientResponseModel(response.body);
  }
}
