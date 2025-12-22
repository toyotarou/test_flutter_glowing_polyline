import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/route_line_model.dart';

part 'route_line.freezed.dart';

part 'route_line.g.dart';

@freezed
class RouteLinesState with _$RouteLinesState {
  const factory RouteLinesState({
    @Default(<RouteLineModel>[]) List<RouteLineModel> availableRoutes,

    @Default(<RouteLineModel>[]) List<RouteLineModel> activeRoutes,
  }) = _RouteLinesState;
}

@riverpod
class RouteLines extends _$RouteLines {
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

  ///
  @override
  RouteLinesState build() {
    return RouteLinesState(
      availableRoutes: <RouteLineModel>[
        RouteLineModel(id: 'a', label: 'a: 巣鴨→田端', points: <LatLng>[_sugamo, _tabata]),
        RouteLineModel(
          id: 'b',
          label: 'b: お茶の水→東京',
          points: <LatLng>[_ochanomizu, _tokyo],
          coreColor: Colors.pinkAccent,
          glowColor: Colors.pink,
        ),
        RouteLineModel(
          id: 'c',
          label: 'c: 池袋→早稲田',
          points: <LatLng>[_ikebukuro, _waseda],
          coreColor: Colors.orangeAccent,
          glowColor: Colors.deepOrange,
        ),
        RouteLineModel(
          id: 'd',
          label: 'd: 赤坂→新橋',
          points: <LatLng>[_akasaka, _shimbashi],
          coreColor: Colors.lightGreenAccent,
          glowColor: Colors.green,
        ),
        RouteLineModel(
          id: 'e',
          label: 'e: 六本木→飯田橋',
          points: <LatLng>[_roppongi, _iidabashi],
          coreColor: Colors.amberAccent,
          glowColor: Colors.amber,
        ),
      ],
    );
  }

  ///
  void clearActiveRoutes() {
    state = state.copyWith(activeRoutes: <RouteLineModel>[]);
  }

  ///
  void addOrMoveToLast(RouteLineModel line) {
    final List<RouteLineModel> next = <RouteLineModel>[...state.activeRoutes]
      ..removeWhere((RouteLineModel r) => r.id == line.id);

    next.add(line);

    state = state.copyWith(activeRoutes: next);
  }

  ///
  void removeLast() {
    if (state.activeRoutes.isEmpty) {
      return;
    }

    final List<RouteLineModel> next = List<RouteLineModel>.from(state.activeRoutes)..removeLast();

    state = state.copyWith(activeRoutes: next);
  }

  ///
  void setAvailableRoutes(List<RouteLineModel> routes) {
    state = state.copyWith(availableRoutes: routes);
  }
}
