import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:de_art/palette.dart';
import 'package:de_art/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../service/api.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

DateTime? _selectDate;
String? _selectDateString;

DateTime? _selectDate2;
String? _selectDateString2;

bool _isCalendar = false;
bool _isCalendar2 = false;
TextEditingController inController = MaskedTextController(mask: '00.00.0000');
TextEditingController outController = MaskedTextController(mask: '00.00.0000');
TextEditingController timeController = MaskedTextController(mask: '00:00');
TextEditingController phoneController =
    MaskedTextController(mask: '+0 (000) 000 00 00');

TextEditingController nameController = TextEditingController();
TextEditingController commentController = TextEditingController();
int _chapter = 1;
int counter = 1;
int duration = 1;
int people = 1;
bool _agree = false;

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.65),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 48),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          size: 48,
                          color: Colors.white,
                        )))),
            Container(
              padding:
                  EdgeInsets.only(top: 24, bottom: 24, right: 24, left: 24),
              margin: EdgeInsets.only(top: 12, bottom: 12, right: 24, left: 24),
              decoration: BoxDecoration(color: Colors.white),
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      selectRoomInfo.title?.toString() ?? "",
                      style: TextStyle(
                          fontSize: 18,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              duration = 1;
                              _isCalendar = false;
                              _isCalendar2 = false;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Text(
                                "На час",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: duration == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              duration = 2;
                              _isCalendar = false;
                              _isCalendar2 = false;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Text(
                                "На ночь",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: duration == 2
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              duration = 3;
                              _isCalendar = false;
                              _isCalendar2 = false;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Text(
                                "На сутки",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: duration == 3
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Дата заезда",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(
                      right: 12,
                    ),
                    // width: MediaQuery.of(context).size.width/1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                              left: 12,
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              controller: inController,
                              decoration: const InputDecoration(
                                hintText: "дд.мм.гггг",
                                isDense: true,
                                border: InputBorder.none,
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              _isCalendar = !_isCalendar;
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              'assets/Icon_Calendar2.svg',
                            ))
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                  _isCalendar
                      ? Container(
                          color: Palette().red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DatePicker(
                                selectedDate: _selectDate,
                                enabledCellsDecoration:
                                    BoxDecoration(color: Palette().red),
                                disbaledCellsDecoration:
                                    BoxDecoration(color: Palette().red),
                                currentDateDecoration:
                                    BoxDecoration(color: Palette().red),
                                selectedCellDecoration:
                                    BoxDecoration(color: Palette().white),
                                daysOfTheWeekTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                enabledCellsTextStyle:
                                    TextStyle(color: Colors.white),
                                currentDateTextStyle:
                                    TextStyle(color: Colors.white),
                                selectedCellTextStyle:
                                    TextStyle(color: Palette().red),
                                leadingDateTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16, bottom: 0),
                                slidersColor: Palette().white,
                                splashColor: Palette().red,
                                minDate: DateTime(2024, 1, 1),
                                maxDate: DateTime(2050, 12, 31),
                                onDateSelected: (value) {
                                  _selectDate = value;
                                  _selectDateString =
                                      DateFormat('dd.MM.yyyy').format(value);
                                  inController.text = _selectDateString ?? "";
                                  setState(() {});
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _selectDate = null;

                                        inController.text = "";
                                        setState(() {});
                                      },
                                      child: Text("Удалить",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  GestureDetector(
                                      onTap: () {
                                        _selectDate = DateTime.now();
                                        _selectDateString =
                                            DateFormat('dd.MM.yyyy')
                                                .format(_selectDate!);
                                        inController.text = _selectDateString!;
                                        setState(() {});
                                      },
                                      child: Text("Сегодня",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              )
                            ],
                          ))
                      : Container(),
                  duration == 3
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Дата выезда",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      : Container(),
                  duration == 3
                      ? Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.only(
                            right: 12,
                          ),
                          // width: MediaQuery.of(context).size.width/1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                    left: 12,
                                  ),
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: TextField(
                                    controller: outController,
                                    decoration: const InputDecoration(
                                      hintText: "дд.мм.гггг",
                                      isDense: true,
                                      border: InputBorder.none,
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    _isCalendar2 = !_isCalendar2;
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                    'assets/Icon_Calendar2.svg',
                                  ))
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                              top: BorderSide(width: 1.0, color: Colors.black),
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                        )
                      : Container(),
                  _isCalendar2
                      ? Container(
                          color: Palette().red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DatePicker(
                                selectedDate: _selectDate2,
                                enabledCellsDecoration:
                                    BoxDecoration(color: Palette().red),
                                disbaledCellsDecoration:
                                    BoxDecoration(color: Palette().red),
                                currentDateDecoration:
                                    BoxDecoration(color: Palette().red),
                                selectedCellDecoration:
                                    BoxDecoration(color: Palette().white),
                                daysOfTheWeekTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                enabledCellsTextStyle:
                                    TextStyle(color: Colors.white),
                                currentDateTextStyle:
                                    TextStyle(color: Colors.white),
                                selectedCellTextStyle:
                                    TextStyle(color: Palette().red),
                                leadingDateTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16, bottom: 0),
                                slidersColor: Palette().white,
                                splashColor: Palette().red,
                                minDate: DateTime(2024, 1, 1),
                                maxDate: DateTime(2050, 12, 31),
                                onDateSelected: (value) {
                                  _selectDate2 = value;
                                  _selectDateString2 =
                                      DateFormat('dd.MM.yyyy').format(value);
                                  outController.text = _selectDateString2 ?? "";
                                  setState(() {});
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _selectDate2 = null;

                                        outController.text = "";
                                        setState(() {});
                                      },
                                      child: Text("Удалить",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  GestureDetector(
                                      onTap: () {
                                        _selectDate2 = DateTime.now();
                                        _selectDateString2 =
                                            DateFormat('dd.MM.yyyy')
                                                .format(_selectDate2!);
                                        outController.text =
                                            _selectDateString2!;
                                        setState(() {});
                                      },
                                      child: Text("Сегодня",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              )
                            ],
                          ))
                      : Container(),
                  duration == 1
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Время заезда",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      : Container(),
                  duration == 1
                      ? Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.only(
                            right: 12,
                          ),
                          // width: MediaQuery.of(context).size.width/1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                    left: 12,
                                  ),
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: TextField(
                                    controller: timeController,
                                    decoration: const InputDecoration(
                                      hintText: "Выберите время",
                                      isDense: true,
                                      border: InputBorder.none,
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    _isCalendar = !_isCalendar;
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                    'assets/Icon_Time2.svg',
                                  ))
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                              top: BorderSide(width: 1.0, color: Colors.black),
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                        )
                      : Container(),
                  duration == 1
                      ? Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Часов",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              GestureDetector(
                                  onTap: () {
                                    counter--;
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                    'assets/Minus.svg',
                                  )),
                              Text(counter.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              GestureDetector(
                                  onTap: () {
                                    counter++;
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                    'assets/Plus.svg',
                                  )),
                              Text(
                                  "${(selectRoomInfo.priceHour! * counter).toString()} ₽",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ))
                      : Container(),
                /*  duration == 2
                      ? Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text("${selectRoomInfo.price?.night ?? ""} ₽",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)))
                      : Container(),
                  duration == 3
                      ? Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text("${selectRoomInfo.price?.price ?? ""} ₽",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)))
                      : Container(),*/
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              people = 1;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: Center(
                                  child: Text(
                                "1 взрослый",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: people == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              people = 2;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: Center(
                                  child: Text(
                                "2 взрослых",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: people == 2
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Ваше имя",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    margin: EdgeInsets.only(bottom: 12),
                    // width: MediaQuery.of(context).size.width/1.5,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Иван Иванович",
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Номер телефона",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    //   width: MediaQuery.of(context).size.width/1.5,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: "+7 (999) 999 99 99",
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    //   width: MediaQuery.of(context).size.width/1.5,
                    height: MediaQuery.of(context).size.height / 5,
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: "Комментарий",
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                GestureDetector(

                  onTap: () async {
                    if(_agree){
                          if (duration == 1) {
                            //counter - кол-во часов
                            //people - кол-во людей (1 или 2)
                            if ((inController.text != "") &
                                (timeController.text != "") &
                                (nameController.text != '') &
                                (phoneController.text != '')) {
                              var _res = await booking_room(
                                  selectRoomInfo.id.toString(),
                                  'hour',
                                  inController.text.toString(),
                                  people.toString(),
                                  timeController.text.toString(),
                                  "",
                                  counter.toString(),
                                  nameController.text.toString(),
                                  phoneController.text.toString(),
                                  commentController.text.toString());
                              if (_res == "success") {
                                Fluttertoast.showToast(
                                    msg: "Успешно отправлено!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Ошибка при отправлении данных!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Заполните данные!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } else if (duration == 2) {
                            //counter - кол-во часов
                            //people - кол-во людей (1 или 2)
                            if ((inController.text != "") &
                                (nameController.text != '') &
                                (phoneController.text != '')) {
                              var _res = await booking_room(
                                  selectRoomInfo.id.toString(),
                                  'night',
                                  inController.text.toString(),
                                  people.toString(),
                                  '',
                                  '',
                                  '',
                                  nameController.text.toString(),
                                  phoneController.text.toString(),
                                  commentController.text.toString());
                              if (_res == "success") {
                                Fluttertoast.showToast(
                                    msg: "Успешно отправлено!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Ошибка при отправлении данных!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Заполните данные!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } else if (duration == 3) {
                            //counter - кол-во часов
                            //people - кол-во людей (1 или 2)
                            if ((inController.text != "") &
                                (outController.text != "") &
                                (nameController.text != '') &
                                (phoneController.text != '')) {
                              var _res = await booking_room(
                                  selectRoomInfo.id.toString(),
                                  'day',
                                  inController.text.toString(),
                                  people.toString(),
                                  '',
                                  outController.text.toString(),
                                  '',
                                  nameController.text.toString(),
                                  phoneController.text.toString(),
                                  commentController.text.toString());
                              if (_res == "success") {
                                Fluttertoast.showToast(
                                    msg: "Успешно отправлено!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Ошибка при отправлении данных!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Заполните данные!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        }else   Fluttertoast.showToast(
                        msg: "Подтвердите согласие!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                      },

                    child:  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 24, right: 24),
                    decoration: BoxDecoration(
                      color: Palette().red,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Забронировать",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _agree = !_agree;
                            setState(() {});
                          },
                          child: _agree
                              ? SvgPicture.asset(
                                  'assets/agree.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/disagree.svg',
                                )),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Я согласен ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  'политикой конфиденциальности и обработки персональных данных',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            )
                          ]))),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
