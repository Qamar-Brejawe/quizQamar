import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/data_type.dart';
import '../models/apis/token_info.dart';
import '../models/cart_model.dart';

class SharedPreferencesRepositories {
  SharedPreferences globalSharedPref = Get.find();
  String PREF_FIRST_LAUNCH = 'first_launch';
  String IS_LOGGED_IN = 'is_logged_in';
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_APP_LANG = 'app_language';
  String PREF_CART_LIST = 'cart_list';
  String PREF_ORDER_PLACED = 'order_placed';
  String PREF_SUB_STATUS = 'sub_status';

// static String IS_SELECT_PIC = 'is_select_pic';

  setSubStatus(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  bool getSubStatus() {
    if (globalSharedPref.containsKey(PREF_SUB_STATUS)) {
      return getPreference(key: PREF_SUB_STATUS);
    } else {
      return true;
    }
  }

  setLogIn(bool value) {
    setPreference(dataType: DataType.BOOL, key: IS_LOGGED_IN, value: value);
  }

// static setSaveImage(String value){
//   setPreference(dataType: DataType.STRING, key: IS_SELECT_PIC, value: value);
// }

// static String LoadImage(){
//   if (globalSharedPref!.containsKey(IS_SELECT_PIC)) {
//     return getPreference(key: IS_SELECT_PIC);
//   }  else { return 'images/logo.svg'; }
// }

  bool getLogIn() {
    if (globalSharedPref.containsKey(IS_LOGGED_IN)) {
      return getPreference(key: IS_LOGGED_IN);
    } else {
      return false;
    }
  }

  setFirstLunch(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LAUNCH,
      value: value,
    );
  }

  bool getFirstLunch() {
    if (globalSharedPref.containsKey(PREF_FIRST_LAUNCH)) {
      return getPreference(key: PREF_FIRST_LAUNCH);
    } else {
      return true;
    }
  }

  setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPref.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(
          jsonDecode(getPreference(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }

  setAppLanguage(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPref.containsKey(PREF_APP_LANG)) {
      return getPreference(key: PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }

  void setCartList(List<CartModel> list) {
    setPreference(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalSharedPref.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreference(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  setOrderPlaced(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_ORDER_PLACED,
      value: value,
    );
  }

  bool getOrderPlaced() {
    if (globalSharedPref.containsKey(PREF_ORDER_PLACED)) {
      return getPreference(key: PREF_ORDER_PLACED);
    } else {
      return false;
    }
  }

  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPref.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPref.setBool(key, value);
        break;
      case DataType.STRING:
        await globalSharedPref.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await globalSharedPref.setStringList(key, value);
        break;
    }
  }

  dynamic getPreference({required String key}) {
    return globalSharedPref.get(key);
  }

  void setLoggedIN(bool bool) {}
}
