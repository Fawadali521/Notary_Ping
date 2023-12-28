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
  List<double> latitude = [];
  List<double> longitude = [];
  List<LatLng> latlang = [];
  late LatLng currentSelectLocation; //= const LatLng(34.611139, 72.4623079);
  double paddingBottom = 0.21;
  String currentLocation = '';
  String address = '';
  String city = '';
  String state = '';
  String country = '';
  TextEditingController placesController = TextEditingController();
  var uuid = const Uuid();
  String sessionToken = DateTime.now().second.toString();
  List<dynamic> places = [];
  bool isListShow = false;
  bool isFocus = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isFocus = true;
        });
      } else {
        setState(() {
          isFocus = false;
        });
      }
    });
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
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude,
          localeIdentifier: "en");
      setState(() {
        currentSelectLocation = LatLng(position.latitude, position.longitude);
        currentLocation =
            ("${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}");
        address =
            ("${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}");
        city = ("${placemarks.first.subAdministrativeArea}");
        state = (" ${placemarks.first.administrativeArea}");
        country = ("${placemarks.first.country}");

        latlang.add(currentSelectLocation);
        isLoding = false;
      });
      log("location get ==> $currentSelectLocation");
    } catch (e) {
      log("Error in location get ==> $e");
      currentSelectLocation = const LatLng(34.611139, 72.4623079);
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
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentSelectLocation.latitude, currentSelectLocation.longitude);
    // log(" address ==> ${placemarks.first.toString()}");
    // log("show address ==> ${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}, ${placemarks.first.postalCode},");
    currentLocation =
        ("${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}, ${placemarks.first.postalCode}");
    address =
        ("${placemarks.first.name}, ${placemarks.first.thoroughfare}, ${placemarks.first.locality}");
    city = ("${placemarks.first.subAdministrativeArea}");
    state = (" ${placemarks.first.administrativeArea}");
    country = ("${placemarks.first.country}");
    setState(() {});
    // animateToMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      resizeToAvoidBottomInset: false,
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
                  child: Stack(
                    children: [
                      GoogleMap(
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
                        onCameraMove: ((position) {
                          currentSelectLocation = position.target;
                          setState(() {});
                          // locationUpdate(position.target);
                        }),
                        onCameraIdle: () {
                          locationUpdate(currentSelectLocation);
                        },
                        // mapType: MapType.normal, //map type
                        onMapCreated: (controller) {
                          //method called when map is created
                          setState(() {
                            mapController = controller;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.h),
                          child: Image.asset(
                            mapMarkerIcon,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
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
                                    LocationDetails(
                                        context, address, city, state, country);
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
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark, // or .dark
        child: Container(
          color:
              isFocus || isListShow ? Palette.whiteColor : Colors.transparent,
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                width: Get.width,
                // color: Palette.whiteColor,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        focusnode: focusNode,
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
                    return InkWell(
                      onTap: () async {
                        List<Location> locations = await locationFromAddress(
                            places[index]['description']);
                        log("long ==>${locations.last.longitude} && lat ==> ${locations.last.latitude}");
                        currentSelectLocation = LatLng(
                            locations.last.latitude, locations.last.longitude);
                        await locationUpdate(currentSelectLocation);
                        animateToMyLocation();
                        FocusManager.instance.primaryFocus?.unfocus();
                        placesController.clear();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              bottom: 18.h,
                            ),
                            child: Text(
                              places[index]['description'],
                              style: TextStyles.bodyLarge,
                            ),
                          ),
                          // const CustomDivider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
