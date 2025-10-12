
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:riverpod/src/notifier.dart';

import '../../models/route_line_model.dart';

class RouteLinesNotifier extends Notifier<List<RouteLineModel>> {
  @override
  List<RouteLineModel> build() => <RouteLineModel>[];

  void clear() => state = <RouteLineModel>[];

  void addOrMoveToLast(RouteLineModel line) {
    final List<RouteLineModel> next = <RouteLineModel>[...state]..removeWhere((RouteLineModel r) => r.id == line.id);
    next.add(line);
    state = next;
  }

  void removeLast() {
    if (state.isEmpty) {
      return;
    }
    state = <RouteLineModel>[...state]..removeLast();
  }
}

// ignore: invalid_use_of_internal_member
final NotifierProviderImpl<RouteLinesNotifier, List<RouteLineModel>> routeLinesProvider =
    NotifierProvider<RouteLinesNotifier, List<RouteLineModel>>(() {
      return RouteLinesNotifier();
    });
