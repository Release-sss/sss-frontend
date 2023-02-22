import 'dart:convert';

import './rest_api_caller.dart';


class MobisApiCaller{
  static getListByQueries(List<String> searchKeywords){
    Map data = {"queries": searchKeywords};
    return RestApiCaller.postMethod(["seach"], data);
  }

  static getEntryById(int id){
    return RestApiCaller.getMethod(["entry", id.toString()]);
  }
}