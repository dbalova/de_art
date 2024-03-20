import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../palette.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
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
                    onTap: () {
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
        body: SingleChildScrollView(
            child:Container(
                padding: EdgeInsets.only(left: 15,right: 15, top:0),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            margin: EdgeInsets.only(bottom:0),
              height:300,
              child: Stack(
             children: [
              Center(child: Container(
                  margin: EdgeInsets.only(top:0, ),
                  child: SvgPicture.asset(
                    'assets/bg2.svg',
                  ),
                )),

                  Center(child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
               Text("Отметить\nпосещение", textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color.fromRGBO(254, 220, 143, 1)),),
                                 Text("Нажмите для отображения\nQR-кода", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color:Colors.white),),
                               ],
                             ))
             ],
           )),
            Text("Мои посещения",style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,),
            Text("До бесплатного посещения: 9 визитов",style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                ),textAlign: TextAlign.start,),
          SliderTheme(
              data: SliderThemeData(
               trackHeight: 16,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)
                //thumbRadius: 16,
               // tooltipBackgroundColor: model.primaryColor,
              ),
              child: Slider(
                //interval: 2.0,
                min: 0,
                max: 10,
              /*  thumbIcon: Container(

                    alignment: Alignment.center,
                    child: Text(
                      "4",
                      style:  TextStyle(color: Colors.white, fontSize: 24),
                      textAlign: TextAlign.center,
                    )),*/
                //minorTicksPerInterval: 1,
                //showTicks: true,
                value: 4,
                onChanged: (dynamic values) {
                  setState(() {

                  });
                },
              )),
            SfSlider(
              labelPlacement: LabelPlacement.betweenTicks,
              max: 10.0,
             // stepSize: 1,

          activeColor: Palette().red,
              inactiveColor: Colors.grey.shade300,
            //  thumbShape: SfThumbShape(),
              thumbIcon: Container(

                  alignment: Alignment.center,
                  child: Text(
                    "4",
                    style:  TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  )),
              value: 4,
              onChanged: (dynamic values) {
                setState(() {

                });
              },
            )
          ],
        ))));
  }
}
