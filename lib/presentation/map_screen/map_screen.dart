// ignore_for_file: must_be_immutable

import 'package:bustrackingapp/presentation/home_page/controller/home_controller.dart';
import 'package:bustrackingapp/presentation/map_screen/controller/map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../recommended_routes_screen/controller/recommended_routes_controller.dart';
import '../share_ride_screen/share_ride_screen.dart';

class MapScreen extends StatefulWidget {
  bool? isShare;
  MapScreen({Key? key, this.isShare}) : super(key: key);
  var controller = Get.find<RecommendedRoutesController>();
  var controllerMap = Get.find<MapController>();
  HomeController controllerHome = Get.put(HomeController());
  RecommendedRoutesController controllerRecommendedRoutes =
      Get.put(RecommendedRoutesController());

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool share = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (share) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: appTheme.whiteA700,
          barrierColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(getHorizontalSize(32)),
                  topLeft: Radius.circular(getHorizontalSize(32)))),
          builder: (context) {
            return ShareRideScreen();
          },
        );
      });
    }
  }

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints(
      {required double sourceLat,
      required double sourceLng,
      required double destinationLat,
      required double destinationLng}) async {
    // polylineCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      travelMode: TravelMode.driving,
      'AIzaSyBVgvpedaj_6YtcZfTxI7UXzg0XhNqWc_Y', // Your Google Map Key
      PointLatLng(sourceLat, sourceLng),
      PointLatLng(destinationLat, destinationLng),
    );
    if (result.points.isNotEmpty) {
      polylineCoordinates = [];
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      });
    }
    setState(() {});
  }
  // String currentLocaionApi =
  //     'https://maps.googleapis.com/maps/api/staticmap?size=600x400&path=enc%3AohqfIc_jpCkE%7DCx%40mJdDa%5BbD%7BM%7D%40e%40_MgKiQuVOoFlF%7DVnCnBn%40aDlDkN%7DDwEt%40%7DM%7DB_TjBy%7C%40lEgr%40lMa%60BhSi%7C%40%7COmuAxb%40k%7BGh%5E_%7BFjRor%40%7CaAq%7DC~iAomDle%40i%7BA~d%40ktBbp%40%7DqCvoA%7DjHpm%40uuDzH%7Dm%40sAg%7DB%60Bgy%40%7CHkv%40tTsxAtCgl%40aBoeAwKwaAqG%7B%5CeBc_%40p%40aZx%60%40gcGpNg%7CBGmWa%5CgpFyZolF%7BFgcDyPy%7CEoK_%7BAwm%40%7BqFqZaiBoNsqCuNq%7BHk%60%40crG%7B%5DqkBul%40guC%7BJ%7D%5DaNo%7B%40waA%7DmFsLc_%40_V%7Dh%40icAopBcd%40i_A_w%40mlBwbAiiBmv%40ajDozBibKsZ%7DvAkLm%5DysAk%7DCyr%40i%60BqUkp%40mj%40uoBex%40koAk_E_hG%7B%60Ac%7DAwp%40soAyk%40ogAml%40%7Bg%40qKsNeJw%5DeuA%7D%60Fkm%40czBmK%7Bg%40wCed%40b%40_e%40dT%7BgCzx%40csJrc%40ejFtGi%60CnB_pFhCa%60Gw%40%7Du%40wFwaAmP%7BoA%7Dj%40etBsRm_AiGos%40aCyy%40Lic%40tFohA~NeoCvC_%7CAWm~%40gb%40w~DuLex%40mUk_Ae_%40o_Aol%40qmAgv%40_%7DAaf%40qhAkMcl%40mHwn%40iCuq%40Nqi%40pF%7D%7CE~CyiDmFkgAoUedAcb%40ku%40ma%40cl%40mUko%40sLwr%40mg%40awIoA_aApDe~%40dKytAfw%40kyFtCib%40%7DA%7Bj%40kd%40usBcRgx%40uFwb%40%7BCulAjJmbC~CumAuGwlA_%5Du_C_PqyB%7BI%7DiAwKik%40%7DUcr%40ya%40up%40%7DkB%7DoCoQ%7Da%40aMyf%40an%40wjEimBuwKiYybC%7DLuyBoJ%7DhBuMieAwd%40i%7BB%7B~%40g%60D_Si%5Dsi%40%7Bk%40cPeSuH_T%7DNct%40kNcmC_Gyr%40mq%40_~AkmA%7DkCksByrE_N%7Bc%40oAcs%40%60J%7Bi%40t%7DByaHxNqt%40tGgxA%7CJ%7BkGeJ_aDsQi_HmFwuAmI%7BdA_XijByFgv%40%7DAiwBxDocAdM%7BlAtSmcAfUmaAptAmbGh~AcvGbwBc%7DHff%40shB~Isp%40nQu%7DB%60UsuCbBok%40l%40%7DzAhIwbA~OuaAnYwp%40rYwe%40%7CNke%40zc%40%7BhBrOwRdo%40sf%40xNaTb_%40uy%40ta%40k~%40xTap%40hl%40uiCre%40unHlIi~AlFsc%40rEkk%40aAce%40mL%7DlAwPcyB_GohBzDsqAtMqtA~h%40weDtFkd%40Bi%60%40_XwfEdAag%40dEkM%60%40zAqApJef%40%7BP_o%40sYys%40ai%40yf%40_j%40y_%40oi%40mVi%5EmFqSwAiPtDuQbc%40_nAtZyaAlEkc%40r%40eq%40%7CAo%5BrTwcAtVuz%40vQ%7Dd%40%7CPmb%40xT%7B%5CzZyd%40jG%7BRzL%7Dh%40jr%40ov%40rFiImFqPiD%7BJ&key=AIzaSyBVgvpedaj_6YtcZfTxI7UXzg0XhNqWc_Y';

  static LatLngBounds getLatLngBounds(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (final latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    //
    double lat = widget.controllerMap.latTo.value;
    double lng = widget.controllerMap.lngTo.value;
    var current = LatLng(widget.controllerHome.lat, widget.controllerHome.lng);
    var toGo = LatLng(lat, lng);

    getPolyPoints(
      sourceLat: widget.controllerHome.lat,
      sourceLng: widget.controllerHome.lng,
      destinationLat: widget.controllerMap.latTo.value,
      destinationLng: widget.controllerMap.lngTo.value,
    );
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.whiteA700,
        body: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
            ),
            child: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: getPadding(top: 20, bottom: 20),
                            decoration: AppDecoration.outlineOnPrimaryContainer1
                                .copyWith(color: appTheme.whiteA700),
                            child: CustomAppBar(
                                leadingWidth: getHorizontalSize(36),
                                leading: AppbarImage(
                                    svgPath: ImageConstant.imgArrowleft,
                                    margin:
                                        getMargin(left: 16, top: 3, bottom: 3),
                                    onTap: () {
                                      onTapBus01();
                                    }),
                                title: AppbarTitle(
                                    text: 'Bus ${widget.controller.currnetBus}',
                                    margin: getMargin(left: 16)))),
                      ),

                      Expanded(
                        flex: 9,
                        child: Stack(
                          children: [
                            Obx(
                              () => widget.controllerMap.iscompleted.value ==
                                      true
                                  ? GoogleMap(
                                      onMapCreated: (con) {
                                        widget.controllerMap.mapsController =
                                            con;

                                        setState(() {});
                                        // widget.controllerHomePage.mapsController = con;
                                      },
                                      initialCameraPosition: CameraPosition(
                                        target: current,
                                        zoom: 10,
                                      ),
                                      polylines: {
                                        Polyline(
                                          polylineId: const PolylineId("route"),
                                          points: polylineCoordinates,
                                          color: Colors.blueAccent,
                                          width: 6,
                                        ),
                                      },
                                      zoomControlsEnabled: false,
                                      markers: {
                                        Marker(
                                            icon: BitmapDescriptor
                                                .defaultMarkerWithHue(
                                                    BitmapDescriptor.hueAzure),
                                            markerId: MarkerId(
                                              'mapfrom',
                                            ),
                                            position: current),
                                        Marker(
                                            markerId: MarkerId(
                                              'mapto',
                                            ),
                                            position: toGo),
                                      },
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(
                                            height:
                                                mediaQueryData.size.width / 20,
                                          ),
                                          Text(
                                            'loading please wait..',
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  var current = LatLng(
                                      widget.controllerHome.lat,
                                      widget.controllerHome.lng);
                                  var toGo = LatLng(
                                      widget.controllerMap.latTo.value,
                                      widget.controllerMap.lngTo.value);

                                  widget.controllerMap.mapsController!
                                      .animateCamera(
                                          CameraUpdate.newLatLngBounds(
                                              getLatLngBounds([current, toGo]),
                                              70));
                                },
                                child: Container(
                                  margin: getMargin(bottom: 20, right: 10),
                                  height: getVerticalSize(54),
                                  width: getVerticalSize(54),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: theme.colorScheme.primary,
                                  ),
                                  child: Center(
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgGroup38172,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      // : Container(
                      //     alignment: Alignment.center,
                      //     color: Colors.white,
                      //     height: double.infinity,
                      //     width: double.infinity,
                      //     child: Text(
                      //       'Map Loading...',
                      //       style: TextStyle(
                      //           fontSize: 35, color: Colors.grey),
                      //     ),
                      //   ),

                      // Expanded(
                      //   flex: 1,
                      //   child: Container(
                      //       // height: getVerticalSize(784),
                      //       width: double.maxFinite,
                      //       padding: getPadding(
                      //           // left: 106, top: 230, right: 106, bottom: 194),
                      //           left: 106, top: 194, right: 106, bottom: 194),
                      //       // decoration: BoxDecoration(
                      //       //     color: appTheme.whiteA700,
                      //       //     image: DecorationImage(
                      //       //         image: AssetImage(ImageConstant.imgHomesearchfilled),
                      //       //         fit: BoxFit.cover)
                      //       // ),
                      //       child: Stack(
                      //           alignment: Alignment.bottomLeft,
                      //           children: [
                      //             CustomImageView(
                      //                 svgPath: ImageConstant.imgVector2,
                      //                 height: getVerticalSize(249),
                      //                 width: getHorizontalSize(116),
                      //                 alignment: Alignment.bottomCenter,
                      //                 margin: getMargin(bottom: 44)),
                      //             CustomIconButton(
                      //                 height: getSize(50),
                      //                 width: getSize(50),
                      //                 padding: getPadding(all: 13),
                      //                 decoration: IconButtonStyleHelper
                      //                     .outlineBlackTL25,
                      //                 alignment: Alignment.bottomLeft,
                      //                 child: CustomImageView(
                      //                     svgPath: ImageConstant.imgTrophy)),
                      //             CustomIconButton(
                      //                 height: getSize(34),
                      //                 width: getSize(34),
                      //                 margin: getMargin(top: 71, right: 67),
                      //                 padding: getPadding(all: 8),
                      //                 alignment: Alignment.topRight,
                      //                 child: CustomImageView(
                      //                     svgPath: ImageConstant
                      //                         .imgSignalBlack900))
                      //           ])),
                      // )
                    ]))));
  }

  /// Navigates to the busRoutesScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the busRoutesScreen.
  onTapBus01() {
    Get.back();
    // Get.toNamed(
    //   AppRoutes.busRoutesScreen,
    // );
  }
}
