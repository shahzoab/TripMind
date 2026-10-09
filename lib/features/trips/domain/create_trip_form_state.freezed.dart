// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_trip_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTripFormState {

 String get destination; double? get destinationLat; double? get destinationLng; DateTime? get startDate; DateTime? get endDate; TripStyle? get travelStyle; BudgetTier get budgetTier; DailyPace get dailyPace;
/// Create a copy of CreateTripFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTripFormStateCopyWith<CreateTripFormState> get copyWith => _$CreateTripFormStateCopyWithImpl<CreateTripFormState>(this as CreateTripFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CreateTripFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTripFormState&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.destinationLat, _this.destinationLat) || other.destinationLat == _this.destinationLat)&&(identical(other.destinationLng, _this.destinationLng) || other.destinationLng == _this.destinationLng)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.travelStyle, _this.travelStyle) || other.travelStyle == _this.travelStyle)&&(identical(other.budgetTier, _this.budgetTier) || other.budgetTier == _this.budgetTier)&&(identical(other.dailyPace, _this.dailyPace) || other.dailyPace == _this.dailyPace));
}


@override
int get hashCode {
  final _this = this as CreateTripFormState;
  return Object.hash(runtimeType,_this.destination,_this.destinationLat,_this.destinationLng,_this.startDate,_this.endDate,_this.travelStyle,_this.budgetTier,_this.dailyPace);
}

@override
String toString() {
  final _this = this as CreateTripFormState;
  return 'CreateTripFormState(destination: ${_this.destination}, destinationLat: ${_this.destinationLat}, destinationLng: ${_this.destinationLng}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, travelStyle: ${_this.travelStyle}, budgetTier: ${_this.budgetTier}, dailyPace: ${_this.dailyPace})';
}


}

