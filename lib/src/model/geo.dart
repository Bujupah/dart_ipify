import 'dart:convert';

class GeoModel {
  final String? ip;
  final Location? location;
  final List<String>? domains;
  final As? as;
  final String? isp;
  final Proxy? proxy;

  GeoModel({
    this.ip,
    this.location,
    this.domains,
    this.as,
    this.isp,
    this.proxy,
  });

  GeoModel copyWith({
    String? ip,
    Location? location,
    List<String>? domains,
    As? as,
    String? isp,
    Proxy? proxy,
  }) {
    return GeoModel(
      ip: ip ?? this.ip,
      location: location ?? this.location,
      domains: domains ?? this.domains,
      as: as ?? this.as,
      isp: isp ?? this.isp,
      proxy: proxy ?? this.proxy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ip': ip,
      'location': location?.toMap(),
      'domains': domains,
      'as': as?.toMap(),
      'isp': isp,
      'proxy': proxy?.toMap(),
    };
  }

  factory GeoModel.fromMap(Map<String, dynamic>? map) {
    return GeoModel(
      ip: map!['ip'],
      location: Location.fromMap(map['location']),
      domains: map.containsKey('domains')
          ? List<String>.from(map['domains'])
          : List<String>.empty(),
      as: As.fromMap(map['as']),
      isp: map['isp'],
      proxy: Proxy.fromMap(map['proxy']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoModel.fromJson(String source) =>
      GeoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GeoModel(ip: $ip, location: $location, domains: $domains, as: $as, isp: $isp, proxy: $proxy)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is GeoModel &&
        o.ip == ip &&
        o.location == location &&
        o.domains == domains &&
        o.as == as &&
        o.isp == isp &&
        o.proxy == proxy;
  }

  @override
  int get hashCode {
    return ip.hashCode ^
        location.hashCode ^
        domains.hashCode ^
        as.hashCode ^
        isp.hashCode ^
        proxy.hashCode;
  }
}

class Location {
  final String? country;
  final String? region;
  final String? city;
  final double? lat;
  final double? lng;
  final String? postalCode;
  final String? timezone;
  final int? geonameId;

  Location({
    this.country,
    this.region,
    this.city,
    this.lat,
    this.lng,
    this.postalCode,
    this.timezone,
    this.geonameId,
  });

  Location copyWith({
    String? country,
    String? region,
    String? city,
    double? lat,
    double? lng,
    String? postalCode,
    String? timezone,
    int? geonameId,
  }) {
    return Location(
      country: country ?? this.country,
      region: region ?? this.region,
      city: city ?? this.city,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      postalCode: postalCode ?? this.postalCode,
      timezone: timezone ?? this.timezone,
      geonameId: geonameId ?? this.geonameId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'region': region,
      'city': city,
      'lat': lat,
      'lng': lng,
      'postalCode': postalCode,
      'timezone': timezone,
      'geonameId': geonameId,
    };
  }

  factory Location.fromMap(Map<String, dynamic>? map) {
    return Location(
      country: map!['country'],
      region: map['region'],
      city: map['city'],
      lat: map['lat']?.toDouble(),
      lng: map['lng']?.toDouble(),
      postalCode: map['postalCode'],
      timezone: map['timezone'],
      geonameId: map['geonameId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Location(country: $country, region: $region, city: $city, lat: $lat, lng: $lng, postalCode: $postalCode, timezone: $timezone, geonameId: $geonameId)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Location &&
        o.country == country &&
        o.region == region &&
        o.city == city &&
        o.lat == lat &&
        o.lng == lng &&
        o.postalCode == postalCode &&
        o.timezone == timezone &&
        o.geonameId == geonameId;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        region.hashCode ^
        city.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        postalCode.hashCode ^
        timezone.hashCode ^
        geonameId.hashCode;
  }
}

class As {
  final int? asn;
  final String? name;
  final String? route;
  final String? domain;
  final String? type;

  As({
    this.asn,
    this.name,
    this.route,
    this.domain,
    this.type,
  });

  As copyWith({
    int? asn,
    String? name,
    String? route,
    String? domain,
    String? type,
  }) {
    return As(
      asn: asn ?? this.asn,
      name: name ?? this.name,
      route: route ?? this.route,
      domain: domain ?? this.domain,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'asn': asn,
      'name': name,
      'route': route,
      'domain': domain,
      'type': type,
    };
  }

  factory As.fromMap(Map<String, dynamic>? map) {
    return As(
      asn: map!['asn']?.toInt(),
      name: map['name'],
      route: map['route'],
      domain: map['domain'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory As.fromJson(String source) => As.fromMap(json.decode(source));

  @override
  String toString() {
    return 'As(asn: $asn, name: $name, route: $route, domain: $domain, type: $type)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is As &&
        o.asn == asn &&
        o.name == name &&
        o.route == route &&
        o.domain == domain &&
        o.type == type;
  }

  @override
  int get hashCode {
    return asn.hashCode ^
        name.hashCode ^
        route.hashCode ^
        domain.hashCode ^
        type.hashCode;
  }
}

class Proxy {
  final bool? proxy;
  final bool? vpn;
  final bool? tor;

  Proxy({
    this.proxy,
    this.vpn,
    this.tor,
  });

  Proxy copyWith({
    bool? proxy,
    bool? vpn,
    bool? tor,
  }) {
    return Proxy(
      proxy: proxy ?? this.proxy,
      vpn: vpn ?? this.vpn,
      tor: tor ?? this.tor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'proxy': proxy,
      'vpn': vpn,
      'tor': tor,
    };
  }

  factory Proxy.fromMap(Map<String, dynamic>? map) {
    return Proxy(
      proxy: map!['proxy'],
      vpn: map['vpn'],
      tor: map['tor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Proxy.fromJson(String source) => Proxy.fromMap(json.decode(source));

  @override
  String toString() => 'Proxy(proxy: $proxy, vpn: $vpn, tor: $tor)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Proxy && o.proxy == proxy && o.vpn == vpn && o.tor == tor;
  }

  @override
  int get hashCode => proxy.hashCode ^ vpn.hashCode ^ tor.hashCode;
}
