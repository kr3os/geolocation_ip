# geolocation_ip

Dart pacakge to get your geolocation data form your IP

## Usage Example

To use this package you get data as GeolocationData Model like the next example:

```dart
GeolocationData geolocationData = GeolocationData(country: 'Canada', countryCode: 'CA', timezone: 'America/Toronto', ip: '24.48.0.1', lat: 45.6085, lon: -73.5493);
```

## Getting your current location from your IP

```dart
import 'package:ip_geolocation_api/ip_geolocation_api.dart';

  Future<void> getIp() async {
    // you can pass a new ip in getData('24.48.0.1')
    final data = await GeolocatorAPI.getData();
    if ( data != null ) {
      setState(() {
        geolocationData = data;
      });
    }
  }

```

## Using geolocationData 
```dart
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
      ),
    );
  }
}

```



## Example

See the example in `/example` folder.

