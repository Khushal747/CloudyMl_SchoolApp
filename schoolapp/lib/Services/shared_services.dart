import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/Models/fetched_children_model.dart';
import 'package:school_management_system/Services/firebase_api_services.dart';
import '../Models/login_response_model.dart';
import '../constants/constants.dart';

class SharedService {
  static bool isLoggedIn() {
    return preferences!.getString("login_details") != null ? true : false;
  }

  static LoginResponseModel? loginDetails() {
    if (preferences!.getString("login_details") != null) {
      return LoginResponseModel.fromJson(
          jsonDecode(preferences!.getString("login_details")!));
    } else {
      return null;
    }
  }

////////////////////////////////////

  //TODO FETCH AND STORE IT IN A DIFFERENT PLACE THEN MAIN USER
  static FetchedChildrenModel? childDetails() {
    if (preferences!.getString("child_detail") != null) {
      return FetchedChildrenModel.fromJson(
          jsonDecode(preferences!.getString("child_detail")!));
    } else {
      return null;
    }
  }

  static Future<void> setDetailsOfFetchedChild(
      FetchedChildrenModel? responseModel) async {
    if (responseModel != null) {
      preferences!
          .setString("child_detail", jsonEncode(responseModel.toJson()));
    }
  }

  ///////////////////////////////

  static Future<void> setLoginDetails(LoginResponseModel? responseModel) async {
    if (responseModel != null) {
      preferences!
          .setString("login_details", jsonEncode(responseModel.toJson()));
    }
  }

//TODO
  static Future<bool> logout(BuildContext context) async {
    await preferences!.clear();
    FirebaseMessaging.instance.deleteToken();
    fcmToken = "";
    // log("the fcm tocken is empty ${}");
    return true;
  }

  static String userAuth() {
    //
    var model = LoginResponseModel.fromJson(
        jsonDecode(preferences!.getString("login_details")!));
    return "Bearer ${model.data!.token!}";
  }

  //............ Test.........................................................
  static Future<void> sharedSet(String st) async {
    preferences!.setString("inside_data", st);
  }

  static getShared() {
    if (preferences!.getString("inside_data") != null) {
      return preferences!.getString("inside_data");
    } else {
      return null;
    }
  }
}
