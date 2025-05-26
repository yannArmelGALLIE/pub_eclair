class Config {
  static const String appName = "GEOPUB";
  static const String apiUrl = "192.168.1.61:3000";
  static const String signInAPI = "/api/client/login";
  static const String signUpClientAPI = "/api/client/register";  
  static const String signInAdvertiserAPI = "/api/advertiser/login";
  static const String signUpAdvertiserAPI = "/api/advertiser/register";
  static String clientProfilAPI(String id) => "/api/client/$id";
  static String advertiserProfilAPI(String id) => "/api/advertiser/$id";

}