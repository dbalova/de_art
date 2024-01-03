import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_widget/buttonModel.dart';
import '../custom_widget/footer.dart';
import '../palette.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(78.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Container(
                margin: EdgeInsets.only(left: 12, top: 12),
                height: 62,
                child: SvgPicture.asset(
                  'assets/menu.svg',
                )),
            title: Center(
                child: Container(
                    height: 55,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                    ))),
            actions: [
              Container(
                  height: 62,
                  margin: EdgeInsets.only(right: 12, top: 12),
                  child: SvgPicture.asset(
                    'assets/call.svg',
                  ))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [   Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Отзывы",
                    style: TextStyle(
                        fontSize: 30,
                        color: Palette().red,
                        fontWeight: FontWeight.bold),
                  ),

                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                     padding: EdgeInsets.only(top:24, bottom: 40),

                     child:RedButton(
                      Palette().red,
                      "Оставить отзыв",
                      Palette().white,
                      15,
                      FontWeight.bold))),

                  Container(
                    margin: EdgeInsets.only( bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette().red,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Антон",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SvgPicture.asset(
                          'assets/stars.svg',
                        ),
                        Text(
                          "Хорошая гостиница в красивом районе. На Таганской выбор отелей на час не так велик, так что Де Арт прямо спасение. Мы брали Английский номер, остались всем довольны. Советую бронировать заранее",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "18 ноября 2022 г.",
                          style: TextStyle(
                              fontSize: 13, color: Color.fromRGBO(74, 74, 74, 1)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette().red,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Антон",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SvgPicture.asset(
                          'assets/stars.svg',
                        ),
                        Text(
                          "Хорошая гостиница в красивом районе. На Таганской выбор отелей на час не так велик, так что Де Арт прямо спасение. Мы брали Английский номер, остались всем довольны. Советую бронировать заранее",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "18 ноября 2022 г.",
                          style: TextStyle(
                              fontSize: 13, color: Color.fromRGBO(74, 74, 74, 1)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette().red,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Антон",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SvgPicture.asset(
                          'assets/stars.svg',
                        ),
                        Text(
                          "Хорошая гостиница в красивом районе. На Таганской выбор отелей на час не так велик, так что Де Арт прямо спасение. Мы брали Английский номер, остались всем довольны. Советую бронировать заранее",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "18 ноября 2022 г.",
                          style: TextStyle(
                              fontSize: 13, color: Color.fromRGBO(74, 74, 74, 1)),
                        ),
                      ],
                    ),
                  ),


                Padding(
                    padding: EdgeInsets.only(top:24, bottom:48 ),
                    child:  RedButton(
                     Palette().red,
                      "Показать ещё",
                      Palette().white,
                      15,
                      FontWeight.bold)),

                ],
              ),

            ),
            Container(
              padding: const EdgeInsets.only(top: 24),
              child: Image.asset('assets/Map.png'),
            ),
            Footer(context)
          ],

        ),
      ),


    );
  }
}
