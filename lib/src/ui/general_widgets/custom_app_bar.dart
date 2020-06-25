import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:upbaseexercise/src/bloc/formvalidator_bloc.dart';
import 'package:upbaseexercise/src/ui/general_widgets/custom_material_button.dart';
import 'package:upbaseexercise/src/ui/general_widgets/edit_text_general.dart';
import 'package:upbaseexercise/src/ui/home_fragment.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as Loca;
import 'package:upbaseexercise/src/ui/search_result_page.dart';
import 'package:upbaseexercise/src/values/colors.dart';

class CustomAppBar extends StatefulWidget {
  Function(LatLng, String) onPressCallback;
  CustomAppBar(this.onPressCallback);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  double reducedHeight = 75;
  double height = 0;
  double flexibleHeight = 355;

  String locationID;
  String businessId;
  TextEditingController locationController = TextEditingController();
  TextEditingController businessController = TextEditingController();

  String locationHintText = 'Your Location';

  String businessHintText = 'Resturant';

  AnimationController _animationController;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..forward();

    height = flexibleHeight;
    businessController.addListener(() {
      if (businessController.text.isEmpty) {
        setState(() {
          businessHintText = 'Resturant';
        });
      }
    });

    locationController.addListener(() {
      if (locationController.text.isEmpty) {
        setState(() {
          locationHintText = 'Your Location';
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      duration: const Duration(milliseconds: 400),
      child: Column(
        children: <Widget>[
          SafeArea(
              child: SizedBox(
            height: 10,
          )),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                    setState(() {
                      height = reducedHeight;
                    });
                  } else {
                    _animationController.forward();
                    setState(() {
                      height = flexibleHeight;
                    });
                  }
                },
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  color: Colors.grey,
                  progress: _animationController,
                )),
          ),
          EditTextGeneral(
              controller: businessController,
              validatorCallback: formValidatorBloc.singleInputValidator,
              labelText: 'Business Type',
              hintText: businessHintText,
              textInputType: TextInputType.text),
          SizedBox(
            height: 12,
          ),
          EditTextGeneral(
              controller: locationController,
              enabled: true,
              onTapCallback: _handleLocation,
              validatorCallback: formValidatorBloc.singleInputValidator,
              labelText: 'Location',
              prefix: Icon(
                Icons.gps_fixed,
                color: Colors.grey,
              ),
              hintText: locationHintText,
              textInputType: TextInputType.text),
          SizedBox(
            height: 12,
          ),
          CustomMaterialButton(
              title: 'Find',
              minWidth: 115,
              height: 45,
              color: Colors.blue.shade800,
              onPressed: () {
                _handlePressButton();
              })
        ],
      ),
    );
  }

  Future<void> _handleLocation() async {
    Prediction p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: Mode.fullscreen,
        language: "en");
    setState(() {
      locationController.text = p.description;
      locationID = p.placeId;
    });
  }

//
//  Future<void> _handleBusiness() async {
//
//  businessController.text = p.description;
//
//
//
//
//  }
  Future<void> _handlePressButton() async {
    if (locationController.text.isEmpty) {
      final center = await getUserLocation();
      widget.onPressCallback(center, businessController.text);
    } else {
      PlacesDetailsResponse place =
          await mapPlaces.getDetailsByPlaceId(locationID);
      var center = LatLng(place.result.geometry.location.lat,
          place.result.geometry.location.lng);
      widget.onPressCallback(center, businessController.text);
    }
  }

  Future<LatLng> getUserLocation() async {
    Loca.LocationData currentLocation;
    var location = Loca.Location();
    try {
      currentLocation = await location.getLocation();
      final lat = currentLocation.latitude;
      final lng = currentLocation.longitude;
      final center = LatLng(lat, lng);
      return center;
    } on Exception {
      currentLocation = null;
      return null;
    }
  }
}
