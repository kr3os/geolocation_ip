import 'package:flutter/material.dart';

import 'package:geolocation_ip/geolocation_ip.dart';

void main() => runApp( const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  GeolocationData geolocationData = GeolocationData(country: 'Canada', countryCode: 'CA', timezone: 'America/Toronto', ip: '24.48.0.1', lat: 45.6085, lon: -73.5493);

  @override
  void initState()  {
    getIp();
    super.initState();
  }

  Future<void> getIp() async {
    final geolocatorData = await GeolocatorAPI.getData();
    if ( geolocatorData != null ) {
      setState(() {
        geolocationData = geolocatorData;
      });
    }
  }

  Future<void> updateIp( String ip) async {
    final geolocatorData = await GeolocatorAPI.getData(query: ip);
    if ( geolocatorData != null ) {
      setState(() {
        geolocationData = geolocatorData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('IP: ${geolocationData.ip}'),
        ),
        body: Center(
          child: Text(
            geolocationData.country, 
            style: const TextStyle(color: Colors.black, fontSize: 22),),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.pin_drop_rounded),
          onPressed: (){
            setState(() {
               updateIp('76.48.0.1');
            });
          },
        ),
      ),
    );
  }
}