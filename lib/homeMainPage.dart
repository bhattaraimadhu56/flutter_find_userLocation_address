import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoder/geocoder.dart';

import 'package:geolocator/geolocator.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
// define the variable here

  final Geolocator geolocator = Geolocator();

  Position _currentPosition;
  String _currentAddress = "Now you will get your current location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Get Your own location lat lng and Address",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 30.0,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          UserAccountsDrawerHeader(
            accountName: Text("Madhu Sudan Bhattarai"),
            accountEmail: Text("bhattaraimadhu56@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1598547461182-45d03f6661e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
            ),
          ),
          new Divider(
            color: Colors.tealAccent,
            thickness: 1.0,
          ),
          ListTile(
            autofocus: true,
            onTap: () {
              // Code to get the current location here
              _getCurrentLocation();
              //exit drawer or go back
              Navigator.pop(context);
            },
            leading: Icon(Icons.location_city_sharp), // give icon on left side
            title: Text("Home Page"), // write text here
            subtitle: Text("You can see your home page"),
            trailing: Icon(Icons.location_city), // gives icon on right side
          ),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPosition != null) Text(_currentAddress),
            // Text(
            //     "Latitude is : ${_currentPosition.latitude}, Longitude is : ${_currentPosition.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      print("Hi, Your location is ${_currentPosition}");
    });
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    // print("${first.featureName} : ${first.addressLine}");
    print("Your current address is -   ${first.addressLine}");
    setState(() {
      _currentAddress = "${first.featureName}, ${first.addressLine}";
    });
  }
}
