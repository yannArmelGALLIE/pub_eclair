import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pub_eclair/features/authentication/config.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_advertiser_request_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_advertiser_response_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_up_advertiser_request_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_up_advertiser_response_model.dart';
import 'package:pub_eclair/features/authentication/services/shared_service_advertiser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIAdvertiserService {
  static var client = http.Client();

  static Future<bool> loginAdvertiser(SignInAdvertiserRequestModel model) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json"
    };

    var url = Uri.http(Config.apiUrl, Config.signInAdvertiserAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      final responseModel = signInAdvertiserResponseJson(response.body);
      await SharedServiceAdvertiser.setLoginDetails(responseModel);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', responseModel.advertiser.id);
      await prefs.setString("lastName", responseModel.advertiser.advertiserLastName);
      await prefs.setString("firstname", responseModel.advertiser.advertiserFirstName);
      await prefs.setString("shopName", responseModel.advertiser.nameShop);
      return true;
    } else {
      return false;
    }
  }

  static Future<SignUpAdvertiserResponseModel> registerAdvertiser(
    SignUpAdvertiserRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json"
    };

    var url = Uri.http(Config.apiUrl, Config.signUpAdvertiserAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return signUpAdvertiserResponseModel(response.body);
  }
}
