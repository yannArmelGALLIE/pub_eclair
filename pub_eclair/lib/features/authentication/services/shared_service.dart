import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");

    return isKeyExist;
  }

  static Future<SignInResponseModel?> loginDetails() async {
        var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");

    if(isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return signInResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(SignInResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(model.toJson())
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }
}