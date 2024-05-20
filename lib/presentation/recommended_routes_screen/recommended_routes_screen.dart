import 'dart:math';

import '../home_search_screen/controller/home_search_controller.dart';
import '../recommended_routes_screen/widgets/busroute_item_widget.dart';
import 'controller/recommended_routes_controller.dart';
import 'models/busroute_item_model.dart';
import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/widgets/app_bar/appbar_image.dart';
import 'package:bustrackingapp/widgets/app_bar/appbar_title.dart';
import 'package:bustrackingapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecommendedRoutesScreen extends GetWidget<RecommendedRoutesController> {
  RecommendedRoutesScreen({Key? key}) : super(key: key);
  var controller = Get.find<RecommendedRoutesController>();
  HomeSearchController controllerSearch = Get.put(HomeSearchController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    Random rondam = Random();
    return Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
            width: double.maxFinite,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  padding: getPadding(top: 19, bottom: 19),
                  decoration: AppDecoration.outlineOnPrimaryContainer,
                  child: CustomAppBar(
                      leadingWidth: getHorizontalSize(36),
                      leading: AppbarImage(
                          svgPath: ImageConstant.imgArrowleft,
                          margin: getMargin(left: 16, top: 4, bottom: 2),
                          onTap: () {
                            onTapArrowleftone();
                          }),
                      title: AppbarTitle(
                          text: "msg_recommended_routes".tr,
                          margin: getMargin(left: 16)))),
              Expanded(
                  child: Padding(
                padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
                child: StreamBuilder(
                  stream: controller.fireStoreDB
                      // .where('route_long_name',
                      //     isEqualTo: controllerSearch.actiononeController.text)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: const Text(
                        "Something went wrong...",
                        style: TextStyle(fontSize: 20),
                      ));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          SizedBox(
                            height: mediaQueryData.size.width / 20,
                          ),
                          Text(
                            'loading please wait..',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ));
                    }
                    var data = snapshot.data!.docs;
                    return ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          if (controller.isTrue.value) {
                            return SizedBox(height: getVerticalSize(16));
                          }
                          return SizedBox(height: getVerticalSize(0));
                        },
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          // String id = data[index].id;
                          String busNumber = data[index]['route_short_name'];
                          String busName = 'Bus ${index + 1}';
                          String routeFullName = data[index]['route_long_name'];
                          String busTrip = data[index]['route_long_name'];
                          // controller.tripsTime(id);
                          if (controllerSearch.actiononeController.text
                                  .trim() !=
                              '') {
                            if (busTrip.toString().contains('-')
                                ? busTrip
                                        .toString()
                                        .split(
                                          '-',
                                        )[1]
                                        .toString()
                                        .toLowerCase()
                                        .trim() ==
                                    controllerSearch.actiononeController.text
                                        .toLowerCase()
                                        .trim()
                                : busTrip
                                        .toString()
                                        .split(
                                          '/',
                                        )[0]
                                        .toString()
                                        .toLowerCase()
                                        .trim() ==
                                    controllerSearch.actiononeController.text
                                        .toLowerCase()
                                        .trim()) {
                              controller.isTrue.value = true;

                              // busTrip.toString().contains('-')
                              //     ? print(busTrip.toString())
                              //     : print(busTrip.toString());
                            } else {
                              controller.isTrue.value = false;
                            }
                          } else {
                            controller.isTrue.value = true;
                          }

                          // print('${data[index]['route_long_name'].toString()}');

                          // String busLocation = data[index]['route_long_name'];
                          var markCheckfirst = busTrip.toString().contains('-')
                              ? busTrip.toString().split('-')[0].toString()
                              : busTrip.toString().split(
                                    '/',
                                  )[0];
                          var markChecksec = busTrip.toString().contains('-')
                              ? busTrip.toString().split('-')[1].toString()
                              : busTrip.toString().split(
                                    '/',
                                  )[0];
                          return controller.isTrue.value
                              ? BusrouteItemWidget(
                                  BusrouteItemModel(
                                      // busLocation: data[index]['stop_lat'].toString(),

                                      busNumber: busNumber,
                                      busName: busName,
                                      routeFullName:
                                          'New York to $markChecksec',
                                      busComingFrom:
                                          'Comming from $markCheckfirst',
                                      busLocation:
                                          '${rondam.nextInt(8) + 1} Km away from you'),
                                  onTapBusroute: () {
                                  controller.currnetBus = index + 1;
                                  controller.routeFullName = busTrip;

                                  // data.map((e) {
                                  //   controller.getTrip(
                                  //       snapshot.data!.docs[index].toString());
                                  // });

                                  // var routeId = controller.fireStoreDBTrip
                                  //     .doc()
                                  //     .get() ;
                                  // print();
                                  onTapBusroute();
                                })
                              : Container();
                        });
                  },
                ),
                // child: Obx(() => ListView.separated(
                //     padding: EdgeInsets.zero,
                //     physics: BouncingScrollPhysics(),
                //     shrinkWrap: true,
                //     separatorBuilder: (context, index) {
                //       return SizedBox(height: getVerticalSize(16));
                //     },
                //     itemCount: controller.recommendedRoutesModelObj.value
                //         .busrouteItemList.value.length,
                //     itemBuilder: (context, index) {
                //       BusrouteItemModel model = controller
                //           .recommendedRoutesModelObj
                //           .value
                //           .busrouteItemList
                //           .value[index];
                //       return BusrouteItemWidget(model, onTapBusroute: () {
                //         onTapBusroute();
                //       });
                //     })),
              ))
            ])));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the busRoutesScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the busRoutesScreen.
  onTapBusroute() {
    Get.toNamed(
      AppRoutes.busRoutesScreen,
    );
  }
}
