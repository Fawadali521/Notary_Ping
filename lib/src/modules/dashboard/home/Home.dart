// ignore_for_file: file_names

import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/WdigetToMarker.dart';
import 'package:notary_ping/src/modules/dashboard/home/utility/CustomNotaryItem.dart';
import 'package:notary_ping/src/modules/dashboard/notary_profile/NotaryProfile.dart';
import 'package:notary_ping/src/modules/dashboard/notification/Notification.dart';
import 'package:notary_ping/src/utility/maps_utility/MarkerImage.dart';
import 'package:notary_ping/src/utility/maps_utility/MarkerImageWithName.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

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
  double paddingBottom = 0.31;
  double sizeDragble = 0.31;
  final FocusNode _focusNode = FocusNode();
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();
  bool isLodingNotary = false;
  @override
  void initState() {
    _focusNode.addListener(_handleFocusChange);
    setState(() {
      isLoding = true;
      isLodingNotary = true;
    });
    // print("calll one 2");
    // WidgetsBinding.instance.addPostFrameCallback((_) => buildComplete());
    // print("calll one 3");
    if (Platform.isAndroid) {
      checkLocationStatus();
    } else {
      getStartPage();
    }

    super.initState();
    // print("calll one 4");
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      _scrollController.animateTo(.87,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
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
    await Future.delayed(const Duration(milliseconds: 500), () {});
    try {
      RenderRepaintBoundary boundary = markersData[0]['key']
          .currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      bytes = byteData!.buffer.asUint8List();

      setState(() {});
    } catch (e) {
      log("Error in build ==>$e");
      buildComplete();
    }
  }

  // add markers
  addMarker(List<LatLng> latLng) async {
    await buildComplete();
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
                ).toBitmapDescriptor()
              : BitmapDescriptor.fromBytes(
                  bytes!,
                  size: const Size(200, 190),
                ),
        ),
      );
    }
    setState(() {
      isLoding = false;
      isLodingNotary = false;
    });
  }

  Future<void> getStartPage() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // print("start geting location");
    try {
      // Position position = await Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.high,
      // );
      // log("location get ==> $position");
      log("Start in set page");
      latlang.clear();
      latlang.add(endLocation);
      startLocation = const LatLng(34.611139, 72.4623079);
      // startLocation = LatLng(position.latitude, position.longitude);
      latlang.add(startLocation);
      // setState(() {});
      log("location get ==> $startLocation");
      addMarker(latlang);
    } catch (e) {
      log("Error in set start  ==> $e");
      latlang.clear();
      latlang.add(endLocation);
      startLocation = const LatLng(34.611139, 72.4623079);
      latlang.add(startLocation);
      // setState(() {});
      addMarker(latlang);
      // checkLocationStatus();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      log("location get ==> $position");
      startLocation = LatLng(position.latitude, position.longitude);
      setState(() {});
    } catch (e) {
      log("error in current location get ==> $e");
    }
  }

  Future<void> checkLocationStatus() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      getStartPage();
    } else {
      await Permission.location.request();
      var newStatus = await Permission.location.status;
      if (newStatus.isGranted) {
        getStartPage();
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
  bool sheetCollapsed = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          isLoding
              ? Stack(
                  // shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 190,
                      child: RepaintBoundary(
                        key: markersData[0]['key'],
                        child: markersData[0]['widget'],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 190,
                      child: RepaintBoundary(
                        key: markersData[1]['key'],
                        child: markersData[1]['widget'],
                      ),
                    ),
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
                  ],
                )
              : SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: paddingBottom.sh),
                    child: GoogleMap(
                      padding: EdgeInsets.only(top: 0.04.sh, bottom: 0.03.sh),
                      myLocationEnabled: true, //set your location enable
                      myLocationButtonEnabled:
                          false, //enable your location button on map
                      zoomGesturesEnabled: true, //enable Zoom in, out on map
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
                ),
          SizedBox(
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (DraggableScrollableNotification dSNotification) {
                // Check if the sheet is fully expanded
                if (dSNotification.extent >= 0.87) {
                  setState(() {
                    sheetCollapsed = true;
                  });
                }
                // Check if the sheet is collapsed or not fully expanded
                else if (dSNotification.extent < .87) {
                  if (dSNotification.extent < .6) {
                    paddingBottom = dSNotification.extent - 0.10;
                  }
                  // Update the variable for not fully expanded state
                  setState(() {
                    sheetCollapsed = false;
                  });
                }

                return true; // Return true to indicate the notification is handled
              },
              child: DraggableScrollableSheet(
                controller: _scrollController,

                initialChildSize: 0.43, // Set the initial size to 0.4
                maxChildSize: 0.87, // Maximum size when fully expanded
                minChildSize: 0.13,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: (sheetCollapsed == true)
                          ? null
                          : const BorderRadius.only(
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
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            if (sheetCollapsed != true)
                              Divider(
                                height: 1,
                                color: Palette.dotColor,
                                thickness: 3,
                                endIndent: .34.sw,
                                indent: .34.sw,
                              ),
                            // const MarkerImageWithName(
                            //   borderColor: Palette.greenColor,
                            //   imgUrl: user1,
                            //   name: "Mickle",
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
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
                            isLodingNotary
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: width / (height / 2),
                                      ),
                                      padding: EdgeInsets.zero,
                                      itemCount: userImages
                                          .length, // total number of items
                                      itemBuilder: (context, index) {
                                        return Align(
                                          alignment: Alignment.topCenter,
                                          child: SizedBox(
                                            height: .18.sw,
                                            width: .18.sw,
                                            child: Center(
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.asset(
                                                        userImages[index],
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
                                                            backgroundColor:
                                                                Palette
                                                                    .greenColor,
                                                            radius: 6,
                                                          ),
                                                        )
                                                      : isOnline == false
                                                          ? const Positioned(
                                                              right: 6,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Palette
                                                                        .greyShadeTextColor,
                                                                radius: 6,
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: width / (height / 1.7),
                                    ),

                                    padding: EdgeInsets.zero,
                                    itemCount: userImages
                                        .length, // total number of items
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(() => const NotaryProfile());
                                        },
                                        child: CustomNotaryItem(
                                          isOnline: index.isOdd,
                                          imgUrl: userImages[index],
                                          name: userNamesList[index],
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
          topBar(isSticky: sheetCollapsed),
        ],
      ),
    );
  }

  topBar({required bool isSticky}) {
    return Positioned(
      top: 0,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark, // or .dark
        child: Container(
          color: isSticky ? Palette.whiteColor : Colors.transparent,
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
                        focusnode: _focusNode,
                        prefixIcon: searchIcon,
                        prefixIconColor: Palette.greyTextColor,
                        borderRadius: BorderStyles.searchTextField,
                        fillColor: Palette.whiteColor,
                        borderColor: Palette.greyTextColor.withOpacity(0.5),
                      ),
                    ),
                    !isSticky
                        ? GestureDetector(
                            onTap: () => Get.to(() => const NotificationPage()),
                            child: Container(
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
                          )
                        : const SizedBox(),
                    isSticky
                        ? GestureDetector(
                            onTap: () async {
                              await getCurrentLocation();
                              animateToMyLocation();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
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
                                  filterIcon,
                                  height: 24,
                                  width: 24,
                                  color: Palette.blackColor,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
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
        ),
      ),
    );
  }
}
