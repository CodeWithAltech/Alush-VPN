// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:alush/models/ipdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiDataScreen extends StatefulWidget {
  const ApiDataScreen({super.key});

  @override
  _ApiDataScreenState createState() => _ApiDataScreenState();
}

class _ApiDataScreenState extends State<ApiDataScreen> {
  late Future<IpData> ipData;

  Future<IpData> fetchIpData() async {
    final response = await http.get(
      Uri.parse(
        'https://geo.ipify.org/api/v2/country?apiKey=at_QulIqLceRhAeShv80oIFFJ3T73SOT',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      return IpData.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    ipData = fetchIpData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
      ),
      body: FutureBuilder<IpData>(
        future: fetchIpData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('IP: ${data.ip}', style: TextStyle(fontSize: 18)),
                  Text(
                      'Location: ${data.location?.country}, ${data.location?.region}'),
                  Text('Timezone: ${data.location?.timezone}'),
                  Text('ISP: ${data.isp}'),
                  if (data.domains != null && data.domains!.isNotEmpty) ...[
                    Text('Domains:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...data.domains!.map((domain) => Text('- $domain')),
                  ],
                  Text('AS Info:'),
                  Text('  ASN: ${data.as?.asn}'),
                  Text('  Name: ${data.as?.name}'),
                  Text('  Route: ${data.as?.route}'),
                  Text('  Domain: ${data.as?.domain}'),
                  Text('  Type: ${data.as?.type}'),
                ],
              ),
            );
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
