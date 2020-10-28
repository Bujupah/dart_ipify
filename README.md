# Dart Ipify
**An unofficial client library for Ipify [*`<https://www.ipify.org/>`*](https://www.ipify.org/) *A Simple Public IP Address API, Likewise a geographical IP address details API*.**

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Bujupah/dart_ipify/blob/master/LICENSE)
[![pub package](https://img.shields.io/pub/v/dart_ipify.svg)](https://pub.dartlang.org/packages/dart_ipify) 
[![Opensource](https://img.shields.io/static/v1?label=opensource&message=❤&color=red)](https://github.com/bujupah/dart_ipify)

## About ipify
Using ipify is ridiculously simple. You can get your public IP directly or you can get the precise physical location of a given IP address. so if you only have as much as an IP address, you can still find out its geographical details.

## Meta
- Author: Khalil Mejdi
- Email: [khalil.mejdi](mailto:khalil.mejdi97@gmail.com)
- Status: maintained, active

## Purpose
This library makes getting your ``public IP address`` or the precise ``geographical details`` of a given IP address with the dart language extremely simple using Ipify's API.

## Installation
```yaml
dependencies:
  dart_ipify: ^1.0.2
```

## Usage
Using this library is very simple. Here's a simple example:

###### IP Address API
```dart
import 'package:dart_ipify/dart_ipify.dart';

void main() async {
  final ipv4 = await Ipify.ipv4();
  print(ipv4); // 98.207.254.136

  final ipv6 = await Ipify.ipv64();
  print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e

  final ipv4json = await Ipify.ipv64(format: Format.JSON);
  print(ipv4json); //{"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e"}

  // The response type can be text, json or jsonp
}
```


###### IP Geolocation API
```dart
import 'package:dart_ipify/dart_ipify.dart';

void main() async {
  final mygeo = await Ipify.geo('at_apiKeyxxxxxxxxxxxxxxxxxxxxxxx');
  print(mygeo.location);

  final somegeo = await Ipify.geo('at_apiKeyxxxxxxxxxxxxxxxxxxxxxxx', ip: '8.8.8.8');
  print(somegeo);

  final balance = await Ipify.balance('at_apiKeyxxxxxxxxxxxxxxxxxxxxxxx');
  print(balance);
}
```



## Change Log
All library changes, in descending order.

#### Version 1.0.2 (Release Oct 28, 2020)
- Adding GeoLocation API.
- Adding example.

#### Version 1.0.1 (Release Oct 22, 2020)
- Supporting multiple platforms.
- Documenting code.
- Adding example.

#### Version 1.0.0 (Release Oct 22, 2020)
- First release