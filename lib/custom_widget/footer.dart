import 'package:de_art/custom_widget/testTabBar.dart';
import 'package:de_art/page/contacts.dart';
import 'package:de_art/page/rules_of_accommodation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../page/about_us.dart';
import '../palette.dart';

Widget Footer(context){
  return Container(
    padding: EdgeInsets.only(top: 24, left: 12, right: 12, bottom: 24),
    decoration: BoxDecoration(
      color: Palette().red,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'м. Профсоюзная',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Профсоюзная, 64 корп.2',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (495) 988 57 94',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (968) 910 37 65',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'м. Новокосино',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Наташи Качуевской,4',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (925) 288 33 13',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (499) 178 10 68',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'м. Таганская',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Народная, дом 14, стр.1 ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (495) 798 09 33',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (925) 845 90 33',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'м. Текстильщики',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Артюхиной, 14/8, стр.1',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (925) 562 43 90',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (495) 500 00 77',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                  ],
                )),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 24, bottom: 24),
            child: Divider(
              color: Colors.white,
            )),
        SvgPicture.asset(
          'assets/logo2.svg',
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Новые Черемушки",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница м.Выхино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Академическая",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Жулебино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Новокосино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Ленинский проспект",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Работа в De Art 13",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Профсоюзная",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Калужская",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Люберцы",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Беляево",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Коньково",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Номера эконом класса",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Отели с почасовой оплатой Москва",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                ))
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Отзывы",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Номер с джакузи",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Отель метро Люблино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Свадебный номер",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница на ночь",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница метро Печатники",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Карта сайта",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const AboutUs(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("О нас ",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Contacts(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Контакты",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Общие положения",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const RulesOfAccommodation(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Правила проживания",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Дополнительные услуги",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Прайс-лист",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const TabBarExample(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Обработка персональных данных",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                ))
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(flex: 3),
            SvgPicture.asset(
              'assets/wa.svg',
            ),
            Spacer(flex: 1),
            SvgPicture.asset(
              'assets/tg.svg',
            ),
            Spacer(flex: 1),
            SvgPicture.asset(
              'assets/viber.svg',
            ),
            Spacer(flex: 1),
            SvgPicture.asset(
              'assets/vk.svg',
            ),
            Spacer(flex: 3),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "© 2023 De Art 13",
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "Информационные материалы, размещенные на сайте, носят справочный характер и не являются публичной офертой",
          style: TextStyle(fontSize: 11, color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}