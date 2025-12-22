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
  List<RouteLineModel> get routeLineModelList =>
      throw _privateConstructorUsedError;

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
  $Res call({List<RouteLineModel> routeLineModelList});
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
    Object? routeLineModelList = null,
  }) {
    return _then(_value.copyWith(
      routeLineModelList: null == routeLineModelList
          ? _value.routeLineModelList
          : routeLineModelList // ignore: cast_nullable_to_non_nullable
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
  $Res call({List<RouteLineModel> routeLineModelList});
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
    Object? routeLineModelList = null,
  }) {
    return _then(_$RouteLinesStateImpl(
      routeLineModelList: null == routeLineModelList
          ? _value._routeLineModelList
          : routeLineModelList // ignore: cast_nullable_to_non_nullable
              as List<RouteLineModel>,
    ));
  }
}

/// @nodoc

class _$RouteLinesStateImpl implements _RouteLinesState {
  const _$RouteLinesStateImpl(
      {final List<RouteLineModel> routeLineModelList =
          const <RouteLineModel>[]})
      : _routeLineModelList = routeLineModelList;

  final List<RouteLineModel> _routeLineModelList;
  @override
  @JsonKey()
  List<RouteLineModel> get routeLineModelList {
    if (_routeLineModelList is EqualUnmodifiableListView)
      return _routeLineModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routeLineModelList);
  }

  @override
  String toString() {
    return 'RouteLinesState(routeLineModelList: $routeLineModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteLinesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._routeLineModelList, _routeLineModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_routeLineModelList));

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
      {final List<RouteLineModel> routeLineModelList}) = _$RouteLinesStateImpl;

  @override
  List<RouteLineModel> get routeLineModelList;

  /// Create a copy of RouteLinesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteLinesStateImplCopyWith<_$RouteLinesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
