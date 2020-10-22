# Dart Ipify
**An unofficial client library for Ipify [*`<https://www.ipify.org/>`*](https://www.ipify.org/) *A Simple Public IP Address API*.**

## Meta
- Author: Khalil Mejdi
- Email: [khalil.mejdi](mailto:khalil.mejdi97@gmail.com)
- Status: maintained, active

## Purpose
This library makes getting your public IP address from dart languages extremely simple using Ipify's API.

## Installation
```yaml
dependencies:
  dart_ipify: ^1.0.0
```

## Usage
Using this library is very simple. Here's a simple example:
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

## Change Log
All library changes, in descending order.

#### Version 1.0.0
**Release Oct 22, 2020**
- First release