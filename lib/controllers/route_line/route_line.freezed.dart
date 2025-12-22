// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteLinesState {
  List<RouteLineModel> get availableRoutes =>
      throw _privateConstructorUsedError;
  List<RouteLineModel> get activeRoutes => throw _privateConstructorUsedError;

  /// Create a copy of RouteLinesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteLinesStateCopyWith<RouteLinesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteLinesStateCopyWith<$Res> {
  factory $RouteLinesStateCopyWith(
          RouteLinesState value, $Res Function(RouteLinesState) then) =
      _$RouteLinesStateCopyWithImpl<$Res, RouteLinesState>;
  @useResult
  $Res call(
      {List<RouteLineModel> availableRoutes,
      List<RouteLineModel> activeRoutes});
}

/// @nodoc
class _$RouteLinesStateCopyWithImpl<$Res, $Val extends RouteLinesState>
    implements $RouteLinesStateCopyWith<$Res> {
  _$RouteLinesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteLinesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableRoutes = null,
    Object? activeRoutes = null,
  }) {
    return _then(_value.copyWith(
      availableRoutes: null == availableRoutes
          ? _value.availableRoutes
          : availableRoutes // ignore: cast_nullable_to_non_nullable
              as List<RouteLineModel>,
      activeRoutes: null == activeRoutes
          ? _value.activeRoutes
          : activeRoutes // ignore: cast_nullable_to_non_nullable
              as List<RouteLineModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteLinesStateImplCopyWith<$Res>
    implements $RouteLinesStateCopyWith<$Res> {
  factory _$$RouteLinesStateImplCopyWith(_$RouteLinesStateImpl value,
          $Res Function(_$RouteLinesStateImpl) then) =
      __$$RouteLinesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RouteLineModel> availableRoutes,
      List<RouteLineModel> activeRoutes});
}

/// @nodoc
class __$$RouteLinesStateImplCopyWithImpl<$Res>
    extends _$RouteLinesStateCopyWithImpl<$Res, _$RouteLinesStateImpl>
    implements _$$RouteLinesStateImplCopyWith<$Res> {
  __$$RouteLinesStateImplCopyWithImpl(
      _$RouteLinesStateImpl _value, $Res Function(_$RouteLinesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteLinesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableRoutes = null,
    Object? activeRoutes = null,
  }) {
    return _then(_$RouteLinesStateImpl(
      availableRoutes: null == availableRoutes
          ? _value._availableRoutes
          : availableRoutes // ignore: cast_nullable_to_non_nullable
              as List<RouteLineModel>,
      activeRoutes: null == activeRoutes
          ? _value._activeRoutes
          : activeRoutes // ignore: cast_nullable_to_non_nullable
              as List<RouteLineModel>,
    ));
  }
}

/// @nodoc

class _$RouteLinesStateImpl implements _RouteLinesState {
  const _$RouteLinesStateImpl(
      {final List<RouteLineModel> availableRoutes = const <RouteLineModel>[],
      final List<RouteLineModel> activeRoutes = const <RouteLineModel>[]})
      : _availableRoutes = availableRoutes,
        _activeRoutes = activeRoutes;

  final List<RouteLineModel> _availableRoutes;
  @override
  @JsonKey()
  List<RouteLineModel> get availableRoutes {
    if (_availableRoutes is EqualUnmodifiableListView) return _availableRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableRoutes);
  }

  final List<RouteLineModel> _activeRoutes;
  @override
  @JsonKey()
  List<RouteLineModel> get activeRoutes {
    if (_activeRoutes is EqualUnmodifiableListView) return _activeRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeRoutes);
  }

  @override
  String toString() {
    return 'RouteLinesState(availableRoutes: $availableRoutes, activeRoutes: $activeRoutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteLinesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._availableRoutes, _availableRoutes) &&
            const DeepCollectionEquality()
                .equals(other._activeRoutes, _activeRoutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableRoutes),
      const DeepCollectionEquality().hash(_activeRoutes));

  /// Create a copy of RouteLinesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteLinesStateImplCopyWith<_$RouteLinesStateImpl> get copyWith =>
      __$$RouteLinesStateImplCopyWithImpl<_$RouteLinesStateImpl>(
          this, _$identity);
}

abstract class _RouteLinesState implements RouteLinesState {
  const factory _RouteLinesState(
      {final List<RouteLineModel> availableRoutes,
      final List<RouteLineModel> activeRoutes}) = _$RouteLinesStateImpl;

  @override
  List<RouteLineModel> get availableRoutes;
  @override
  List<RouteLineModel> get activeRoutes;

  /// Create a copy of RouteLinesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteLinesStateImplCopyWith<_$RouteLinesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
