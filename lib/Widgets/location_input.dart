// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationInput extends StatefulWidget {
//   const LocationInput({Key? key}) : super(key: key);
//   @override
//   State<LocationInput> createState() => _LocationInputState();
// }
//
// class _LocationInputState extends State<LocationInput> {
//   String _previewImageUrl = '';
//   Future<void> _getcurrloc() async {
//     final locData = await Location.getLocation();
//     print(locData.latitude);
//     print(locData.longitude);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 170,
//           width: double.infinity,
//           alignment: Alignment.center,
//           decoration:
//               BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
//           child: _previewImageUrl == null
//               ? Text(
//                   'No Location Choosen',
//                   textAlign: TextAlign.center,
//                 )
//               : Image.network(
//                   _previewImageUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//         ),
//         Row(
//           children: [
//             Center(
//               child: TextButton.icon(
//                 onPressed: _getcurrloc,
//                 icon: Icon(Icons.location_on),
//                 label: Text(
//                   'Current Location',
//                   style: TextStyle(color: Theme.of(context).primaryColor),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:native_features/Screens/Add_places.dart';

class LocationPage extends StatefulWidget {
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _currentAddress = '';
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        add_Product_screen.Add = _currentAddress;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  String? Ada() {
    return _currentAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ADDRESS: ${_currentAddress ?? ""}'),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent),
            onPressed: _getCurrentPosition,
            child: const Text(
              "Get Current Location",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
