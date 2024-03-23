import 'package:de_art/models/Page.dart' as allPage;
import 'package:de_art/models/SelectPageInfo.dart';
//import 'package:de_art/models/SelectHotelInfo.dart';
import 'package:dio/dio.dart';

import '../models/AllHotelsInfo.dart';
import '../models/Hotel.dart'as allList ;
import '../models/Review.dart';
import '../models/SelectHotelInfo.dart';
import '../models/SelectRoomInfo.dart';
import 'global.dart';


//var _res = List<Cell>.from(_json['cells'].map((model) => Cell.fromJson(model)));


Future all_list() async {
  print("all_list start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/index?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      allHotels = allList.AllHotel.fromJson(_json) ;
print(allHotels.toString());
      print("all_list success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("all_list fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("all_list fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future all_pages() async {
  print("all_pages start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/pages?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      allPages =List<allPage.Page>.from(_json['pages'].map((model) => allPage.Page.fromJson(model))) ;
//print(allPages.toString());
      print("all_pages success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("all_pages fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("all_pages fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future all_reviews() async {
  print("all_reviews start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/reviews?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      allReviews =List<Review>.from(_json['guestbook'].map((model) => Review.fromJson(model))) ;
//print(allReviews.toString());
      print("all_reviews success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("all_reviews fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("all_reviews fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future all_hotels_info() async {
  print("all_hotels_info start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/hotels?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      allHotelsInfo = AllHotelsInfo.fromJson(_json) ;
print(allHotelsInfo.toString());
      print("all_hotels_info success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("all_hotels_info fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("all_hotels_info fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future select_hotel_info(String id) async {
  print("select_hotel_info start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/hotel?id=$id&token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

     selectHotelInfo = SelectHotelInfo.fromJson(_json) ;
      print(selectHotelInfo.toString());
      print("select_hotel_info success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("select_hotel_info fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("select_hotel_info fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future select_page_info(String id) async {
  print("select_page_info start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/page?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&id=$id",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      selectPageInfo = SelectPageInfo.fromJson(_json) ;
      print(selectPageInfo.toString());
      print("select_page_info success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("select_page_info fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("select_page_info fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future select_room_info(String id) async {
  print("select_room_info start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/room?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&id=$id",
    );
    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      selectRoomInfo = SelectRoomInfo.fromJson(_json) ;
      print(selectRoomInfo.toString());
      print("select_room_info success " + DateTime.now().toString());
      return "success";
    } else if (_json['error'] != null) {
      print("select_room_info fail " +
          DateTime.now().toString() +
          " reason " +
          _json["error"]);
      return _json['error'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("select_room_info fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}