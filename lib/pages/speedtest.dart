// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:alush/helpers/alerts.dart';
import 'package:flutter/material.dart';
import 'package:speed_test_dart/classes/classes.dart';
import 'package:speed_test_dart/speed_test_dart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedTestView extends StatefulWidget {
  const SpeedTestView({super.key});

  @override
  State<SpeedTestView> createState() => _SpeedTestViewState();
}

class _SpeedTestViewState extends State<SpeedTestView> {
  final SpeedTestDart tester = SpeedTestDart();
  List<Server> bestServersList = [];
  double downloadRate = 0;
  double uploadRate = 0;
  double _speedValue = 0;
  bool readyToTest = false;
  bool isTesting = false;

  // Fetch and display server settings
  Future<void> setBestServers() async {
    try {
      final settings = await tester.getSettings();
      debugPrint('Settings: $settings');

      final servers = settings.servers;
      if (servers.isEmpty) {
        throw Exception("No servers found");
      }

      bestServersList = await tester.getBestServers(servers: servers);

      setState(() {
        readyToTest = true;
      });
    } catch (e) {
      debugPrint('Error fetching server settings: $e');
      Alushlert.error(
          msg: 'Failed to fetch server settings. Please try again. $e');
    }
  }

  // Test speed by downloading and uploading
  Future<void> testSpeed() async {
    if (!readyToTest || bestServersList.isEmpty) return;

    setState(() {
      isTesting = true;
      downloadRate = 0;
      uploadRate = 0;
      _speedValue = 0;
    });

    try {
      final newDownloadRate =
          await tester.testDownloadSpeed(servers: bestServersList);
      setState(() {
        downloadRate = newDownloadRate;
        _speedValue = newDownloadRate;
      });

      await Future.delayed(const Duration(seconds: 1));

      final newUploadRate =
          await tester.testUploadSpeed(servers: bestServersList);
      setState(() {
        uploadRate = newUploadRate;
      });
    } catch (e) {
      debugPrint('Error testing speed: $e');
      Alushlert.error(msg: 'Speed test failed. Please try again. $e');
    } finally {
      setState(() {
        isTesting = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setBestServers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Alush Speed Test',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 4500,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 33,
                        color: Colors.blue.shade200,
                      ),
                      GaugeRange(
                        startValue: 33,
                        endValue: 66,
                        color: Colors.blue.shade500,
                      ),
                      GaugeRange(
                        startValue: 66,
                        endValue: 100,
                        color: Colors.blue.shade900,
                      ),
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: _speedValue)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '${_speedValue.toStringAsFixed(2)} Mb/s',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (isTesting)
              const CircularProgressIndicator()
            else
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).canvasColor,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Download Speed',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Upload Speed',
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${downloadRate.toStringAsFixed(2)} Mb/s'),
                              Text('${uploadRate.toStringAsFixed(2)} Mb/s'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: isTesting ? null : testSpeed,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Speed Test'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
