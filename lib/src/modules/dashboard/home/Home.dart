// ignore_for_file: prefer_collection_literals, file_names

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notary_ping/index.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:label_marker/label_marker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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
                SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: GoogleMap(
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
                  ),
                ),
                _topBar(),
              ],
            ),
    );
  }

  Positioned _topBar() {
    return Positioned(
      top: 0,
      child: Column(
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Search".tr,
                    prefixIcon: searchIcon,
                    prefixIconColor: Palette.greyTextColor,
                    borderRadius: BorderStyles.searchTextField,
                    fillColor: Palette.whiteColor,
                    borderColor: Palette.greyTextColor.withOpacity(0.5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Palette.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Palette.greyTextColor.withOpacity(0.5),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          color: Palette.blackColor,
                          size: 24,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Palette.primaryColor,
                            child: Text(
                              "5",
                              style: TextStyles.bodySmall.copyWith(
                                color: Palette.whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => getCurrentLocation(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Palette.whiteColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Palette.greyTextColor.withOpacity(0.5),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        mapsIcon,
                        height: 24,
                        width: 24,
                        color: Palette.blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
