// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webapp_amrm/app/pages/home/home_controller.dart';
import 'package:webapp_amrm/data/constants.dart';
import 'package:webapp_amrm/app/widgets/CustomBottomNavigationBar.dart';
import 'package:webapp_amrm/app/widgets/CustomButton.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController c = Get.put(HomeController());
  Widget percentWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularPercentIndicator(
          radius: 100,
          lineWidth: 25,
          animation: true,
          arcType: ArcType.HALF,
          percent: 0.5,
          arcBackgroundColor: Colors.grey.shade200,
          startAngle: 270,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: ConstantColors.graphicsPrimaryColor,
        ),
        SizedBox(
          height: 90,
          width: 220,
          // color:
          //     Colors.red.withOpacity(0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "\$3,400",
                    style: Get.textTheme.headline5!
                        .copyWith(color: ConstantColors.secondFont),
                  ),
                  Text(
                    'Disponible',
                    style: Get.textTheme.titleSmall!
                        .copyWith(color: ConstantColors.secondFont),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Inicia\nPeriodo",
                    style: Get.textTheme.caption!.copyWith(
                      fontSize: 11,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "13 Ago\nFecha corte",
                    style: Get.textTheme.caption!.copyWith(
                      fontSize: 11,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
          color: ConstantColors.primaryColor,
          child: SafeArea(
            bottom: false,
            child: Container(
              color: Colors.white,
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: ConstantColors.primaryColor,
                  expandedHeight: 500,
                  floating: true,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesome.bell,
                        color: ConstantColors.thirdFont,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesome.menu),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.only(bottom: 10, left: 16, right: 16),
                          child: Text(
                            "21 de Abril, 2020",
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: ConstantColors.thirdFont,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.only(bottom: 10, left: 16, right: 16),
                          child: Obx(() {
                            return Text(
                              "Bienvenida, ${c.fullname.value}",
                              style: Get.textTheme.headline5!.copyWith(
                                color: ConstantColors.thirdFont,
                              ),
                            );
                          }),
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 180,
                                  color: ConstantColors.primaryColor,
                                ),
                                Container(
                                  height: 210,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Container(
                              height: 335,
                              width: Get.width,
                              margin: EdgeInsets.only(
                                top: 26,
                                left: 26,
                                right: 26,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.info_outline,
                                          color: ConstantColors.primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          "Periodo actual\n01 al 15 de agosto",
                                          textAlign: TextAlign.center,
                                          style: Get.textTheme.titleMedium!
                                              .copyWith(
                                            height: 1.2,
                                            color: ConstantColors.primaryFont,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 160,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: SingleChildScrollView(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            child: percentWidget()),
                                      ),
                                      CustomButton(
                                        text: "Retirar un monto",
                                        width: 200,
                                        onTap: () {},
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  height: 200,
                  width: Get.width,
                  margin:
                      EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(3, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.info_outline,
                          color: ConstantColors.primaryColor,
                          size: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Resumen periodo actual",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium!.copyWith(
                            height: 1.2,
                            color: ConstantColors.primaryFont,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: ConstantColors.primaryColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Restan 4 días para retirar",
                                      textAlign: TextAlign.center,
                                      style:
                                          Get.textTheme.titleMedium!.copyWith(
                                        height: 1.2,
                                        color: ConstantColors.primaryFont,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_upward_rounded,
                                    color: ConstantColors.primaryColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Tienes 3 retiros disponibles",
                                      textAlign: TextAlign.center,
                                      style:
                                          Get.textTheme.titleMedium!.copyWith(
                                        height: 1.2,
                                        color: ConstantColors.primaryFont,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: ConstantColors.primaryColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "\$12,727 salario trabajado",
                                      textAlign: TextAlign.center,
                                      style:
                                          Get.textTheme.titleMedium!.copyWith(
                                        height: 1.2,
                                        color: ConstantColors.primaryFont,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                SliverToBoxAdapter(
                    child: Container(
                  height: 250,
                  width: Get.width,
                  margin:
                      EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(3, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.info_outline,
                          color: ConstantColors.primaryColor,
                          size: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Ya conoces los beneficios de monto",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium!.copyWith(
                            height: 1.2,
                            color: ConstantColors.primaryFont,
                          ),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        height: 150,
                        width: 150,
                        child: Image.asset(ConstantImages.onePng),
                      ),
                    ],
                  ),
                )),
                SliverToBoxAdapter(
                    child: Container(
                  height: 250,
                  width: Get.width,
                  margin:
                      EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(3, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.info_outline,
                          color: ConstantColors.primaryColor,
                          size: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Beneficios para todos",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium!.copyWith(
                            height: 1.2,
                            color: ConstantColors.primaryFont,
                          ),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        height: 150,
                        width: 150,
                        child: Image.asset(ConstantImages.twoPng),
                      ),
                    ],
                  ),
                )),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
