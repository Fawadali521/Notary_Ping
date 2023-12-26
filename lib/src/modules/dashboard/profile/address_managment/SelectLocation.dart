// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:notary_ping/src/modules/dashboard/profile/address_managment/LocationDetails.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../../../index.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  SelectLocationState createState() => SelectLocationState();
}

class SelectLocationState extends State<SelectLocation> {
  bool isLoding = false;
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  List<double> latitude = [];
  List<double> longitude = [];
  List<LatLng> latlang = [];
  List<Marker> markers = []; //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  late LatLng currentSelectLocation; //= const LatLng(34.611139, 72.4623079);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  double paddingBottom = 0.04;
  String currentLocation = '';
  TextEditingController placesController = TextEditingController();
  var uuid = const Uuid();
  String sessionToken = DateTime.now().second.toString();
  List<dynamic> places = [];
  bool isListShow = false;
  bool isLocationAddress = false;

  @override
  void initState() {
    setState(() {
      isLoding = true;
      isLocationAddress = true;
    });
    // widgetToImage();
    if (Platform.isAndroid) {
      checkLocationStatus();
    } else {
      getCurrentLocation();
    }
    super.initState();
    placesController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    // if(sessionToken == null){
    sessionToken = uuid.v4();
    // }
    getSuggestion(placesController.text);
  }

  getSuggestion(String input) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=${Constants.googleMapsApiKey}&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));
    // var data = response.body.toString();
    log(response.body.toString());
    if (response.statusCode == 200) {
      log("sucess");
      setState(() {
        places = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      setState(() {
        isListShow = false;
      });
      throw Exception("not loaded places");
    }
    if (places.isNotEmpty) {
      setState(() {
        isListShow = true;
      });
    } else {
      setState(() {
        isListShow = false;
      });
    }
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
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      setState(() {
        currentSelectLocation = LatLng(position.latitude, position.longitude);
        currentLocation =
            ("${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}, ${placemarks.first.postalCode}");
        latlang.add(currentSelectLocation);
        // addMarker(currentSelectLocation);
        isLocationAddress = false;
        isLoding = false;
      });
      log("location get ==> $currentSelectLocation");
      // addMarker(latlang);
    } catch (e) {
      log("Error in location get ==> $e");
      currentSelectLocation = const LatLng(34.611139, 72.4623079);
      // addMarker(latlang);
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

  animateToMyLocation() {
    setState(() {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(currentSelectLocation, 16),
      );
    });
  }

  locationUpdate(LatLng latLng) async {
    currentSelectLocation = latLng;
    // setState(() {});
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentSelectLocation.latitude, currentSelectLocation.longitude);
    // log(" address ==> ${placemarks.first.toString()}");
    // log("show address ==> ${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}, ${placemarks.first.postalCode},");
    currentLocation =
        ("${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}, ${placemarks.first.postalCode}");
    setState(() {});
    // animateToMyLocation();
  }

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
              : Padding(
                  padding: EdgeInsets.only(bottom: paddingBottom.sh),
                  child: GoogleMap(
                    padding: !isLoding
                        ? EdgeInsets.zero
                        : EdgeInsets.only(top: 0.04.sh, bottom: 0.03.sh),
                    myLocationEnabled: true, //set your location enable
                    myLocationButtonEnabled: false,
                    // compassEnabled: true,
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition(
                      target: currentSelectLocation, //initial position
                      zoom: 14.0, //initial zoom level
                    ),
                    polylines: Set<Polyline>.of(
                        polylines.values), //polylines to show directions
                    // markers: markers.toSet(), //markers to show on map
                    markers: <Marker>{
                      Marker(
                        draggable: true,
                        markerId: const MarkerId("1"),
                        position: currentSelectLocation,
                        icon: BitmapDescriptor.defaultMarker,
                        infoWindow: const InfoWindow(
                          title: 'Usted está aquí',
                        ),
                      )
                    },
                    onCameraMove: ((position) {
                      currentSelectLocation = position.target;
                      setState(() {});

                      locationUpdate(position.target);
                    }),
                    // mapType: MapType.normal, //map type
                    onMapCreated: (controller) {
                      //method called when map is created
                      setState(() {
                        mapController = controller;
                      });
                    },
                    // onTap: (newLatLng) async {
                    //   currentSelectLocation = newLatLng;
                    //   setState(() {});
                    // },
                  ),
                ),
          !isLoding
              ? DraggableScrollableSheet(
                  maxChildSize: .22,
                  initialChildSize: .22,
                  minChildSize: 0.22,
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
                              Row(
                                children: [
                                  Image.asset(
                                    locationIcon,
                                    height: 20,
                                    width: 20,
                                    color: Palette.primaryColor,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      currentLocation,
                                      style: TextStyles.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SubmitButton(
                                onTap: () {
                                  if (currentLocation.isNotEmpty) {
                                    // Get.to(() => AddDetails(
                                    //       location: currentLocation,
                                    //     ));
                                    LocationDetails(context, currentLocation);
                                  }
                                },
                                title: "Enter Complete address".tr,
                              ),
                              const SizedBox(height: 24),
                            ],
                          );
                        },
                      ),
                    );
                  },
                )
              : const SizedBox(),
          topBar(),
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
                          horizontal: .3.sw, vertical: 8.h),
                      child: Text(
                        "Select location".tr,
                        style: TextStyles.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            width: Get.width,
            // color: Palette.whiteColor,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: placesController,
                    hintText: "Search".tr,
                    prefixIcon: searchIcon,
                    prefixIconColor: Palette.greyTextColor,
                    borderRadius: BorderStyles.searchTextField,
                    fillColor: Palette.whiteColor,
                    borderColor: Palette.greyTextColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: () async {
                    // await getCurrentLocation();
                    // animateToMyLocation();
                    Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high,
                    );
                    LatLng curentPosition =
                        LatLng(position.latitude, position.longitude);
                    await locationUpdate(curentPosition);
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
          Container(
            width: 1.sw,
            color: isListShow ? Palette.whiteColor : Colors.transparent,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: places.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(places[index]['description']),
                  onTap: () async {
                    List<Location> locations =
                        await locationFromAddress(places[index]['description']);
                    log("long ==>${locations.last.longitude} && lat ==> ${locations.last.latitude}");
                    currentSelectLocation = LatLng(
                        locations.last.latitude, locations.last.longitude);
                    await locationUpdate(currentSelectLocation);
                    animateToMyLocation();
                    FocusManager.instance.primaryFocus?.unfocus();
                    placesController.clear();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
