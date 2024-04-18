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


Future select_hotel_info_filter(String id, String filter) async {
  print("select_hotel_info start " + DateTime.now().toString());
  print(id);
  print(filter);
  print( "https://deart-13.ru/api/v1/hotel?id=$id&token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y&filter=$filter");
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/hotel?id=$id&token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y&filter=$filter",
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

      selectRoomInfo = SelectRoomInfo.fromJson(_json['room']) ;
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

Future all_list_filters(
    String metroPROF,
    String metroVIH,
    String metroTAG,
    String metroTEKST,
    String metroKROP,
    String timeToWithdraw,
    String bed,
    String priceFrom,
    String priceTo,
    String typeEconomy,
    String typeLuxury,
    String typeDeluxe,
    String jacuzzi,
    String parking,
    String bar,
    ) async {
  print("all_list start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://deart-13.ru/api/v1/index?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y${metroPROF}&${metroVIH}&${metroTAG}&${metroTEKST}&${metroKROP}&${timeToWithdraw}"
          "&${bed}&${priceFrom}&${priceTo}&${typeEconomy}&${typeLuxury}&${typeDeluxe}&${jacuzzi}&${parking}&${bar}",
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




Future leave_review(String hotel_id, String name,String message) async {
  print("leave_review start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/review?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: {
      'hotel_id': hotel_id,
      'name': name,
      'message': message,
    },
    );


    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      print("leave_review success " + DateTime.now().toString());
      return "success";
    } else if (_json['reason'] != null) {
      print("leave_review fail " +
          DateTime.now().toString() +
          " reason " +
          _json["reason"]);
      return _json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("leave_review fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}


Future recall (String name, String phone,String? message) async {
  print("recall start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/recall?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: {
        'name': name,
        'phone': phone,
        'message': message ?? "",
      },
    );


    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      print("recall success " + DateTime.now().toString());
      return "success";
    } else if (_json['reason'] != null) {
      print("recall fail " +
          DateTime.now().toString() +
          " reason " +
          _json["reason"]);
      return _json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("recall fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}


Future booking_room (String room_id,String period,String date_in,String adult,
    String? time_in,String? date_out,String? num_hours,
    String name, String phone,String? message) async {
  print("booking_room start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/booking?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: period =="На час"?{
        'room_id': room_id,
        'period': period,
        //  hour — На час
        //  night — На ночь
        //  day — На сутки
        'date_in': date_in,
        'time_in': time_in,
        'num_hours': num_hours,
        'adult': adult,
        'name': name,
        'phone': phone,
        'message': message ?? "",
      }
      : period =="На ночь"
      ?{
    'room_id': room_id,
    'period': period,
    //  hour — На час
    //  night — На ночь
    //  day — На сутки
    'date_in': date_in,
    'adult': adult,
    'name': name,
    'phone': phone,
    'message': message ?? "",
    }
    :{
        'room_id': room_id,
        'period': period,
        //  hour — На час
        //  night — На ночь
        //  day — На сутки
        'date_in': date_in,
        'date_out': date_out,
        'adult': adult,
        'name': name,
        'phone': phone,
        'message': message ?? "",
      },
    );


    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      print("booking_room success " + DateTime.now().toString());
      return "success";
    } else if (_json['reason'] != null) {
      print("booking_room fail " +
          DateTime.now().toString() +
          " reason " +
          _json["reason"]);
      return _json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("booking_room fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}



Future feedback (String hotel_id, String contact,String message) async {
  print("feedback start " + DateTime.now().toString());
  var dio = Dio();
  try {
    var response = await dio.post(
      "https://deart-13.ru/api/v1/feedback?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw",
      data: {
        'hotel_id': hotel_id,
        'contact': contact,
        'message': message,
      },
    );


    final _json = response.data;
    if ((response.statusCode == 200) & (_json['success'] == true)) {

      print("feedback success " + DateTime.now().toString());
      return "success";
    } else if (_json['reason'] != null) {
      print("feedback fail " +
          DateTime.now().toString() +
          " reason " +
          _json["reason"]);
      return _json['reason'];
    } else
      return "Неизвестная ошибка";
  } on DioError catch (e) {
    print("feedback fail " +
        DateTime.now().toString() +
        " reason " +
        e.toString());
    if (e.response != null)
      return e.response.toString();
    else
      return e.message.toString();
  }
}


