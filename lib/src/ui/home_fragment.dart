import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as Loca;
import 'package:upbaseexercise/src/ui/general_widgets/custom_app_bar.dart';
import 'package:upbaseexercise/src/ui/search_result_page.dart';
import 'package:upbaseexercise/src/utils/app_utilities.dart';

GoogleMapsPlaces mapPlaces = GoogleMapsPlaces(apiKey: kGoogleApiKey);
String searchKeyword = 'resturant';

class HomeFragment extends StatefulWidget {
  static const String routeName = '/homeFragment';
  @override
  State<StatefulWidget> createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  GoogleMapController mapController;
  List<PlacesSearchResult> places = [];
  bool isLoading = false;
  String errorMessage;

  @override
  void initState() {
    super.initState();
    Loca.Location.instance.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeScaffoldKey,
        body: Stack(
          children: <Widget>[
            SizedBox(
                height: responsiveHeight(context, 90),
                child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    initialCameraPosition:
                        const CameraPosition(target: LatLng(0, 0)))),
            CustomAppBar(onPressed),
            DraggableScrollableSheet(
                initialChildSize: 0.13,
                maxChildSize: 1,
                minChildSize: 0.13,
                builder: (context, controller) {
                  Widget expandedChild;
                  if (isLoading) {
                    expandedChild =
                        Center(child: CircularProgressIndicator(value: null));
                  } else if (errorMessage != null) {
                    expandedChild = Center(
                      child: Text(errorMessage),
                    );
                  } else {
                    expandedChild = ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 40,
                              height: 2.5,
                              margin:
                                  const EdgeInsets.only(top: 14, bottom: 14),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Nearby Places',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            buildPlacesList(controller),
                          ],
                        ),
                      ),
                    );
                  }

                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: expandedChild);
                })
          ],
        ));
  }

  void onPressed(var center, String newKeyword) async {
    searchKeyword = newKeyword;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 15.0)));

    final location = Location(center.latitude, center.longitude);
    final result = await mapPlaces.searchByText(searchKeyword,
        location: location, radius: 2500);

    print(center);

    getNearbyPlaces(center);
  }

  void refresh() async {
    searchKeyword = 'resturant';
    final center = await getUserLocation();

    print(center);
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 15.0)));
    getNearbyPlaces(center);
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    refresh();
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

  Future<LatLng> getLocation() async {
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

  void getNearbyPlaces(LatLng center) async {
    setState(() {
      this.isLoading = true;
      this.errorMessage = null;
    });

    final location = Location(center.latitude, center.longitude);
    final result = await mapPlaces.searchByText(searchKeyword,
        location: location, radius: 2500);
    setState(() {
      this.isLoading = false;
      if (result.status == "OK") {
        this.places = result.results;
        result.results.forEach((f) {
          mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: center == null ? LatLng(0, 0) : center, zoom: 15.0)));

          _add(LatLng(f.geometry.location.lat, f.geometry.location.lng));
        });
      } else {
        this.errorMessage = result.errorMessage;
      }
    });
  }

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  MarkerId selectedMarker;
  int _markerIdCounter = 1;

  void _onMarkerTapped(MarkerId markerId) {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        if (markers.containsKey(selectedMarker)) {
          final Marker resetOld = markers[selectedMarker]
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[selectedMarker] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;
      });
    }
  }

  void _add(LatLng center) {
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        center.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
        center.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        _onMarkerTapped(markerId);
      },
      onDragEnd: (LatLng position) {
        _onMarkerDragEnd(markerId, position);
      },
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                actions: <Widget>[
                  FlatButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
                content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 66),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Old position: ${tappedMarker.position}'),
                        Text('New position: $newPosition'),
                      ],
                    )));
          });
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<Null> showDetailPlace(String placeId) async {
    if (placeId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchResultPage(placeId)),
      );
    }
  }

  ListView buildPlacesList(ScrollController scrollController) {
    final placesWidget = places.map((f) {
      List<Widget> list = [
        Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            f.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ];
      if (f.formattedAddress != null) {
        list.add(Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            f.formattedAddress,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ));
      }

      if (f.vicinity != null) {
        list.add(Padding(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Text(
            f.vicinity,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ));
      }

      List<Widget> photoList = [];

      if (f.types?.first != null) {
        list.add(Padding(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Text(
            camelCase(f.types.first),
            style: Theme.of(context).textTheme.caption,
          ),
        ));
      }

      return Padding(
        padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
        child: InkWell(
          onTap: () {
            showDetailPlace(f.placeId);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: <Widget>[
                f.photos != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: f.photos.length > 0
                              ? buildPhotoURL(
                                  f.photos.elementAt(0).photoReference)
                              : '',
                          width: 70,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: f.photos != null ? 12 : 0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();

    return ListView.separated(
      itemCount: placesWidget.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 24),
      itemBuilder: (BuildContext context, int index) {
        return placesWidget.elementAt(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          indent: 28,
          endIndent: 28,
        );
      },
    );
  }
}
