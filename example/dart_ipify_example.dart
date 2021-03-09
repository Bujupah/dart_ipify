import 'package:dart_ipify/dart_ipify.dart';

// Example
void main() async {
  final ip = await Ipify.ipv64(format: Format.JSON);
  print(ip);

  final mygeo = await Ipify.geo('at_apiKeyxxxxxxxxxxxxxxxxxxxxxxx');
  print(mygeo.location);

  final somegeo =
      await Ipify.geo('at_apiKeyxxxxxxxxxxxxxxxxxxxxxxx', ip: '8.8.8.8');
  print(somegeo);

  final balance = await Ipify.balance('at_apiKeyxxxxxxxxxxxxxxxxxxxxxxx');
  print(balance);
}