/// @nodoc
abstract mixin class $CreateTripFormStateCopyWith<$Res>  {
  factory $CreateTripFormStateCopyWith(CreateTripFormState value, $Res Function(CreateTripFormState) _then) = _$CreateTripFormStateCopyWithImpl;
@useResult
$Res call({
 String destination, double? destinationLat, double? destinationLng, DateTime? startDate, DateTime? endDate, TripStyle? travelStyle, BudgetTier budgetTier, DailyPace dailyPace
});




}
/// @nodoc
class _$CreateTripFormStateCopyWithImpl<$Res>
    implements $CreateTripFormStateCopyWith<$Res> {
  _$CreateTripFormStateCopyWithImpl(this._self, this._then);

  final CreateTripFormState _self;
  final $Res Function(CreateTripFormState) _then;

/// Create a copy of CreateTripFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destination = null,Object? destinationLat = freezed,Object? destinationLng = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? travelStyle = freezed,Object? budgetTier = null,Object? dailyPace = null,}) {
  return _then(CreateTripFormState(
destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,destinationLat: freezed == destinationLat ? _self.destinationLat : destinationLat // ignore: cast_nullable_to_non_nullable
as double?,destinationLng: freezed == destinationLng ? _self.destinationLng : destinationLng // ignore: cast_nullable_to_non_nullable
as double?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,travelStyle: freezed == travelStyle ? _self.travelStyle : travelStyle // ignore: cast_nullable_to_non_nullable
as TripStyle?,budgetTier: null == budgetTier ? _self.budgetTier : budgetTier // ignore: cast_nullable_to_non_nullable
as BudgetTier,dailyPace: null == dailyPace ? _self.dailyPace : dailyPace // ignore: cast_nullable_to_non_nullable
as DailyPace,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTripFormState].
extension CreateTripFormStatePatterns on CreateTripFormState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTripFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTripFormState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTripFormState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTripFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTripFormState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTripFormState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String destination,  double? destinationLat,  double? destinationLng,  DateTime? startDate,  DateTime? endDate,  TripStyle? travelStyle,  BudgetTier budgetTier,  DailyPace dailyPace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTripFormState() when $default != null:
return $default(_that.destination,_that.destinationLat,_that.destinationLng,_that.startDate,_that.endDate,_that.travelStyle,_that.budgetTier,_that.dailyPace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String destination,  double? destinationLat,  double? destinationLng,  DateTime? startDate,  DateTime? endDate,  TripStyle? travelStyle,  BudgetTier budgetTier,  DailyPace dailyPace)  $default,) {final _that = this;
switch (_that) {
case _CreateTripFormState():
return $default(_that.destination,_that.destinationLat,_that.destinationLng,_that.startDate,_that.endDate,_that.travelStyle,_that.budgetTier,_that.dailyPace);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String destination,  double? destinationLat,  double? destinationLng,  DateTime? startDate,  DateTime? endDate,  TripStyle? travelStyle,  BudgetTier budgetTier,  DailyPace dailyPace)?  $default,) {final _that = this;
switch (_that) {
case _CreateTripFormState() when $default != null:
return $default(_that.destination,_that.destinationLat,_that.destinationLng,_that.startDate,_that.endDate,_that.travelStyle,_that.budgetTier,_that.dailyPace);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTripFormState extends CreateTripFormState {
  const _CreateTripFormState({this.destination = 'Kyoto, Japan', this.destinationLat = 35.0116, this.destinationLng = 135.7681, this.startDate, this.endDate, this.travelStyle, this.budgetTier = BudgetTier.moderate, this.dailyPace = DailyPace.balanced}): super._();
  

@override@JsonKey() final  String destination;
@override@JsonKey() final  double? destinationLat;
@override@JsonKey() final  double? destinationLng;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  TripStyle? travelStyle;
@override@JsonKey() final  BudgetTier budgetTier;
@override@JsonKey() final  DailyPace dailyPace;

/// Create a copy of CreateTripFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTripFormStateCopyWith<_CreateTripFormState> get copyWith => __$CreateTripFormStateCopyWithImpl<_CreateTripFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTripFormState&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.destinationLat, destinationLat) || other.destinationLat == destinationLat)&&(identical(other.destinationLng, destinationLng) || other.destinationLng == destinationLng)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.travelStyle, travelStyle) || other.travelStyle == travelStyle)&&(identical(other.budgetTier, budgetTier) || other.budgetTier == budgetTier)&&(identical(other.dailyPace, dailyPace) || other.dailyPace == dailyPace));
}


@override
int get hashCode {
    return Object.hash(runtimeType,destination,destinationLat,destinationLng,startDate,endDate,travelStyle,budgetTier,dailyPace);
}

@override
String toString() {
    return 'CreateTripFormState(destination: $destination, destinationLat: $destinationLat, destinationLng: $destinationLng, startDate: $startDate, endDate: $endDate, travelStyle: $travelStyle, budgetTier: $budgetTier, dailyPace: $dailyPace)';
}


}

/// @nodoc
abstract mixin class _$CreateTripFormStateCopyWith<$Res> implements $CreateTripFormStateCopyWith<$Res> {
  factory _$CreateTripFormStateCopyWith(_CreateTripFormState value, $Res Function(_CreateTripFormState) _then) = __$CreateTripFormStateCopyWithImpl;
@override @useResult
$Res call({
 String destination, double? destinationLat, double? destinationLng, DateTime? startDate, DateTime? endDate, TripStyle? travelStyle, BudgetTier budgetTier, DailyPace dailyPace
});




}
/// @nodoc
class __$CreateTripFormStateCopyWithImpl<$Res>
    implements _$CreateTripFormStateCopyWith<$Res> {
  __$CreateTripFormStateCopyWithImpl(this._self, this._then);

  final _CreateTripFormState _self;
  final $Res Function(_CreateTripFormState) _then;

/// Create a copy of CreateTripFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destination = null,Object? destinationLat = freezed,Object? destinationLng = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? travelStyle = freezed,Object? budgetTier = null,Object? dailyPace = null,}) {
  return _then(_CreateTripFormState(
destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,destinationLat: freezed == destinationLat ? _self.destinationLat : destinationLat // ignore: cast_nullable_to_non_nullable
as double?,destinationLng: freezed == destinationLng ? _self.destinationLng : destinationLng // ignore: cast_nullable_to_non_nullable
as double?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,travelStyle: freezed == travelStyle ? _self.travelStyle : travelStyle // ignore: cast_nullable_to_non_nullable
as TripStyle?,budgetTier: null == budgetTier ? _self.budgetTier : budgetTier // ignore: cast_nullable_to_non_nullable
as BudgetTier,dailyPace: null == dailyPace ? _self.dailyPace : dailyPace // ignore: cast_nullable_to_non_nullable
as DailyPace,
  ));
}


}

// dart format on
