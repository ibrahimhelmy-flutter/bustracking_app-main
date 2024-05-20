import 'package:get/get.dart';

/// This class is used in the [busroute_item_widget] screen.

class BusrouteItemModel {
  Rx<String> busNameTxt = Rx("Bus 01");

  Rx<String> distanceFromYouTxt = Rx("2 Km away from you");

  Rx<String> comingFromTxt = Rx("Coming from manchester");

  Rx<String> busNumberTxt = Rx("15");

  Rx<String>? id = Rx("");

  String? busName;
  String? busLocation;
  String? busComingFrom;
  String? busNumber;
  String? routeFullName;

  BusrouteItemModel(
      {this.routeFullName,
      this.busName,
      this.busLocation,
      this.busComingFrom,
      this.busNumber});
}
