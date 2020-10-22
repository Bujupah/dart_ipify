import 'package:dart_ipify/dart_ipify.dart';
import 'package:test/test.dart';

void main() {
  group('Ipify API Test', () {
    test('IPv4', () async {
      expect(await Ipify.ipv4(), isNotEmpty);
    });
    test('Universal: IPv4/IPv6', () async {
      expect(await Ipify.ipv64(), isNotEmpty);
    });
  });
}
