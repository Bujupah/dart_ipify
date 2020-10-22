import 'package:dart_ipify/dart_ipify.dart';

void main() async {
  final data = await Ipify.ipv4(format: Format.JSON);
  
  print(data);
}
