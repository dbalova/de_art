import 'package:de_art/custom_widget/buttonModel.dart';
import 'package:de_art/page/Map.dart';
import 'package:de_art/page/application_Page.dart';
import 'package:de_art/page/booking_page.dart';
import 'package:de_art/page/menu_page.dart';
import 'package:de_art/page/reviews_page.dart';

import 'package:de_art/page/select_hotel.dart';

import 'package:de_art/page/room_page.dart';

import 'package:de_art/palette.dart';
import 'package:de_art/service/api.dart';
import 'package:de_art/service/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'custom_widget/footer.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

TextEditingController _controllerFrom = TextEditingController();
TextEditingController _controllerTo = TextEditingController();
bool _isFilter = false;
bool? _isJacuzzi;
bool? _isParking;
bool? _isBar;
List<bool> _typeRoom = [false, false, false];
List<bool> _cost = [false, false, false];
List<bool> _metro = [false, false, false, false, false];
List<bool> _time = [false, false, false, false, false,];
List<bool> _typeBed = [false, false, false, false,];

String metroPROF = "";
String metroVIH = "";
String metroTAG = "";
String metroTEKST = "";
String metroKROP = "";
String timeToWithdraw = "";
String bed = "";
String priceFrom = "";
String priceTo = "";
String typeEconomy = "";
String typeLuxury = "";
String typeDeluxe = "";
String jacuzzi = "";
String parking = "";
String bar = "";


final _scrollController = ScrollController();

