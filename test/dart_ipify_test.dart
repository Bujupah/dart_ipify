import 'package:dart_ipify/dart_ipify.dart' show Ipify;
import 'package:dart_ipify/src/model/geo.dart' show GeoModel;
import 'package:dotenv/dotenv.dart' show load, env;
import 'package:test/test.dart' show group, test, expect, isA;

Future<void> main() async {
  load();
  var ipifyApiKeyName = 'IPIFY_API_KEY';
  var IPIFY_API_KEY =
      env.containsKey(ipifyApiKeyName) ? env[ipifyApiKeyName] : '';

  group('Ipify API Test', () {
    test('IPv4', () async {
      expect(await Ipify.ipv4(), isA<String>());
    });
    test('Universal: IPv4/IPv6', () async {
      expect(await Ipify.ipv64(), isA<String>());
    });
    test('Geo API', () async {
      expect(await Ipify.geo(IPIFY_API_KEY.toString()), isA<GeoModel>());
    });
    test('Balance', () async {
      expect(await Ipify.balance(IPIFY_API_KEY.toString()), isA<dynamic>());
    });
  });
}
