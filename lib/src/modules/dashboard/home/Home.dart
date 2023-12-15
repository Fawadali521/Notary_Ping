// ignore_for_file: prefer_collection_literals, file_names

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/modules/dashboard/notary_profile/NotaryProfile.dart';
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

  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 1.sw,
                    height: 0.45.sh,
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.65,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Palette.whiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: ListView.builder(
                            controller: scrollController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Divider(
                                    height: 0,
                                    color: Palette.dotColor,
                                    thickness: 3,
                                    endIndent: .34.sw,
                                    indent: .34.sw,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Available notaries".tr,
                                          style: TextStyles.titleLarge,
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  "See all".tr,
                                                  style: TextStyles.bodySmall,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 14,
                                                color: Palette.greyTextColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: width / (height / 1.7),
                                    ),

                                    padding: EdgeInsets.zero,
                                    itemCount: 8, // total number of items
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(() => NotaryProfile());
                                        },
                                        child: CustomNotaryItem(
                                          isOnline: index.isOdd,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 30.h),
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
                        Image.asset(
                          bellIcon,
                          color: Palette.blackColor,
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          right: 0,
                          top: 2,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Palette.primaryColor,
                            child: Text(
                              "5",
                              style: TextStyles.bodyLarge.copyWith(
                                color: Palette.whiteColor,
                                fontSize: 10,
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

class CustomNotaryItem extends StatelessWidget {
  const CustomNotaryItem({
    super.key,
    this.isOnline,
  });

  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: .18.sw,
            width: .18.sw,
            child: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        user,
                        fit: BoxFit.cover,
                        height: .18.sw,
                        width: .18.sw,
                      ),
                    ),
                  ),
                  isOnline == true
                      ? const Positioned(
                          right: 6,
                          child: CircleAvatar(
                            backgroundColor: Palette.greenColor,
                            radius: 6,
                          ),
                        )
                      : isOnline == false
                          ? const Positioned(
                              right: 6,
                              child: CircleAvatar(
                                backgroundColor: Palette.greyShadeTextColor,
                                radius: 6,
                              ),
                            )
                          : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            "Mickle".length > 10 ? "${"Mickle".substring(0, 7)}..." : "Mickle",
            style: TextStyles.bodyMedium,
          ),
        ),
      ],
    );
  }
}
