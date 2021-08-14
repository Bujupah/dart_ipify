import 'package:dart_ipify/dart_ipify.dart';
import 'package:dotenv/dotenv.dart' show load, env;

// Example
void main() async {
  load();
  var ipifyApiKeyName = 'IPIFY_API_KEY';
  var IPIFY_API_KEY =
      env.containsKey(ipifyApiKeyName) ? env[ipifyApiKeyName] : '';

  final ip = await Ipify.ipv64(format: Format.JSON);
  print(ip);

  final myGeo = await Ipify.geo(IPIFY_API_KEY.toString());
  print(myGeo.location);

  final someGeo = await Ipify.geo(IPIFY_API_KEY.toString(), ip: '8.8.8.8');
  print(someGeo);

  final balance = await Ipify.balance(IPIFY_API_KEY.toString());
  print(balance);
}
