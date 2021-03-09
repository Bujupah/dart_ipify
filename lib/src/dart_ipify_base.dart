import 'package:dart_ipify/src/model/geo.dart';
import 'package:http/http.dart' as http;

/// This deternmines the response type format from the ipify service (http://www.ipify.org).
/// There are three types.
///
/// [Format.TEXT] simple text (default),
///
/// [Format.JSON] json string
///
/// [Format.JSONP] jsonp format
enum Format { TEXT, JSON, JSONP }

/// This queries the ipify service (http://www.ipify.org) to retrieve this
/// machine's public IP address.  Returns your public IP address as a string or
/// any error encountered.  By default, this function will run using exponential
/// as a json string, and backoff.
///
/// Usage:
/// ```dart
/// void main() async {
///   final data = await Ipify.ipv4(format: Format.JSON);
///
///   print(data);
/// }
/// ```
class Ipify {
  static const String _scheme = 'https';
  static const String _hostv4 = 'api.ipify.org';
  static const String _hostv64 = 'api64.ipify.org';
  static const String _path = '/';
  static const String _format = 'format=';

  static const String _geoHost = 'geo.ipify.org';
  static const String _geoPath = '/api/v1';
  static const String _geobalancePath = 'service/account-balance';

  /// Simply returns an IPv4 address, the default format is a text
  ///
  /// Usage:
  /// ```dart
  /// final text = Ipify.ipv4();
  /// print(text); // 98.207.254.136
  ///
  /// final jsonText = Ipify.ipv4(format = Format.JSON);
  /// print(jsonText);  // {"ip":"98.207.254.136"}
  ///
  /// final jsonpText = Ipify.ipv4(format = Format.JSONP);
  /// print(jsonpText); // callback({"ip":"98.207.254.136"});
  /// ```
  static Future<String> ipv4({Format format = Format.TEXT}) async {
    final uri =
        Uri(host: _hostv4, path: _path, scheme: _scheme, query: _param(format));
    return await _send(uri);
  }

  /// Simply returns an IPv6 address if existed else fallback for IPv4,
  /// the default format is a text
  ///
  /// Usage:
  /// ```dart
  /// final text = Ipify.ipv64();
  /// print(text); // 98.207.254.136 or 2a00:1450:400f:80d::200e
  ///
  /// final jsonText = Ipify.ipv64(format = Format.JSON);
  /// print(jsonText);  // {"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e"}
  ///
  /// final jsonpText = Ipify.ipv64(format = Format.JSONP);
  /// print(jsonpText); // callback({"ip":"98.207.254.136"}); or callback({"ip":"2a00:1450:400f:80d::200e"});
  /// ```
  static Future<String> ipv64({Format format = Format.TEXT}) async {
    final uri = Uri(
        host: _hostv64, path: _path, scheme: _scheme, query: _param(format));
    return await _send(uri);
  }

  /// Discover the precise physical location of a given IP address,
  /// the default geo search is from this device current Public IP address.
  ///
  /// Returns a result of type GeoModel which is a generated class.
  ///
  /// This require an apiKey from https://geo.ipify.org/
  ///
  /// Usage:
  /// ```dart
  /// final mygeo = Ipify.geo('apiKey');
  /// print(mygeo.location.country); // TN
  ///
  /// final somegeo = Ipify.geo('apiKey', ip: '8.8.8.8');
  /// print(somegeo.toJson());
  /// ```
  /// ```json
  /// {
  ///   "ip": "8.8.8.8",
  ///   "location": {
  ///     "country": "US",
  ///     "region": "California",
  ///     "city": "Mountain View",
  ///     "lat": 37.4223,
  ///     "lng": -122.085,
  ///     "postalCode": "94043",
  ///     "timezone": "-07:00",
  ///     "geonameId": 5375480
  ///   },
  ///   "domains": [
  ///     "0--9.ru",
  ///     "000.lyxhwy.xyz",
  ///     "000180.top",
  ///     "00049ok.com",
  ///     "001998.com.he2.aqb.so"
  ///   ],
  ///   "as": {
  ///     "asn": 15169,
  ///     "name": "Google LLC",
  ///     "route": "8.8.8.0/24",
  ///     "domain": "https://about.google/intl/en/",
  ///     "type": "Content"
  ///   },
  ///   "isp": "Google LLC",
  ///   "proxy": {
  ///     "proxy": false,
  ///     "vpn": false,
  ///     "tor": false
  ///   }
  /// }
  /// ```
  static Future<GeoModel> geo(String api, {String? ip}) async {
    ip ??= await ipv4();
    final query = 'apiKey=$api&ipAddress=$ip';
    final uri =
        Uri(host: _geoHost, path: _geoPath, scheme: _scheme, query: query);
    final response = await _send(uri);
    return GeoModel.fromJson(response);
  }

  /// Get your API current balance
  ///
  /// Example:
  /// ```json
  /// { "credits": 984 }
  /// ```
  static Future<dynamic> balance(String api) async {
    final query = 'apiKey=$api';
    final uri = Uri(
        host: _geoHost, path: _geobalancePath, scheme: _scheme, query: query);
    return await _send(uri);
  }

  static Future<String> _send(Uri uri) async {
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
            'Received an invalid status code from ipify: ${response.statusCode}. The service might be experiencing issues.');
      }

      return response.body;
    } catch (e) {
      throw Exception(
          "The request failed because it wasn't able to reach the ipify service. This is most likely due to a networking error of some sort.");
    }
  }

  static String _param(Format format) =>
      _format +
      (Format.TEXT == format
          ? ''
          : Format.JSON == format
              ? 'json'
              : 'jsonp');
}
