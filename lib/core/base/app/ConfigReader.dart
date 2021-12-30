

import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader{
  static Map<String , dynamic> _config;
  static Future<void> initialize() async {
    final configString = await rootBundle.loadString("config/app_config.json");
    _config= json.decode(configString) as Map<String,dynamic >;
  }

  static String getBaseUrl(){
    return _config["baseUrl"]?.toString();
  }
  static String getTenantId(){
    return _config["tenantId"]?.toString();
  }
  static String getClientId(){
    return _config["clientId"]?.toString();
  }
  static String getClientSecret(){
    return _config["clientSecret"]?.toString();
  }
  static String getScope(){
    return _config["scope"]?.toString();
  }
  static String getGrantType(){
    return _config["grantType"]?.toString();
  }

}