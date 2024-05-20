import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/map_screen/models/map_model.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// A controller class for the MapScreen.
///
/// This class manages the state of the MapScreen, including the
/// current mapModelObj
class MapController extends GetxController {
  Rx<MapModel> mapModelObj = MapModel(mapFrom: 0, mapTo: 0).obs;

  GoogleMapController? mapsController;
  RxBool iscompleted = false.obs;

  @override
  void onClose() {
    super.onClose();
    mapsController!.dispose();
  }

  var latTo = 0.0.obs;
  var lngTo = 0.0.obs;
  Future<void> geocodingApi(String to) async {
    const String googelApiKey = 'AIzaSyBVgvpedaj_6YtcZfTxI7UXzg0XhNqWc_Y';
    final bool isDebugMode = true;
    final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);

    final searchResultsTo = await api.search(
      to,
      language: 'en',
    );

    var ResultsTo = searchResultsTo.results.elementAt(0).geometry!.location;
    latTo.value = ResultsTo.lat;
    lngTo.value = ResultsTo.lng;
    iscompleted.value = true;
  }
}
