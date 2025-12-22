import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/controllers_mixin.dart';
import '../controllers/route_line/route_line.dart';
import '../extensions/extensions.dart';
import '../models/route_line_model.dart';
import 'parts/glow_blink.dart';
import 'parts/glowing_polyline_layer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin, ControllersMixin {
  late GlowBlink sharedBlink;

  bool _blinkRunning = true;

  ///
  @override
  void initState() {
    super.initState();
    sharedBlink = GlowBlink(vsync: this, curve: Curves.easeInOutCubic);
  }

  ///
  @override
  void dispose() {
    sharedBlink.dispose();
    super.dispose();
  }

  ///
  void _stopBlink() {
    sharedBlink.stop();
    setState(() => _blinkRunning = false);
  }

  ///
  void _startBlink() {
    sharedBlink.restartFromZero();
    setState(() => _blinkRunning = true);
  }

  ///
  void _onSelectRoute(RouteLineModel model) {
    ref.read(routeLinesProvider.notifier).addOrMoveToLast(model);

    if (_blinkRunning) {
      sharedBlink.restartFromZero();
    }
  }

  ///
  @override
  Widget build(BuildContext context) {
    final RouteLinesState routeLinesState = ref.watch(routeLinesProvider);

    final List<RouteLineModel> routes = routeLinesState.routeLineModelList;

    final int lastIndex = routes.isEmpty ? -1 : routes.length - 1;

    // ignore: always_specify_types
    final List<Polyline<Object>> nonGlowingPolylines = <Polyline>[];

    for (int i = 0; i < routes.length; i++) {
      if (i == lastIndex) {
        continue;
      }

      final RouteLineModel r = routes[i];

      nonGlowingPolylines.add(
        // ignore: always_specify_types
        Polyline(
          points: r.points,
          color: r.coreColor.withOpacity(0.9),
          strokeWidth: r.coreWidth,
          borderColor: Colors.black.withOpacity(0.2),
          borderStrokeWidth: r.coreWidth * 0.4,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('最後の1本だけ光らせる'),
        actions: <Widget>[
          IconButton(
            tooltip: _blinkRunning ? '明滅を停止' : '明滅を再開',
            onPressed: _blinkRunning ? _stopBlink : _startBlink,
            icon: Icon(_blinkRunning ? Icons.pause : Icons.play_arrow),
          ),
          IconButton(
            tooltip: '最後の線を削除',
            onPressed: () => ref.read(routeLinesProvider.notifier).removeLast(),
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            tooltip: '全消去',
            onPressed: () => ref.read(routeLinesProvider.notifier).clear(),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: const MapOptions(initialCenter: LatLng(35.6895, 139.6917), initialZoom: 12.0),
            children: <Widget>[
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.step3_bbox_preview',
              ),

              // ignore: always_specify_types
              if (nonGlowingPolylines.isNotEmpty) PolylineLayer(polylines: nonGlowingPolylines),

              if (lastIndex >= 0)
                (_blinkRunning
                    ? GlowingPolylineLayer(
                        points: routes[lastIndex].points,
                        coreColor: routes[lastIndex].coreColor,
                        glowColor: routes[lastIndex].glowColor,
                        coreWidth: routes[lastIndex].coreWidth,
                        blink: sharedBlink,
                      )
                    // ignore: always_specify_types
                    : PolylineLayer(
                        polylines: <Polyline<Object>>[
                          // ignore: always_specify_types
                          Polyline(
                            points: routes[lastIndex].points,
                            color: routes[lastIndex].coreColor.withOpacity(0.95),
                            strokeWidth: routes[lastIndex].coreWidth,
                            borderColor: Colors.black.withOpacity(0.2),
                            borderStrokeWidth: routes[lastIndex].coreWidth * 0.4,
                          ),
                        ],
                      )),
            ],
          ),

          Positioned(left: 0, right: 0, bottom: 8, child: Center(child: displayPolylineSelectButton())),
        ],
      ),
    );
  }

  ///
  Widget displayPolylineSelectButton() {
    final List<RouteLineModel> available = ref.watch(availableRouteLinesProvider);

    // ここが空になるのは provider 側の実装ミスなので、ガードのみ入れておく
    if (available.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> value = available.map((RouteLineModel m) {
      return _routeButton(context, m.id, onTap: () => _onSelectRoute(m));
    }).toList();

    final List<Widget> list = <Widget>[];
    for (int i = 0; i < 27; i++) {
      list.add(value[i % value.length]);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: context.screenSize.width * 2,
        child: Wrap(spacing: 8, children: list),
      ),
    );
  }

  ///
  Widget _routeButton(BuildContext context, String label, {required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
      child: Text(label.toUpperCase()),
    );
  }
}
