import 'package:dart_ipify/dart_ipify.dart';

// Example
void main() async {
  final data = await Ipify.ipv64(format: Format.JSON);
  
  print(data);
}
