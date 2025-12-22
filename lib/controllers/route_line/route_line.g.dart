// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_line.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableRouteLinesHash() =>
    r'66678fa0074d7d615555f073d94e4d661e3c2341';

/// ----------------------------------------------------------------------
/// ボタン表示用：固定ルート一覧（常に存在する）
/// これは「表示中のルート」ではないので、RouteLinesState とは分離します。
/// ----------------------------------------------------------------------
///
/// Copied from [availableRouteLines].
@ProviderFor(availableRouteLines)
final availableRouteLinesProvider =
    AutoDisposeProvider<List<RouteLineModel>>.internal(
  availableRouteLines,
  name: r'availableRouteLinesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableRouteLinesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableRouteLinesRef = AutoDisposeProviderRef<List<RouteLineModel>>;
String _$routeLinesHash() => r'3fea74ae8e30c94cc50216f27c824912e7ad7a89';

/// ----------------------------------------------------------------------
/// Map表示用：現在表示しているルート順（ここだけが state）
/// ----------------------------------------------------------------------
///
/// Copied from [RouteLines].
@ProviderFor(RouteLines)
final routeLinesProvider =
    AutoDisposeNotifierProvider<RouteLines, RouteLinesState>.internal(
  RouteLines.new,
  name: r'routeLinesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routeLinesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RouteLines = AutoDisposeNotifier<RouteLinesState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
