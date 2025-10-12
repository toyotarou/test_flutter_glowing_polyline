import 'package:flutter/material.dart';

class GlowBlink {
  GlowBlink({
    required TickerProvider vsync,
    this.period = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
    bool autoStart = true,
    bool reverse = true,
  }) {
    _reverse = reverse;
    _controller = AnimationController(vsync: vsync, duration: period);
    _t = CurvedAnimation(parent: _controller, curve: curve);
    if (autoStart) {
      _controller.repeat(reverse: reverse);
    }
  }

  final Duration period;
  final Curve curve;

  late final AnimationController _controller;
  late final Animation<double> _t;
  late bool _reverse;

  Animation<double> get t => _t;

  void start({bool? reverse}) {
    _reverse = reverse ?? _reverse;
    _controller.repeat(reverse: _reverse);
  }

  void stop() => _controller.stop();

  void dispose() => _controller.dispose();
}
