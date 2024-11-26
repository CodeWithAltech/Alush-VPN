class IpData {
  final String ip;
  final Location? location;
  final List<String>? domains;
  final As? as;
  final String? isp;

  IpData({
    required this.ip,
    this.location,
    this.domains,
    this.as,
    this.isp,
  });

  factory IpData.fromJson(Map<String, dynamic> json) {
    return IpData(
      ip: json['ip'] ?? 'Unknown IP',
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      domains:
          json['domains'] != null ? List<String>.from(json['domains']) : [],
      as: json['as'] != null ? As.fromJson(json['as']) : null,
      isp: json['isp'] ?? 'Unknown ISP',
    );
  }
}

class Location {
  final String? country;
  final String? region;
  final String? timezone;

  Location({
    this.country,
    this.region,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      region: json['region'],
      timezone: json['timezone'],
    );
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

  factory As.fromJson(Map<String, dynamic> json) {
    return As(
      asn: json['asn'],
      name: json['name'],
      route: json['route'],
      domain: json['domain'],
      type: json['type'],
    );
  }
}
