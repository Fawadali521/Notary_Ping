// ignore_for_file: prefer_collection_literals, file_names

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/WdigetToMarker.dart';
import 'package:notary_ping/src/modules/dashboard/home/utility/CustomNotaryItem.dart';
import 'package:notary_ping/src/modules/dashboard/notary_profile/NotaryProfile.dart';
import 'package:notary_ping/src/utility/MarkerImage.dart';
import 'package:notary_ping/src/utility/MarkerImageWithName.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

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
  List<Marker> markers = []; //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  late LatLng startLocation; //= const LatLng(34.611139, 72.4623079);
  LatLng endLocation = const LatLng(34.60205, 72.454015);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
  Uint8List? bytes;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => buildComplete());
    latlang.add(endLocation);
    setState(() {
      isLoding = true;
    });
    if (Platform.isAndroid) {
      checkLocationStatus();
    } else {
      getCurrentLocation();
    }

    super.initState();
  }

  List<Map<String, dynamic>> markersData = [
    {
      'position': const LatLng(34.60205, 72.454015),
      'key': GlobalKey(),
      'widget': const MarkerImageWithName(
        borderColor: Palette.greenColor,
        imgUrl: user1,
        name: "Mickle",
      ),
    },
    {
      'position': const LatLng(34.611139, 72.4623079),
      'key': GlobalKey(),
      'widget': const MarkerImageWithName(
        borderColor: Palette.redColor,
        imgUrl: user3,
        name: "Mic",
      ),
    }
  ];
  buildComplete() async {
    print("clll");
    RenderRepaintBoundary boundary = markersData[0]['key']
        .currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    bytes = byteData!.buffer.asUint8List();
    print("byttttttt==$bytes");
    setState(() {});
  }

  // add markers
  addMarker(List<LatLng> latLng) async {
    print("list of latlong ==>${latlang.length}");
    // bytes = await controller.capture();
    // print("buuuuuu==$bytes");
    for (int i = 0; i < latLng.length; i++) {
      markers.add(
        Marker(
            consumeTapEvents: true,
            markerId: MarkerId(latLng[i].toString()),
            position: latLng[i],
            icon: i == 0
                ? await const MarkerImage(
                    borderColor: Palette.redColor,
                    imgUrl: user3,
                    // name: "Smith",
                  ).toBitmapDescriptor()
                : BitmapDescriptor.fromBytes(bytes!, size: const Size(110, 120))
            // await const MarkerImageWithName(
            //     borderColor: Palette.greenColor,
            //     imgUrl: user1,
            //     name: "Mickle",
            //   ).toBitmapDescriptor(),
            ),
      );
    }
    setState(() {});
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
      print("${result.errorMessage}");
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
    print("start geting location");
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print("location get ==> $position");
      setState(() {
        startLocation = LatLng(position.latitude, position.longitude);
        latlang.add(startLocation);
        isLoding = false;
      });
      print("location get ==> $startLocation");
      addMarker(latlang);
    } catch (e) {
      print("Error in location get ==> $e");
      startLocation = const LatLng(34.611139, 72.4623079);
      latlang.add(startLocation);
      isLoding = false;
      setState(() {});
      addMarker(latlang);
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

  animateToMyLocation() {
    setState(() {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(startLocation, 16),
      );
    });
  }

  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: isLoding
          ? SingleChildScrollView(
              child: Column(
                // shrinkWrap: true,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 1.sh,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: RepaintBoundary(
                      key: markersData[0]['key'],
                      child: markersData[0]['widget'],
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: RepaintBoundary(
                      key: markersData[1]['key'],
                      child: markersData[1]['widget'],
                    ),
                  ),
                ],
              ),
            )
          : Stack(
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
                    : SafeArea(
                        top: false,
                        left: false,
                        right: false,
                        child: GoogleMap(
                          padding:
                              EdgeInsets.only(top: 0.04.sh, bottom: 0.03.sh),
                          myLocationEnabled: true, //set your location enable
                          zoomGesturesEnabled:
                              true, //enable Zoom in, out on map
                          // compassEnabled: true,
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
                      ),
                _topBar(),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: DraggableScrollableSheet(
                      initialChildSize: .43,
                      minChildSize: 0.11,
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 16.h,
                            ),
                            // controller: scrollController,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                // shrinkWrap: true,
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 20, vertical: 20),
                                // controller: scrollController,
                                children: [
                                  Divider(
                                    height: 1,
                                    color: Palette.dotColor,
                                    thickness: 3,
                                    endIndent: .34.sw,
                                    indent: .34.sw,
                                  ),
                                  // WidgetsToImageController to access widget

                                  // WidgetsToImage(
                                  //   controller: controller,
                                  //   child: const MarkerImageWithName(
                                  //     borderColor: Palette.greenColor,
                                  //     imgUrl: user1,
                                  //     name: "Mickle",
                                  //   ),
                                  // ),

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
                                        // InkWell(
                                        //   child: Row(
                                        //     children: [
                                        //       Padding(
                                        //         padding: const EdgeInsets.symmetric(
                                        //             horizontal: 5),
                                        //         child: Text(
                                        //           "See all".tr,
                                        //           style: TextStyles.bodySmall,
                                        //         ),
                                        //       ),
                                        //       const Icon(
                                        //         Icons.arrow_forward_ios_rounded,
                                        //         size: 14,
                                        //         color: Palette.greyTextColor,
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
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
                                    itemCount: 25, // total number of items
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
                  onTap: () async {
                    await getCurrentLocation();
                    animateToMyLocation();
                  },
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

  Widget _topBarNotary() {
    return Column(
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
              GestureDetector(
                onTap: () {},
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
                      adjustIcon,
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
    );
  }
}
