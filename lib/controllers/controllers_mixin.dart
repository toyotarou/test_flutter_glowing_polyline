import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route_line/route_line.dart';

mixin ControllersMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  //==========================================//

  RouteLinesState get routeLinesState => ref.watch(routeLinesProvider);

  RouteLines get routeLinesNotifier => ref.read(routeLinesProvider.notifier);

  //==========================================//
}
