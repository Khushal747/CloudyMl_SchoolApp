import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_urls.dart';
import 'shared_services.dart';

String unicodeConverter(String code) {
  return String.fromCharCodes(Runes(code));
}
 
class ApiBase {
  static url({required String extendedURL}) {
    log("http://${ApiUrl.baseUrl}$extendedURL");

    return Uri.parse("http://${ApiUrl.baseUrl}$extendedURL");
  }

  static Future<http.Response> getRequest({required String extendedURL}) async {
    var client = http.Client();
    Map<String, String> newHeaders = {};
    Map<String, String> conentType = {'Content-Type': 'application/json'};

    newHeaders.addAll(conentType);
    if (SharedService.isLoggedIn()) {
      newHeaders.addAll({'Authorization': SharedService.userAuth()});
    }

    log(newHeaders.toString());
    return client.get(url(extendedURL: extendedURL.trim()),
        headers: newHeaders);
  }




  

  static Future postRequest(
      {required String extendedURL,
      required Object body,
      String? token}) async {
    Map<String, String> newHeaders = {};
    Map<String, String> conentType = {'Content-Type': 'application/json'};

    newHeaders.addAll(conentType);
    if (SharedService.isLoggedIn()) {
      // Authorization header will be add to the header
      newHeaders.addAll({'Authorization': SharedService.userAuth()});
    }

    var client = http.Client();
    log("URL : ${ApiUrl.baseUrl}$extendedURL");
    log(jsonEncode(body));
    return client.post(url(extendedURL: extendedURL),
        headers: newHeaders, body: jsonEncode(body));
  }

  static Future putRequest({
    required String extendedURL,
    required Object body,
  }) async {
    Map<String, String>? headers;
    headers = {
      'Authorization': SharedService.userAuth(),
      'Content-Type': 'application/json',
    };
    var client = http.Client();
    debugPrint("URL : ${ApiUrl.baseUrl}$extendedURL");
    debugPrint(jsonEncode(body));
    return client.put(url(extendedURL: extendedURL),
        headers: headers, body: jsonEncode(body));
  }

  static Future postRequestForLogout({
    required String extendedURL,
  }) async {
    Map<String, String>? headers;
    headers = {
      'Authorization': SharedService.userAuth(),
      'Content-Type': 'application/json',
    };
    var client = http.Client();
    debugPrint("URL : ${ApiUrl.baseUrl}$extendedURL");
    return client.post(
      url(extendedURL: extendedURL),
      headers: headers,
    );
  }

  static Future deleteRequest({
    required String extendedURL,
    required Object body,
  }) async {
    Map<String, String> newHeaders = {};
    Map<String, String> conentType = {'Content-Type': 'application/json'};

    newHeaders.addAll(conentType);
    if (SharedService.isLoggedIn()) {
      newHeaders.addAll({'Authorization': SharedService.userAuth()});
    }
    var client = http.Client();
    debugPrint("URL : ${ApiUrl.baseUrl}$extendedURL");
    debugPrint(jsonEncode(body));
    return client.delete(url(extendedURL: extendedURL),
        headers: newHeaders, body: jsonEncode(body));
  }
}
