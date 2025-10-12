import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

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

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
  late GlowBlink sharedBlink;

  bool _blinkRunning = true;

  static const LatLng _sugamo = LatLng(35.7335, 139.7392);
  static const LatLng _tabata = LatLng(35.7380, 139.7610);

  static const LatLng _ochanomizu = LatLng(35.6992, 139.7650);
  static const LatLng _tokyo = LatLng(35.681236, 139.767125);

  static const LatLng _ikebukuro = LatLng(35.728926, 139.71038);
  static const LatLng _waseda = LatLng(35.7058, 139.7192);

  static const LatLng _akasaka = LatLng(35.6720, 139.7360);
  static const LatLng _shimbashi = LatLng(35.6664, 139.7580);

  static const LatLng _roppongi = LatLng(35.6640, 139.7290);
  static const LatLng _iidabashi = LatLng(35.7021, 139.7460);

  RouteLineModel routeA() => RouteLineModel(id: 'a', label: 'a: 巣鴨→田端', points: <LatLng>[_sugamo, _tabata]);

  RouteLineModel routeB() => RouteLineModel(
    id: 'b',
    label: 'b: お茶の水→東京',
    points: <LatLng>[_ochanomizu, _tokyo],
    coreColor: Colors.pinkAccent,
    glowColor: Colors.pink,
  );

  RouteLineModel routeC() => RouteLineModel(
    id: 'c',
    label: 'c: 池袋→早稲田',
    points: <LatLng>[_ikebukuro, _waseda],
    coreColor: Colors.orangeAccent,
    glowColor: Colors.deepOrange,
  );

  RouteLineModel routeD() => RouteLineModel(
    id: 'd',
    label: 'd: 赤坂→新橋',
    points: <LatLng>[_akasaka, _shimbashi],
    coreColor: Colors.lightGreenAccent,
    glowColor: Colors.green,
  );

  RouteLineModel routeE() => RouteLineModel(
    id: 'e',
    label: 'e: 六本木→飯田橋',
    points: <LatLng>[_roppongi, _iidabashi],
    coreColor: Colors.amberAccent,
    glowColor: Colors.amber,
  );

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
    sharedBlink.start();

    setState(() => _blinkRunning = true);
  }

  ///
  @override
  Widget build(BuildContext context) {
    final List<RouteLineModel> routes = ref.watch(routeLinesProvider);

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
    final List<Widget> value = <Widget>[
      _routeButton(context, 'a', onTap: () => ref.read(routeLinesProvider.notifier).addOrMoveToLast(routeA())),

      _routeButton(context, 'b', onTap: () => ref.read(routeLinesProvider.notifier).addOrMoveToLast(routeB())),

      _routeButton(context, 'c', onTap: () => ref.read(routeLinesProvider.notifier).addOrMoveToLast(routeC())),

      _routeButton(context, 'd', onTap: () => ref.read(routeLinesProvider.notifier).addOrMoveToLast(routeD())),

      _routeButton(context, 'e', onTap: () => ref.read(routeLinesProvider.notifier).addOrMoveToLast(routeE())),
    ];

    final List<Widget> list = <Widget>[];

    for (int i = 0; i < 27; i++) {
      final Widget val = value[i % 5];

      list.add(val);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: context.screenSize.width * 2,
        child: Wrap(spacing: 8, children: list.map((Widget e) => e).toList()),
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
