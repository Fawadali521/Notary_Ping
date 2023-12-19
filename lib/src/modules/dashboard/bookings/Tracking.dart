// ignore_for_file: prefer_collection_literals, file_names

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_dash/flutter_dash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/constant/time_formate.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomRadio.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/TrackingItem.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/WdigetToMarker.dart';
import 'package:notary_ping/src/modules/dashboard/message/Chat.dart';
import 'package:notary_ping/src/utility/MarkerImage.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:permission_handler/permission_handler.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  TrackingState createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  bool isLoding = false;
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  List<double> latitude = [];
  List<double> longitude = [];
  List<LatLng> latlang = [];
  List<Marker> markers = []; //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  late LatLng startLocation; //= const LatLng(34.611139, 72.4623079);
  LatLng endLocation = const LatLng(34.60205, 72.454015);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    latlang.add(endLocation);
    setState(() {
      isLoding = true;
    });
    // widgetToImage();
    if (Platform.isAndroid) {
      checkLocationStatus();
    } else {
      getCurrentLocation();
    }
    super.initState();
  }

  // add markers
  addMarker(List<LatLng> latLng) async {
    log("list of latlong ==>${latlang.length}");
    for (int i = 0; i < latLng.length; i++) {
      markers.add(
        Marker(
          consumeTapEvents: true,
          markerId: MarkerId(latLng[i].toString()),
          position: latLng[i],
          icon: i == 0
              ? await const MarkerImage(
                  borderColor: Palette.primaryColor,
                  imgUrl: user,
                ).toBitmapDescriptor()
              : await Image.asset(
                  startMakerIcon,
                  fit: BoxFit.contain,
                  height: 45,
                  width: 45,
                ).toBitmapDescriptor(),
        ),
      );
    }
    if (markers.length > 1) {
      getDirections(markers);
    }
  }

  // Future<BitmapDescriptor> getCustomIcon() async {
  //   return const MarkerImage(
  //     borderColor: Colors.red,
  //     imgUrl: user,
  //   ).toBitmapDescriptor();
  // }

  // This functions gets real road polyline routes
  getDirections(List<Marker> markers) async {
    List<LatLng> polylineCoordinates = [];
    List<PolylineWayPoint> polylineWayPoints = [];
    for (var i = 0; i < markers.length; i++) {
      polylineWayPoints.add(PolylineWayPoint(
        location:
            "${markers[i].position.latitude.toString()},${markers[i].position.longitude.toString()}",
        stopOver: true,
      ));
    }
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Constants.googleMapsApiKey, //GoogleMap ApiKey
      PointLatLng(markers.first.position.latitude,
          markers.first.position.longitude), //first added marker
      PointLatLng(markers.last.position.latitude,
          markers.last.position.longitude), //last added marker
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      log("${result.errorMessage}");
    }
    setState(() {});
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    setState(() {
      isLoding = false;
    });
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    log("start geting location");
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      log("location get ==> $position");
      setState(() {
        startLocation = LatLng(position.latitude, position.longitude);
        latlang.add(startLocation);
        isLoding = false;
      });
      log("location get ==> $startLocation");
      addMarker(latlang);
    } catch (e) {
      log("Error in location get ==> $e");
      startLocation = const LatLng(34.611139, 72.4623079);
      addMarker(latlang);
      // checkLocationStatus();
    }
  }

  //check location permission status
  Future<void> checkLocationStatus() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      getCurrentLocation();
    } else {
      await Permission.location.request();
      var newStatus = await Permission.location.status;
      if (newStatus.isGranted) {
        getCurrentLocation();
      } else {
        SnackBarToast(
          message: "Please allow location permission from app setting",
        );
        await openAppSettings();
        checkLocationStatus();
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      body: Stack(
        children: [
          isLoding
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 1.sh,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                )
              : GoogleMap(
                  padding: EdgeInsets.only(top: 0.04.sh, bottom: 0.07.sh),
                  myLocationEnabled: true, //set your location enable
                  // myLocationButtonEnabled: true,
                  // compassEnabled: true,
                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition(
                    target: startLocation, //initial position
                    zoom: 14.0, //initial zoom level
                  ),
                  polylines: Set<Polyline>.of(
                      polylines.values), //polylines to show directions
                  markers: markers.toSet(), //markers to show on map
                  // mapType: MapType.normal, //map type
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
          topBar(),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 1.sw,
              height: 0.5.sh,
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                minChildSize: 0.15,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      controller: scrollController,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 0,
                              color: Palette.dotColor,
                              thickness: 3,
                              endIndent: .34.sw,
                              indent: .34.sw,
                            ),
                            SizedBox(height: 12.h),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 20.w),
                            //   child: MaterialButton(
                            //     onPressed: () {},
                            //     elevation: 0,
                            //     color: Palette.whiteColor,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderStyles.normal,
                            //     ),
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           vertical: 12.h),
                            //       child: Row(
                            //         children: [
                            //           Image.asset(
                            //             transactionIcon,
                            //             fit: BoxFit.contain,
                            //             height: 24,
                            //             width: 24,
                            //           ),
                            //           Padding(
                            //             padding:
                            //                 const EdgeInsets.symmetric(
                            //                     horizontal: 5),
                            //             child: Text(
                            //               "Transaction history".tr,
                            //               style: TextStyles.bodyMedium
                            //                   .copyWith(
                            //                 color: Palette.blackColor,
                            //               ),
                            //               textAlign: TextAlign.center,
                            //             ),
                            //           ),
                            //           const Spacer(),
                            //           const Icon(
                            //             Icons.arrow_forward_ios_rounded,
                            //             size: 16,
                            //             color: Palette.greyTextColor,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Booking details".tr,
                                style: TextStyles.titleLarge,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    SizedBox(height: 13),
                                    CustomRadio(color: Palette.primaryColor),
                                    Dash(
                                      direction: Axis.vertical,
                                      length: 45,
                                      dashLength: 8,
                                      dashThickness: 2,
                                      dashColor: Palette.primaryColor,
                                    ),
                                    CustomRadio(color: Palette.primaryColor),
                                    Dash(
                                      direction: Axis.vertical,
                                      length: 45,
                                      dashLength: 8,
                                      dashThickness: 2,
                                      dashColor: Palette.greyTextColor,
                                    ),
                                    CustomRadio(color: Palette.greyTextColor),
                                    Dash(
                                      direction: Axis.vertical,
                                      length: 45,
                                      dashLength: 8,
                                      dashThickness: 2,
                                      dashColor: Palette.greyTextColor,
                                    ),
                                    CustomRadio(color: Palette.greyTextColor),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TrackingItem(
                                      time: tackingDate.format(DateTime.now()),
                                      title: "Send booking request",
                                    ),
                                    TrackingItem(
                                      time: tackingDate.format(DateTime.now()),
                                      title: "Request confirmed",
                                    ),
                                    TrackingItem(
                                      time: tackingDate.format(DateTime.now()),
                                      title: "Booking time",
                                    ),
                                    TrackingItem(
                                      time: tackingDate.format(DateTime.now()),
                                      title: "Finished booking",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SubmitButton(
                                  onTap: () {
                                    showCancelBookingAlert(context);
                                  },
                                  title: "Cancel booking".tr,
                                ),
                                SizedBox(width: 12.w),
                                const Spacer(),
                                SubmitButton(
                                  onTap: () => Get.to(() => const Chat()),
                                  title: "Send message".tr,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
  Widget topBar() {
    return Positioned(
      top: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Row(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Palette.blackColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: .4.sw, vertical: 8.h),
                      child: const Text(
                        "Tracking",
                        style: TextStyles.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

showCancelBookingAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Palette.whiteColor,
          surfaceTintColor: Palette.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 14),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 5),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 45,
                backgroundColor: Palette.lightRedColor,
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: Palette.redColor,
                  child: Icon(
                    Icons.close,
                    color: Palette.whiteColor,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Cancel booking".tr,
                style: TextStyles.headlineLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 30, left: 20, right: 20),
                child: Text(
                  "Are you sure do you want to cancel this booking".tr,
                  style: TextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: SubmitButton(
                  onTap: () {},
                  title: "Cancel booking".tr,
                ),
              ),
            ],
          ),
        );
      });
}