void _scrollToIndex(index) {
  _scrollController.animateTo(800.0 * 2,
      duration: const Duration(seconds: 2), curve: Curves.easeIn);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        Locale('ru', ''),
      ],
      title: 'De Art 13',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "CeraPro",
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'De Art 13'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool filter = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadInfo().then(() {
        setState(() {});mapController.moveCamera(
          animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: 55.7522200,
                longitude:37.6155600,

              ),
              zoom: 10,
            ),
          ),
        );
      });
    });

  }

  loadInfo() async {
    await all_list();
    await all_reviews();
    setState(() {});
  }

  loadFilter(
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
    await all_list_filters(
        metroPROF,
        metroVIH,
        metroTAG,
        metroTEKST,
        metroKROP,
        timeToWithdraw,
        bed,
        priceFrom,
        priceTo,
        typeEconomy,
        typeLuxury,
        typeDeluxe,
        jacuzzi,
        parking,
        bar);
    await all_reviews();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(78.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MenuPage(),
                    ),
                  );
                },
                child: Container(
                    margin: EdgeInsets.only(left: 12, top: 12),
                    height: 62,
                    child: SvgPicture.asset(
                      'assets/menu.svg',
                    ))),
            title: Center(
                child: Container(
                    height: 55,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                    ))),
            actions: [
              GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) =>
                            ApplicationPage()));
                  },
                  child: Container(
                      height: 62,
                      margin: EdgeInsets.only(right: 12, top: 12),
                      child: SvgPicture.asset(
                        'assets/call.svg',
                      )))
            ],
          )),
      body: ListView(
        children: [
          SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: [
                        Image.asset("assets/hotel.png"),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 560,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Colors.black,
                              Colors.transparent
                            ]))),
                        Container(
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            height: 560,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Отели на час в Москве',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  'Четыре великолепных бутик-отеля «Де-Арт 13» рассчитаны на небольшое количество постояльцев, которым предлагаются номера с уникальными, продуманными до мелочей интерьерами.',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      /*Navigator.of(context).push(PageRouteBuilder(
                                       opaque: false,
                                       pageBuilder: (BuildContext context, _, __) =>
                                           BookingPage()));*/

                                      _scrollToIndex(1);
                                    },
                                    child: RedButton(
                                        Color.fromRGBO(255, 255, 255, 1),
                                        "Бронировать",
                                        Color.fromRGBO(114, 40, 57, 1),
                                        15,
                                        FontWeight.bold)),
                                Text(
                                  'Это прекрасная альтернатива крупным столичным гостиницам с типовыми номерами.',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _isFilter = true;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 26, bottom: 26, left: 26, right: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/filtr.svg',
                            ),
                            Text("Показать фильтры",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      )),
                  _isFilter
                      ? Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/Map.png"),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 24, bottom: 24, left: 12, right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Spacer(flex: 1),
                                      Text("Скрыть фильтры",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Spacer(flex: 1),
                                      GestureDetector(
                                          onTap: () {
                                            _isFilter = false;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.cancel_outlined,
                                            color: Palette().red,
                                          ))
                                    ],
                                  )),
                              Text("Метро:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _metro[0] = !_metro[0];
                                        if (_metro[0]) {
                                          metroPROF = "metro[]=Профсоюзная";
                                        } else {
                                          metroPROF = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _metro[0]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Профсоюзная'))),
                                  GestureDetector(
                                      onTap: () {
                                        _metro[1] = !_metro[1];
                                        if (_metro[1]) {
                                          metroVIH = "metro[]=Выхино";
                                        } else {
                                          metroVIH = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _metro[1]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Выхино'))),
                                  GestureDetector(
                                      onTap: () {
                                        _metro[2] = !_metro[2];
                                        if (_metro[2]) {
                                          metroTAG = "metro[]=Таганская";
                                        } else {
                                          metroTAG = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _metro[2]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Таганская'))),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _metro[3] = !_metro[3];
                                        if (_metro[3]) {
                                          metroTEKST = "metro[]=Текстильщики";
                                        } else {
                                          metroTEKST = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _metro[3]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Текстильщики'))),
                                  GestureDetector(
                                      onTap: () {
                                        _metro[4] = !_metro[4];
                                        if (_metro[4]) {
                                          metroKROP = "metro[]=Кропоткинская";
                                        } else {
                                          metroKROP = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _metro[4]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Кропоткинская'))),
                                ],
                              ),
                              Text("Время:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _time[0] = !_time[0];
                                        for (var i = 0;
                                            i <= _time.length - 1;
                                            i++) {
                                          if (i != 0) {
                                            _time[i] = false;
                                          }
                                        }
                                        if (_time[0]) {
                                          timeToWithdraw = "time[]=1";
                                        } else {
                                          timeToWithdraw = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _time[0]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('От 1 часа'))),
                                  GestureDetector(
                                      onTap: () {
                                        _time[1] = !_time[1];
                                        for (var i = 0;
                                            i <= _time.length - 1;
                                            i++) {
                                          if (i != 1) {
                                            _time[i] = false;
                                          }
                                        }
                                        if (_time[1]) {
                                          timeToWithdraw = "time[]=2";
                                        } else {
                                          timeToWithdraw = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _time[1]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('От 2 часов'))),
                                  GestureDetector(
                                      onTap: () {
                                        _time[2] = !_time[2];
                                        for (var i = 0;
                                            i <= _time.length - 1;
                                            i++) {
                                          if (i != 2) {
                                            _time[i] = false;
                                          }
                                        }
                                        if (_time[2]) {
                                          timeToWithdraw = "time[]=3";
                                        } else {
                                          timeToWithdraw = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _time[2]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('От 3 часов'))),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _time[3] = !_time[3];
                                        for (var i = 0;
                                            i <= _time.length - 1;
                                            i++) {
                                          if (i != 3) {
                                            _time[i] = false;
                                          }
                                        }
                                        if (_time[3]) {
                                          timeToWithdraw = "time[]=12";
                                        } else {
                                          timeToWithdraw = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _time[3]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('На ночь'))),
                                  GestureDetector(
                                      onTap: () {
                                        _time[4] = !_time[4];
                                        for (var i = 0;
                                            i <= _time.length - 1;
                                            i++) {
                                          if (i != 4) {
                                            _time[i] = false;
                                          }
                                        }
                                        if (_time[4]) {
                                          timeToWithdraw = "time[]=24";
                                        } else {
                                          timeToWithdraw = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _time[4]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('На сутки'))),
                                ],
                              ),
                              Text("Тип кровати:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _typeBed[0] = !_typeBed[0];
                                        for (var i = 0;
                                            i <= _typeBed.length - 1;
                                            i++) {
                                          if (i != 0) {
                                            _typeBed[i] = false;
                                          }
                                        }
                                        if (_typeBed[0]) {
                                          bed = "bed=Односпальная кровать";
                                        } else {
                                          bed = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _typeBed[0]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Односпальная кровать'))),
                                  GestureDetector(
                                      onTap: () {
                                        _typeBed[1] = !_typeBed[1];
                                        for (var i = 0;
                                            i <= _typeBed.length - 1;
                                            i++) {
                                          if (i != 1) {
                                            _typeBed[i] = false;
                                          }
                                        }
                                        if (_typeBed[1]) {
                                          bed = "bed=Двуспальная кровать";
                                        } else {
                                          bed = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _typeBed[1]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Двуспальная кровать'))),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _typeBed[2] = !_typeBed[2];
                                    for (var i = 0;
                                        i <= _typeBed.length - 1;
                                        i++) {
                                      if (i != 2) {
                                        _typeBed[i] = false;
                                      }
                                    }
                                    if (_typeBed[2]) {
                                      bed = "bed=Большая двуспальная кровать";
                                    } else {
                                      bed = "";
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: 8, bottom: 8, left: 4, right: 4),
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 12,
                                          right: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          color: _typeBed[2]
                                              ? Palette().yellow
                                              : Colors.grey.shade300),
                                      child:
                                          Text('Большая двуспальная кровать'))),
                              GestureDetector(
                                  onTap: () {
                                    _typeBed[3] = !_typeBed[3];
                                    for (var i = 0;
                                        i <= _typeBed.length - 1;
                                        i++) {
                                      if (i != 3) {
                                        _typeBed[i] = false;
                                      }
                                    }
                                    if (_typeBed[3]) {
                                      bed = "bed=Две раздельные кровати";
                                    } else {
                                      bed = "";
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: 8, bottom: 8, left: 4, right: 4),
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 12,
                                          right: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          color: _typeBed[3]
                                              ? Palette().yellow
                                              : Colors.grey.shade300),
                                      child: Text('Две раздельные кровати'))),
                              Text("Стоимость:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Text("От"),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 8, bottom: 8, left: 4, right: 4),
                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          color: Colors.grey.shade300),
                                      child: TextField(
                                        controller: _controllerFrom,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (text) {
                                          priceFrom = "price_from=${_controllerFrom.text}";
                                        },
                                      )),
                                  Text("До"),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 8, bottom: 8, left: 4, right: 4),
                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          color: Colors.grey.shade300),
                                      child: TextField(
                                        controller: _controllerTo,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (text) {
                                          priceTo = "price_to=${_controllerTo.text}";
                                        },
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _cost[0] = !_cost[0];
                                        for (var i = 0;
                                        i <= _cost.length - 1;
                                        i++) {
                                          if (i != 0) {
                                            _cost[i] = false;
                                          }
                                        }
                                        if(_cost[0]){
                                          priceTo = "price_to=550";
                                        } else {
                                          priceTo = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _cost[0]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('До 550 в час'))),
                                  GestureDetector(
                                      onTap: () {
                                        _cost[1] = !_cost[1];
                                        for (var i = 0;
                                        i <= _cost.length - 1;
                                        i++) {
                                          if (i != 1) {
                                            _cost[i] = false;
                                          }
                                        }
                                        if(_cost[1]){
                                          priceTo = "price_to=750";
                                        } else {
                                          priceTo = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _cost[1]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('До 750 в час'))),
                                  GestureDetector(
                                      onTap: () {
                                        _cost[2] = !_cost[2];
                                        for (var i = 0;
                                        i <= _cost.length - 1;
                                        i++) {
                                          if (i != 2) {
                                            _cost[i] = false;
                                          }
                                        }
                                        if(_cost[2]){
                                          priceTo = "price_to=1100";
                                        } else {
                                          priceTo = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _cost[2]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('До 1100 в час'))),
                                ],
                              ),
                              Text("Тип номера:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _typeRoom[0] = !_typeRoom[0];
                                        for (var i = 0;
                                            i <= _typeRoom.length - 1;
                                            i++) {
                                          if (i != 0) {
                                            _typeRoom[i] = false;
                                          }
                                        }
                                        if (_typeRoom[0]) {
                                          typeEconomy = "type[]=Эконом";
                                        } else {
                                          typeEconomy = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _typeRoom[0]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Эконом'))),
                                  GestureDetector(
                                      onTap: () {
                                        _typeRoom[1] = !_typeRoom[1];
                                        for (var i = 0;
                                            i <= _typeRoom.length - 1;
                                            i++) {
                                          if (i != 1) {
                                            _typeRoom[i] = false;
                                          }
                                        }
                                        if (_typeRoom[1]) {
                                          typeEconomy = "type[]=Люкс";
                                        }  else {
                                          typeEconomy = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _typeRoom[1]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Люкс'))),
                                  GestureDetector(
                                      onTap: () {
                                        _typeRoom[2] = !_typeRoom[2];
                                        for (var i = 0;
                                            i <= _typeRoom.length - 1;
                                            i++) {
                                          if (i != 2) {
                                            _typeRoom[i] = false;
                                          }
                                        }
                                        if (_typeRoom[2]) {
                                          typeEconomy = "type[]=Делюкс";
                                        }  else {
                                          typeEconomy = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _typeRoom[2]
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('Делюкс'))),
                                ],
                              ),
                              Text("Джакузи:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _isJacuzzi = true;
                                        jacuzzi = "jacuzzi=Y";
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _isJacuzzi ?? false
                                                  ? Palette().yellow
                                                  : Colors.grey.shade300),
                                          child: Text('С джакузи'))),
                                  GestureDetector(
                                      onTap: () {
                                        _isJacuzzi = false;
                                        jacuzzi = "jacuzzi=N";
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 4,
                                              right: 4),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: _isJacuzzi ?? true
                                                  ? Colors.grey.shade300
                                                  : Palette().yellow),
                                          child: Text('Без джакузи'))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Охраняемая парковка:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                _isParking = true;
                                                parking = "parking=Y";
                                                setState(() {});
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 8,
                                                      bottom: 8,
                                                      left: 4,
                                                      right: 4),
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 12,
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                      color: _isParking ?? false
                                                          ? Palette().yellow
                                                          : Colors
                                                              .grey.shade300),
                                                  child: Text('Да'))),
                                          GestureDetector(
                                              onTap: () {
                                                _isParking = false;
                                                parking = "parking=N";
                                                setState(() {});
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 8,
                                                      bottom: 8,
                                                      left: 4,
                                                      right: 4),
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 12,
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                      color: _isParking ?? true
                                                          ? Colors.grey.shade300
                                                          : Palette().yellow),
                                                  child: Text('Нет'))),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Круглосуточный бар:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                _isBar = true;
                                                bar = "bar=Y";
                                                setState(() {});
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 8,
                                                      bottom: 8,
                                                      left: 4,
                                                      right: 4),
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 12,
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                      color: _isBar ?? false
                                                          ? Palette().yellow
                                                          : Colors
                                                              .grey.shade300),
                                                  child: Text('Да'))),
                                          GestureDetector(
                                              onTap: () {
                                                _isBar = false;
                                                bar = "bar=N";
                                                setState(() {});
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 8,
                                                      bottom: 8,
                                                      left: 4,
                                                      right: 4),
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 12,
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                      color: _isBar ?? true
                                                          ? Colors.grey.shade300
                                                          : Palette().yellow),
                                                  child: Text('Нет'))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 24, bottom: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () async{
                                          filter = true;
                                          print("https://deart-13.ru/api/v1/index?token=bQWc9FDWI3DiEEYYk6lQvHwlAUjTfDrw&use_filter=Y${metroPROF}&${metroVIH}&${metroTAG}&${metroTEKST}&${metroKROP}&${timeToWithdraw}"
                                              "&${bed}&${priceFrom}&${priceTo}&${typeEconomy}&${typeLuxury}&${typeDeluxe}&${jacuzzi}&${parking}&${bar}");
                                         await loadFilter(metroPROF,
                                            metroVIH,
                                            metroTAG,
                                            metroTEKST,
                                            metroKROP,
                                            timeToWithdraw,
                                            bed,
                                            priceFrom,
                                            priceTo,
                                            typeEconomy,
                                            typeLuxury,
                                            typeDeluxe,
                                            jacuzzi,
                                            parking,
                                            bar,);



                                          setState(() {});
                                        },
                                        child: RedButton(
                                            Palette().red,
                                            "Применить",
                                            Colors.white,
                                            16,
                                            FontWeight.bold),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            _isBar = null;
                                            _isJacuzzi = null;
                                            _isParking = null;
                                            _typeRoom = [false, false, false];
                                            _cost = [false, false, false];
                                            _metro = [false, false, false, false, false];
                                            _time = [false, false, false, false, false,];
                                            _typeBed = [false, false, false, false,];
                                            loadInfo();
                                            setState(() {});
                                            metroPROF = "";
                                            metroVIH = "";
                                            metroTAG = "";
                                            metroTEKST = "";
                                            metroKROP = "";
                                            timeToWithdraw = "";
                                            bed = "";
                                            priceFrom = "";
                                            priceTo = "";
                                            typeEconomy = "";
                                            typeLuxury = "";
                                            typeDeluxe = "";
                                            jacuzzi = "";
                                            parking = "";
                                            bar = "";
                                          },
                                          child: RedButton(
                                              Palette().red,
                                              "Сбросить",
                                              Colors.white,
                                              16,
                                              FontWeight.bold))
                                    ],
                                  )),
                            ],
                          ))
                      : Container(),

                  Visibility(
                    visible: allHotels.hotels?.h1?.numRooms == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Отель на Профсоюзной',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Palette().red),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h1?.numRooms == null ? false : true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: allHotels.hotels?.h1?.numRooms,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 12, top: 12, right: 12, bottom: 12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      await select_room_info(allHotels
                                              .hotels?.h1?.rooms?[index].id
                                              .toString() ??
                                          "");
                                      await select_hotel_info("1");
                                      Navigator.of(context).push(PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder:
                                              (BuildContext context, _, __) =>
                                                  RoomPage()));
                                    },
                                    child: Container(
                                        height: 265,
                                        child: Swiper(
                                          itemBuilder: (context, i) {
                                            return Image.network(
                                                "https://deart-13.ru${allHotels.hotels?.h1?.rooms?[index].images?[i].photo ?? ""}");
                                          },
                                          itemCount: allHotels
                                                  .hotels
                                                  ?.h1
                                                  ?.rooms?[index]
                                                  .images
                                                  ?.length ??
                                              0,
                                          //pagination: const SwiperPagination(),
                                          control: const SwiperControl(
                                              color: Colors.white,
                                              iconNext: Icons
                                                  .arrow_circle_right_outlined,
                                              iconPrevious: Icons
                                                  .arrow_circle_left_outlined),
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12, right: 12, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Text(
                                              allHotels.hotels?.h1?.rooms?[index]
                                                      .title
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time1.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Час',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h1?.rooms?[index].price?.hour.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time12.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Ночь',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h1?.rooms?[index].price?.night.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time24.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Сутки',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h1?.rooms?[index].price?.price.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/mark.svg',
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Профсоюзная',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                                Spacer(
                                                  flex: 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h1
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "1");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder:
                                                                  (BuildContext
                                                                              context,
                                                                          _,
                                                                          __) =>
                                                                      RoomPage()));
                                                    },
                                                    child: Text(
                                                      'Подробнее',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationThickness: 2,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/stars.svg',
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h1
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "1");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (BuildContext
                                                                          context,
                                                                      _,
                                                                      __) =>
                                                                  BookingPage()));
                                                    },
                                                    child: RedButton(
                                                        Palette().red,
                                                        "Бронировать",
                                                        Palette().white,
                                                        15,
                                                        FontWeight.normal)),
                                              ],
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h1?.numRooms == null ? false : true,
                    child: GestureDetector(
                        onTap: () async {
                          await select_hotel_info("1");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SelectHotelPage(),
                            ),
                          );
                        },
                        child: RedButton(Palette().red, "Все номера",
                            Palette().white, 15, FontWeight.bold)),
                  ),

                  Visibility(
                    visible: allHotels.hotels?.h4?.numRooms == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 46),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Отель на Таганской',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Palette().red),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h4?.numRooms == null ? false : true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: allHotels.hotels?.h4?.numRooms,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 12, top: 12, right: 12, bottom: 12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      await select_room_info(allHotels
                                              .hotels?.h4?.rooms?[index].id
                                              .toString() ??
                                          "");
                                      await select_hotel_info("4");
                                      Navigator.of(context).push(PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder:
                                              (BuildContext context, _, __) =>
                                                  RoomPage()));
                                    },
                                    child: Container(
                                        height: 265,
                                        child: Swiper(
                                          itemBuilder: (context, i) {
                                            return Image.network(
                                                "https://deart-13.ru${allHotels.hotels?.h4?.rooms?[index].images?[i].photo ?? ""}");
                                          },
                                          itemCount: allHotels
                                                  .hotels
                                                  ?.h4
                                                  ?.rooms?[index]
                                                  .images
                                                  ?.length ??
                                              0,
                                          //pagination: const SwiperPagination(),
                                          control: const SwiperControl(
                                              color: Colors.white,
                                              iconNext: Icons
                                                  .arrow_circle_right_outlined,
                                              iconPrevious: Icons
                                                  .arrow_circle_left_outlined),
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12, right: 12, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Text(
                                              allHotels.hotels?.h4?.rooms?[index]
                                                      .title
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time1.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Час',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h4?.rooms?[index].price?.hour.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time12.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Ночь',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h4?.rooms?[index].price?.night.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time24.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Сутки',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h4?.rooms?[index].price?.price.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/mark.svg',
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Таганская',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                                Spacer(
                                                  flex: 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h4
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "4");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder:
                                                                  (BuildContext
                                                                              context,
                                                                          _,
                                                                          __) =>
                                                                      RoomPage()));
                                                    },
                                                    child: Text(
                                                      'Подробнее',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationThickness: 2,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/stars.svg',
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h4
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "4");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (BuildContext
                                                                          context,
                                                                      _,
                                                                      __) =>
                                                                  BookingPage()));
                                                    },
                                                    child: RedButton(
                                                        Palette().red,
                                                        "Бронировать",
                                                        Palette().white,
                                                        15,
                                                        FontWeight.normal)),
                                              ],
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h4?.numRooms == null ? false : true,
                    child: GestureDetector(
                        onTap: () async {
                          await select_hotel_info("4");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SelectHotelPage(),
                            ),
                          );
                        },
                        child: RedButton(Palette().red, "Все номера",
                            Palette().white, 15, FontWeight.bold)),
                  ),

                  Visibility(
                    visible: allHotels.hotels?.h2?.numRooms == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 46),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Отель на Новокосино',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Palette().red),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h2?.numRooms == null ? false : true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: allHotels.hotels?.h2?.numRooms,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 12, top: 12, right: 12, bottom: 12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      await select_room_info(allHotels
                                              .hotels?.h2?.rooms?[index].id
                                              .toString() ??
                                          "");
                                      await select_hotel_info("2");
                                      Navigator.of(context).push(PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder:
                                              (BuildContext context, _, __) =>
                                                  RoomPage()));
                                    },
                                    child: Container(
                                        height: 265,
                                        child: Swiper(
                                          itemBuilder: (context, i) {
                                            return Image.network(
                                                "https://deart-13.ru${allHotels.hotels?.h2?.rooms?[index].images?[i].photo ?? ""}");
                                          },
                                          itemCount: allHotels
                                                  .hotels
                                                  ?.h2
                                                  ?.rooms?[index]
                                                  .images
                                                  ?.length ??
                                              0,
                                          //pagination: const SwiperPagination(),
                                          control: const SwiperControl(
                                              color: Colors.white,
                                              iconNext: Icons
                                                  .arrow_circle_right_outlined,
                                              iconPrevious: Icons
                                                  .arrow_circle_left_outlined),
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12, right: 12, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Text(
                                              allHotels.hotels?.h2?.rooms?[index]
                                                      .title
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time1.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Час',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h2?.rooms?[index].price?.hour.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time12.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Ночь',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h2?.rooms?[index].price?.night.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time24.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Сутки',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h2?.rooms?[index].price?.price.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/mark.svg',
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Новокосино',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                                Spacer(
                                                  flex: 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h2
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "2");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder:
                                                                  (BuildContext
                                                                              context,
                                                                          _,
                                                                          __) =>
                                                                      RoomPage()));
                                                    },
                                                    child: Text(
                                                      'Подробнее',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationThickness: 2,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/stars.svg',
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h2
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "2");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (BuildContext
                                                                          context,
                                                                      _,
                                                                      __) =>
                                                                  BookingPage()));
                                                    },
                                                    child: RedButton(
                                                        Palette().red,
                                                        "Бронировать",
                                                        Palette().white,
                                                        15,
                                                        FontWeight.normal)),
                                              ],
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h2?.numRooms == null ? false : true,
                    child: GestureDetector(
                        onTap: () async {
                          await select_hotel_info("2");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SelectHotelPage(),
                            ),
                          );
                        },
                        child: RedButton(Palette().red, "Все номера",
                            Palette().white, 15, FontWeight.bold)),
                  ),

                  Visibility(
                    visible: allHotels.hotels?.h5?.numRooms == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 46),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Отель на Текстильщиках',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Palette().red),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h5?.numRooms == null ? false : true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: allHotels.hotels?.h5?.numRooms,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 12, top: 12, right: 12, bottom: 12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      await select_room_info(allHotels
                                              .hotels?.h5?.rooms?[index].id
                                              .toString() ??
                                          "");
                                      await select_hotel_info("5");
                                      Navigator.of(context).push(PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder:
                                              (BuildContext context, _, __) =>
                                                  RoomPage()));
                                    },
                                    child: Container(
                                        height: 265,
                                        child: Swiper(
                                          itemBuilder: (context, i) {
                                            return Image.network(
                                                "https://deart-13.ru${allHotels.hotels?.h5?.rooms?[index].images?[i].photo ?? ""}");
                                          },
                                          itemCount: allHotels
                                                  .hotels
                                                  ?.h5
                                                  ?.rooms?[index]
                                                  .images
                                                  ?.length ??
                                              0,
                                          //pagination: const SwiperPagination(),
                                          control: const SwiperControl(
                                              color: Colors.white,
                                              iconNext: Icons
                                                  .arrow_circle_right_outlined,
                                              iconPrevious: Icons
                                                  .arrow_circle_left_outlined),
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12, right: 12, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Text(
                                              allHotels.hotels?.h5?.rooms?[index]
                                                      .title
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time1.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Час',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h5?.rooms?[index].price?.hour.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time12.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Ночь',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h5?.rooms?[index].price?.night.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time24.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Сутки',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h5?.rooms?[index].price?.price.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/mark.svg',
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Текстильщики',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                                Spacer(
                                                  flex: 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h5
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "5");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder:
                                                                  (BuildContext
                                                                              context,
                                                                          _,
                                                                          __) =>
                                                                      RoomPage()));
                                                    },
                                                    child: Text(
                                                      'Подробнее',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationThickness: 2,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/stars.svg',
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h5
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "5");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (BuildContext
                                                                          context,
                                                                      _,
                                                                      __) =>
                                                                  BookingPage()));
                                                    },
                                                    child: RedButton(
                                                        Palette().red,
                                                        "Бронировать",
                                                        Palette().white,
                                                        15,
                                                        FontWeight.normal)),
                                              ],
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h5?.numRooms == null ? false : true,
                    child: GestureDetector(
                        onTap: () async {
                          await select_hotel_info("5");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SelectHotelPage(),
                            ),
                          );
                        },
                        child: RedButton(Palette().red, "Все номера",
                            Palette().white, 15, FontWeight.bold)),
                  ),

                  Visibility(
                    visible: allHotels.hotels?.h6?.numRooms == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 46),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Отель на Кропоткинской',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Palette().red),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h6?.numRooms == null ? false : true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: allHotels.hotels?.h6?.numRooms,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 12, top: 12, right: 12, bottom: 12),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      await select_room_info(allHotels
                                              .hotels?.h6?.rooms?[index].id
                                              .toString() ??
                                          "");
                                      await select_hotel_info("6");
                                      Navigator.of(context).push(PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder:
                                              (BuildContext context, _, __) =>
                                                  RoomPage()));
                                    },
                                    child: Container(
                                        height: 265,
                                        child: Swiper(
                                          itemBuilder: (context, i) {
                                            return Image.network(
                                                "https://deart-13.ru${allHotels.hotels?.h6?.rooms?[index].images?[i].photo ?? ""}");
                                          },
                                          itemCount: allHotels
                                                  .hotels
                                                  ?.h6
                                                  ?.rooms?[index]
                                                  .images
                                                  ?.length ??
                                              0,
                                          //pagination: const SwiperPagination(),
                                          control: const SwiperControl(
                                              color: Colors.white,
                                              iconNext: Icons
                                                  .arrow_circle_right_outlined,
                                              iconPrevious: Icons
                                                  .arrow_circle_left_outlined),
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 12, right: 12, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Text(
                                              allHotels.hotels?.h6?.rooms?[index]
                                                      .title
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time1.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Час',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h6?.rooms?[index].price?.hour.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time12.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Ночь',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h6?.rooms?[index].price?.night.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/time24.svg',
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Сутки',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          "${allHotels.hotels?.h6?.rooms?[index].price?.price.toString() ?? ""}  ₽",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12,
                                                top: 12,
                                                left: 12,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/mark.svg',
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Текстильщики',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                                Spacer(
                                                  flex: 2,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h6
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "6");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder:
                                                                  (BuildContext
                                                                              context,
                                                                          _,
                                                                          __) =>
                                                                      RoomPage()));
                                                    },
                                                    child: Text(
                                                      'Подробнее',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationThickness: 2,
                                                          fontSize: 18),
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/stars.svg',
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      await select_room_info(
                                                          allHotels
                                                                  .hotels
                                                                  ?.h6
                                                                  ?.rooms?[index]
                                                                  .id
                                                                  .toString() ??
                                                              "");
                                                      await select_hotel_info(
                                                          "6");
                                                      Navigator.of(context).push(
                                                          PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (BuildContext
                                                                          context,
                                                                      _,
                                                                      __) =>
                                                                  BookingPage()));
                                                    },
                                                    child: RedButton(
                                                        Palette().red,
                                                        "Бронировать",
                                                        Palette().white,
                                                        15,
                                                        FontWeight.normal)),
                                              ],
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  Visibility(
                    visible: allHotels.hotels?.h6?.numRooms == null ? false : true,
                    child: GestureDetector(
                        onTap: () async {
                          await select_hotel_info("6");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SelectHotelPage(),
                            ),
                          );
                        },
                        child: RedButton(Palette().red, "Все номера",
                            Palette().white, 15, FontWeight.bold)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 12, top: 12, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Отзывы',
                            style: TextStyle(
                                fontSize: 18,
                                color: Palette().red,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ReviewsPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Смотреть все отзывы',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    fontSize: 18),
                              )),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: MediaQuery.of(context).size.height / 3,
                      child: Swiper(
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 12, right: 12, bottom: 12),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette().red,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  allReviews[i].name.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SvgPicture.asset(
                                  'assets/stars.svg',
                                ),
                                Text(
                                  allReviews[i].text.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  allReviews[i].dateAdd.toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(74, 74, 74, 1)),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: allReviews.length,
                        //pagination: const SwiperPagination(),
                      )),
                  Row(
                    children: [
                      Spacer(flex: 3),
                      SvgPicture.asset(
                        'assets/left.svg',
                      ),
                      Spacer(flex: 1),
                      SvgPicture.asset(
                        'assets/right.svg',
                      ),
                      Spacer(flex: 3),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 24, bottom: 12, left: 12),
                          child: Text(
                            'Сеть дизайнерских отелей De Art 13',
                            style: TextStyle(
                                fontSize: 18,
                                color: Palette().red,
                                fontWeight: FontWeight.bold),
                          ))),
                  ExpansionTile(
                    shape: Border(),
                    trailing:
                        Icon(Icons.expand_more, size: 40, color: Palette().red),
                    title: Text(
                      'Отель на Профсоюзной',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 24, bottom: 24, left: 12, right: 12),
                            child: Image.asset("assets/1.png"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/loc.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Расположение:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' гостиница находится на юго-западе Москвы в тихом районе с хорошей транспортной развязкой. В пешей доступности — станции метро Новые Черемушки, Калужская, Профсоюзная.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/infr.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Инфраструктура:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/number.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Номера:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/iconFood.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Предложены',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' дополнительные услуги:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' индивидуальный трансфер, завтрак.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Предложены дополнительные услуги: индивидуальный трансфер, завтрак.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 24, bottom: 12, left: 12, right: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SelectHotelPage(),
                                    ),
                                  );
                                },
                                child: RedButton(
                                    Palette().red,
                                    "Посмотреть номера",
                                    Colors.white,
                                    13,
                                    FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
                      child: Divider(
                        color: Palette().red,
                        thickness: 3,
                      )),
                  ExpansionTile(
                    shape: Border(),
                    trailing:
                        Icon(Icons.expand_more, size: 40, color: Palette().red),
                    title: Text(
                      'Отель на Таганской',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 24, bottom: 24, left: 12, right: 12),
                            child: Image.asset("assets/2.png"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/loc.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Расположение:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' почасовой мини-отель De Art 13 находится рядом с метро Таганская всего в нескольких минутах ходьбы.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/infr.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Инфраструктура:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' на территории отеля – охраняемая парковка. Бесплатный Wi-Fi в каждом номере. Рядом с отелем находятся исторические достопримечательности.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/number.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Номера:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' 7 номеров уровня Стандарт, Люкс и Делюкс, а также номер с джакузи. вы можете снять номер почасово, на сутки или ночь.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 24, bottom: 12, left: 12, right: 12),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder:
                                            (BuildContext context, _, __) =>
                                                SelectHotelPage()));
                                  },
                                  child: RedButton(
                                      Palette().red,
                                      "Посмотреть номера",
                                      Colors.white,
                                      13,
                                      FontWeight.bold))),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
                      child: Divider(
                        color: Palette().red,
                        thickness: 3,
                      )),
                  ExpansionTile(
                    shape: Border(),
                    trailing:
                        Icon(Icons.expand_more, size: 40, color: Palette().red),
                    title: Text(
                      'Отель на Новокосино',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 24, bottom: 24, left: 12, right: 12),
                            child: Image.asset("assets/3.png"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/loc.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Расположение:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' гостиница расположена в Восточном административном округе недалеко от станции метро Новокосино. Неподалеку находятся городские зоны отдыха и развлекательные центры.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/infr.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Инфраструктура:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' на территории отеля — охраняемая парковка. В каждом номере – бесплатный Wi-Fi. Поблизости — магазины, рестораны, торговые комплексы.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/number.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Номера:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' 9 номеров: стандартные, улучшенные, бизнес Delux и свадебный Delux. Сантехника и мебель новые. Забронировать номер можно на час, сутки или ночь.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 24, bottom: 12, left: 12, right: 12),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder:
                                            (BuildContext context, _, __) =>
                                                SelectHotelPage()));
                                  },
                                  child: RedButton(
                                      Palette().red,
                                      "Посмотреть номера",
                                      Colors.white,
                                      13,
                                      FontWeight.bold))),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
                      child: Divider(
                        color: Palette().red,
                        thickness: 3,
                      )),
                  ExpansionTile(
                    shape: Border(),
                    trailing:
                        Icon(Icons.expand_more, size: 40, color: Palette().red),
                    title: Text(
                      'Отель на Текстильщиках',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 24, bottom: 24, left: 12, right: 12),
                            child: Image.asset("assets/4.png"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/loc.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Расположение:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' стильный дизайнерский отель на час Текстильщики De Art 13. Расположен рядом со станцией метро на улице Юных Ленинцев в Юго-восточном округе столицы',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/infr.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Инфраструктура:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' нашим постояльцам предлагаем охраняемую парковку и бесплатный WI-FI. Недалеко находятся городские зоны отдыха и развлекательные центры.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/number.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Номера:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' 10 номеров категорий Улучшенный, Люкс и VIP. Забронировать номер можно на час, сутки или ночь.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))

                                  /*Text(
                                  'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                                  fontSize: 14,
                                ),
                                )*/
                                  ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 24, bottom: 12, left: 12, right: 12),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder:
                                            (BuildContext context, _, __) =>
                                                SelectHotelPage()));
                                  },
                                  child: RedButton(
                                      Palette().red,
                                      "Посмотреть номера",
                                      Colors.white,
                                      13,
                                      FontWeight.bold))),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
                      child: Divider(
                        color: Palette().red,
                        thickness: 3,
                      )),
                  ExpansionTile(
                    shape: Border(),
                    trailing:
                        Icon(Icons.expand_more, size: 40, color: Palette().red),
                    title: Text(
                      'Отель на Кропоткинской',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 24, bottom: 24, left: 12, right: 12),
                            child: Image.asset("assets/3.png"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/loc.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Расположение:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' почасовой отель De Art 13 расположен по адресу: ул. Лебяжий пер., д. 8/4, стр. 1. Рядом с гостиницей есть станции метро Кропоткинская, Боровицкая, Арбат и Александровский сад.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/infr.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Инфраструктура:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' в 5 минутах ходьбы расположен знаменитый Храм Христа Спасителя, в 10 минутах — Красная площадь и Кремль. Вы можете посетить Большой Театр, Третьяковскую галерею, ГУМ, прогуляться по Арбату, а также пройтись по колоритному парку Зарядье.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/number.svg',
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  padding: EdgeInsets.only(right: 12),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Номера:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' 14 дизайнерских номеров категорий Стандарт, Делюкс, Люкс, в том числе номера с джакузи.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]))),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 24, bottom: 12, left: 12, right: 12),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder:
                                            (BuildContext context, _, __) =>
                                                SelectHotelPage()));
                                  },
                                  child: RedButton(
                                      Palette().red,
                                      "Посмотреть номера",
                                      Colors.white,
                                      13,
                                      FontWeight.bold))),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
                      child: Divider(
                        color: Palette().red,
                        thickness: 3,
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 24, bottom: 12, left: 12),
                          child: Text(
                            'К вашим услугам',
                            style: TextStyle(
                                fontSize: 18,
                                color: Palette().red,
                                fontWeight: FontWeight.bold),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/tv.svg',
                              ),
                              Text('Спутниковое\nтелевидение',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Spacer(
                                flex: 1,
                              ),
                              SvgPicture.asset(
                                'assets/bathrobe.svg',
                              ),
                              Text('Халаты,\nтапочки',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Spacer(
                                flex: 1,
                              ),
                              SvgPicture.asset(
                                'assets/cleaning.svg',
                              ),
                              Text('Ежедневная\nуборка',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Spacer(
                                flex: 1,
                              ),
                              SvgPicture.asset(
                                'assets/parking.svg',
                              ),
                              Text('Охраняемая\nпарковка',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/food.svg',
                              ),
                              Text('Доставка\nеды в номер',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Spacer(
                                flex: 1,
                              ),
                              SvgPicture.asset(
                                'assets/bar.svg',
                              ),
                              Text('Круглосуточный\nбар',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Spacer(
                                flex: 1,
                              ),
                              SvgPicture.asset(
                                'assets/payment.svg',
                              ),
                              Text('Оплата картой\nVisa/Mastercard',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Spacer(
                                flex: 1,
                              ),
                              SvgPicture.asset(
                                'assets/wi-fi.svg',
                              ),
                              Text('Бесплатный\nWi-Fi',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Image.asset("assets/hotel2.png"),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                            top: 24,
                            bottom: 12,
                          ),
                          child: Text(
                            'Бутик-отель',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/Icon_hotels.svg',
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text('Сеть\nотелей',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            'Пять великолепных бутик-отеля «Де-Арт 13» рассчитаны на небольшое количество постояльцев, которым предлагаются номера с уникальными, продуманными до мелочей интерьерами. Это прекрасная альтернатива крупным столичным гостиницам с типовыми номерами. Здесь можно отдохнуть от суеты большого города, встретиться с друзьями или провести незабываемое романтическое свидание.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 24, bottom: 24),
                      child: Divider(
                        color: Palette().red,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/Icon_rooms.svg',
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text('Номер от\nдизайнеров',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            "Номерной фонд отелей включает номера экономкласса, классические стандарты и люксы, свадебный делюкс. В интерьерах используется роскошная мебель с кожаной обивкой и дизайнерские аксессуары, эксклюзивные отделочные материалы. Гостям выдаются уютные халаты, комплекты полотенец и одноразовые тапочки. В каждом номере есть собственная ванна. Номер в бутик-отеле можно снять на час, сутки или несколько дней.",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 24, bottom: 24),
                      child: Divider(
                        color: Palette().red,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/Icon_interiors.svg',
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text('Эксклюзивные\nинтерьеры',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            'Современная Москва способна удивить даже самого бывалого путешественника. И хотя в мегаполисе снять хороший номер со всеми удобствами просто, отыскать что-то действительно эксклюзивное – задача не из легких. Вместе с тем, даже среди таких немногочисленных вариантов есть особенные, те, которые непременно запомнятся. Именно такими являются отели Де-Арт 13, объединяющие четыре великолепные гостиницы с удобным расположением.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )),
                    ],
                  ),

                  /*Footer(context)*/
                ],
              ))),
          miniMap(context)
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
