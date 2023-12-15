// ignore_for_file: prefer_collection_literals, file_names

import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/constant/time_formate.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomRadio.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/TrackingItem.dart';
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
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  late LatLng startLocation; //= const LatLng(34.003040, 71.485524);
  // LatLng endLocation = const LatLng(33.996438, 71.461848);
  @override
  void initState() {
    setState(() {
      isLoding = true;
    });
    checkLocationStatus();
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        startLocation = LatLng(position.latitude, position.longitude);
        isLoding = false;
      });
    } catch (e) {
      // checkLocationStatus();
    }
  }

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
      body: isLoding
          ? const Center(
              child: CircularProgressIndicator(
                color: Palette.primaryColor,
              ),
            )
          : Stack(
              children: [
                GoogleMap(
                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition(
                    target: startLocation, //initial position
                    zoom: 16.0, //initial zoom level
                  ),
                  markers: markers, //markers to show on map
                  polylines: Set<Polyline>.of(polylines.values), //polylines
                  mapType: MapType.normal, //map type
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
                _topBar(),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 1.sw,
                    height: 0.6.sh,
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.4,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Palette.bgTextFeildColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      color: Palette.whiteColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderStyles.normal,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              transactionIcon,
                                              fit: BoxFit.contain,
                                              height: 24,
                                              width: 24,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                "Transaction history".tr,
                                                style: TextStyles.bodyMedium
                                                    .copyWith(
                                                  color: Palette.blackColor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 16,
                                              color: Palette.greyTextColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 16.h,
                                    ),
                                    child: SubmitButton(
                                      onTap: () {},
                                      title: "Send message".tr,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 20.h,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Palette.whiteColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Booking details".tr,
                                          style: TextStyles.titleLarge,
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Column(
                                              children: [
                                                SizedBox(height: 13),
                                                CustomRadio(
                                                    color:
                                                        Palette.primaryColor),
                                                Dash(
                                                  direction: Axis.vertical,
                                                  length: 45,
                                                  dashLength: 8,
                                                  dashThickness: 2,
                                                  dashColor:
                                                      Palette.primaryColor,
                                                ),
                                                CustomRadio(
                                                    color:
                                                        Palette.primaryColor),
                                                Dash(
                                                  direction: Axis.vertical,
                                                  length: 45,
                                                  dashLength: 8,
                                                  dashThickness: 2,
                                                  dashColor:
                                                      Palette.greyTextColor,
                                                ),
                                                CustomRadio(
                                                    color:
                                                        Palette.greyTextColor),
                                                Dash(
                                                  direction: Axis.vertical,
                                                  length: 45,
                                                  dashLength: 8,
                                                  dashThickness: 2,
                                                  dashColor:
                                                      Palette.greyTextColor,
                                                ),
                                                CustomRadio(
                                                    color:
                                                        Palette.greyTextColor),
                                              ],
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TrackingItem(
                                                  time: tackingDate
                                                      .format(DateTime.now()),
                                                  title: "Send booking request",
                                                ),
                                                TrackingItem(
                                                  time: tackingDate
                                                      .format(DateTime.now()),
                                                  title: "Request confirmed",
                                                ),
                                                TrackingItem(
                                                  time: tackingDate
                                                      .format(DateTime.now()),
                                                  title: "Booking time",
                                                ),
                                                TrackingItem(
                                                  time: tackingDate
                                                      .format(DateTime.now()),
                                                  title: "Finished booking",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SubmitButton(
                                          onTap: () {
                                            showCancelBookingAlert(context);
                                          },
                                          title: "Cancel booking".tr,
                                        ),
                                      ],
                                    ),
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

  Widget _topBar() {
    return Positioned(
      top: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: .4.sw, vertical: 16.h),
                child: const Text(
                  "Tracking",
                  style: TextStyles.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Palette.blackColor,
                      size: 16,
                    ),
                  ),
                ),
              )
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
