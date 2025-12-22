import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/route_line_model.dart';

part 'route_line.freezed.dart';

part 'route_line.g.dart';

@freezed
class RouteLinesState with _$RouteLinesState {
  const factory RouteLinesState({@Default(<RouteLineModel>[]) List<RouteLineModel> routeLineModelList}) =
      _RouteLinesState;
}

/// ----------------------------------------------------------------------
/// ボタン表示用：固定ルート一覧（常に存在する）
/// これは「表示中のルート」ではないので、RouteLinesState とは分離します。
/// ----------------------------------------------------------------------
@riverpod
List<RouteLineModel> availableRouteLines(AvailableRouteLinesRef ref) {
  const LatLng sugamo = LatLng(35.7335, 139.7392);
  const LatLng tabata = LatLng(35.7380, 139.7610);

  const LatLng ochanomizu = LatLng(35.6992, 139.7650);
  const LatLng tokyo = LatLng(35.681236, 139.767125);

  const LatLng ikebukuro = LatLng(35.728926, 139.71038);
  const LatLng waseda = LatLng(35.7058, 139.7192);

  const LatLng akasaka = LatLng(35.6720, 139.7360);
  const LatLng shimbashi = LatLng(35.6664, 139.7580);

  const LatLng roppongi = LatLng(35.6640, 139.7290);
  const LatLng iidabashi = LatLng(35.7021, 139.7460);

  return <RouteLineModel>[
    RouteLineModel(
      id: 'a',
      label: 'a: 巣鴨→田端',
      points: <LatLng>[sugamo, tabata],
      coreColor: Colors.cyanAccent,
      glowColor: Colors.cyan,
    ),
    RouteLineModel(
      id: 'b',
      label: 'b: お茶の水→東京',
      points: <LatLng>[ochanomizu, tokyo],
      coreColor: Colors.pinkAccent,
      glowColor: Colors.pink,
    ),
    RouteLineModel(
      id: 'c',
      label: 'c: 池袋→早稲田',
      points: <LatLng>[ikebukuro, waseda],
      coreColor: Colors.orangeAccent,
      glowColor: Colors.deepOrange,
    ),
    RouteLineModel(
      id: 'd',
      label: 'd: 赤坂→新橋',
      points: <LatLng>[akasaka, shimbashi],
      coreColor: Colors.lightGreenAccent,
      glowColor: Colors.green,
    ),
    RouteLineModel(
      id: 'e',
      label: 'e: 六本木→飯田橋',
      points: <LatLng>[roppongi, iidabashi],
      coreColor: Colors.amberAccent,
      glowColor: Colors.amber,
    ),
  ];
}

/// ----------------------------------------------------------------------
/// Map表示用：現在表示しているルート順（ここだけが state）
/// ----------------------------------------------------------------------
@riverpod
class RouteLines extends _$RouteLines {
  @override
  RouteLinesState build() {
    // 初期表示は「表示中ルートなし」(ボタンで追加)
    return const RouteLinesState();
  }

  void clear() {
    // 表示中だけ消す。ボタン用ルートは availableRouteLinesProvider から出るので消えない。
    state = const RouteLinesState();
  }

  void addOrMoveToLast(RouteLineModel line) {
    final List<RouteLineModel> next = <RouteLineModel>[...state.routeLineModelList]
      ..removeWhere((RouteLineModel r) => r.id == line.id);

    next.add(line);

    state = state.copyWith(routeLineModelList: next);
  }

  void removeLast() {
    if (state.routeLineModelList.isEmpty) {
      return;
    }

    final List<RouteLineModel> next = List<RouteLineModel>.from(state.routeLineModelList)..removeLast();

    state = state.copyWith(routeLineModelList: next);
  }
}
