import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/recommended_routes_screen/models/recommended_routes_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// A controller class for the RecommendedRoutesScreen.
///
/// This class manages the state of the RecommendedRoutesScreen, including the
/// current recommendedRoutesModelObj
class RecommendedRoutesController extends GetxController {
  Rx<RecommendedRoutesModel> recommendedRoutesModelObj =
      RecommendedRoutesModel().obs;
  // HomeSearchController controller = Get.put(HomeSearchController());
  RxBool isTrue = false.obs;
  final fireStoreDB = //old style
      FirebaseFirestore.instance.collection('routes');

  int currnetBus = 0;
  String routeFullName = '';
  // var current = LatLng(controller.lat, controller.lng);
}
