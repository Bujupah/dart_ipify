import 'dart:convert';
import 'dart:io';

enum Format { TEXT, JSON, JSONP}

class Ipify {
  static final _client = HttpClient(context: SecurityContext(withTrustedRoots: true));

  static const String _scheme = 'https';
  static const String _hostv4 = 'api.ipify.org';
  static const String _hostv64 = 'api64.ipify.org';
  static const String _path = '/';
  static const String _format = 'format=';

  static Future<String> ipv4({Format format = Format.TEXT}) async => await send(_hostv4, format);
  static Future<String> ipv64({Format format = Format.TEXT}) async => await send(_hostv64, format);

  static Future<String> send(String host, Format format) async {
    
    try {
      
      final uri = Uri(host: host, path: _path, scheme: _scheme, query: param(format));
      
      final request = await _client.getUrl(uri);
      final response = await request.close();
      
      if(response.statusCode != 200) {
        throw Exception('Received an invalid status code from ipify: ${response.statusCode}. The service might be experiencing issues.');
      }

      final data = await utf8.decoder.convert(await response.first);
      return data;

    } catch (e) {
      throw Exception("The request failed because it wasn't able to reach the ipify service. This is most likely due to a networking error of some sort.");
    }
  }
  
  static String param(Format format) => _format + (Format.TEXT == format ? '' : Format.JSON == format ? 'json' : 'jsonp');  
}