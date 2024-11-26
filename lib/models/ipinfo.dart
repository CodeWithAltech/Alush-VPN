class IpInfo {
  late final String ip;
  late final Location location;
  late final List<String> domains;
  late final ASInfo asInfo;
  late final String isp;

  IpInfo({
    required this.ip,
    required this.location,
    required this.domains,
    required this.asInfo,
    required this.isp,
  });

  // Constructor to parse JSON data
  IpInfo.fromJson(Map<String, dynamic> json) {
    ip = json['ip'] ?? 'Unknown IP';
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : Location(country: 'Unknown', region: 'Unknown', timezone: 'Unknown');
    domains = json['domains'] != null ? List<String>.from(json['domains']) : [];
    asInfo = json['as'] != null
        ? ASInfo.fromJson(json['as'])
        : ASInfo(
            asn: 0,
            name: 'Unknown',
            route: 'Unknown',
            domain: 'Unknown',
            type: 'Unknown');
    isp = json['isp'] ?? 'Unknown ISP';
  }
}

// Location class
class Location {
  late final String country;
  late final String region;
  late final String timezone;

  Location({
    required this.country,
    required this.region,
    required this.timezone,
  });

  Location.fromJson(Map<String, dynamic> json) {
    country = json['country'] ?? 'Unknown Country';
    region = json['region'] ?? 'Unknown Region';
    timezone = json['timezone'] ?? 'Unknown Timezone';
  }
}

// AS (Autonomous System) Info class
class ASInfo {
  late final int asn;
  late final String name;
  late final String route;
  late final String domain;
  late final String type;

  ASInfo({
    required this.asn,
    required this.name,
    required this.route,
    required this.domain,
    required this.type,
  });

  ASInfo.fromJson(Map<String, dynamic> json) {
    asn = json['asn'] ?? 0;
    name = json['name'] ?? 'Unknown Name';
    route = json['route'] ?? 'Unknown Route';
    domain = json['domain'] ?? 'Unknown Domain';
    type = json['type'] ?? 'Unknown Type';
  }
}
