import 'package:flutter/material.dart';
import 'dart:async';

class TimerClock extends StatefulWidget {
  final bool startclock;
  const TimerClock({
    super.key,
    required this.startclock,
  });

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  Duration _duration = const Duration();
  Timer? _timer;

  _startclock() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            _duration = Duration(seconds: _duration.inSeconds + 1);
          },
        );
      },
    );
  }

  _stopclock() {
    setState(() {
      _timer?.cancel();
      _timer = null;
      _duration = const Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_timer == null || !widget.startclock) {
      widget.startclock ? _startclock() : _stopclock();
    }
    String convection(int n) => n.toString().padLeft(2, '0');
    final hours = convection(_duration.inHours.remainder(60));
    final minutes = convection(_duration.inMinutes.remainder(60));
    final seconds = convection(_duration.inSeconds.remainder(60));

    return Text(
      '$hours : $minutes : $seconds',
      style: const TextStyle(fontSize: 14),
    );
  }
}
