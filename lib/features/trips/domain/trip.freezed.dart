// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripTransit {

 String get label; String? get cost;
/// Create a copy of TripTransit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripTransitCopyWith<TripTransit> get copyWith => _$TripTransitCopyWithImpl<TripTransit>(this as TripTransit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripTransit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripTransit&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.cost, _this.cost) || other.cost == _this.cost));
}


@override
int get hashCode {
  final _this = this as TripTransit;
  return Object.hash(runtimeType,_this.label,_this.cost);
}

@override
String toString() {
  final _this = this as TripTransit;
  return 'TripTransit(label: ${_this.label}, cost: ${_this.cost})';
}


}

/// @nodoc
abstract mixin class $TripTransitCopyWith<$Res>  {
  factory $TripTransitCopyWith(TripTransit value, $Res Function(TripTransit) _then) = _$TripTransitCopyWithImpl;
@useResult
$Res call({
 String label, String? cost
});




}
/// @nodoc
class _$TripTransitCopyWithImpl<$Res>
    implements $TripTransitCopyWith<$Res> {
  _$TripTransitCopyWithImpl(this._self, this._then);

  final TripTransit _self;
  final $Res Function(TripTransit) _then;

/// Create a copy of TripTransit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? cost = freezed,}) {
  return _then(TripTransit(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripTransit].
extension TripTransitPatterns on TripTransit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripTransit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripTransit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripTransit value)  $default,){
final _that = this;
switch (_that) {
case _TripTransit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripTransit value)?  $default,){
final _that = this;
switch (_that) {
case _TripTransit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String? cost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripTransit() when $default != null:
return $default(_that.label,_that.cost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String? cost)  $default,) {final _that = this;
switch (_that) {
case _TripTransit():
return $default(_that.label,_that.cost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String? cost)?  $default,) {final _that = this;
switch (_that) {
case _TripTransit() when $default != null:
return $default(_that.label,_that.cost);case _:
  return null;

}
}

}

/// @nodoc


class _TripTransit implements TripTransit {
  const _TripTransit({required this.label, this.cost});
  

@override final  String label;
@override final  String? cost;

/// Create a copy of TripTransit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripTransitCopyWith<_TripTransit> get copyWith => __$TripTransitCopyWithImpl<_TripTransit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripTransit&&(identical(other.label, label) || other.label == label)&&(identical(other.cost, cost) || other.cost == cost));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,cost);
}

@override
String toString() {
    return 'TripTransit(label: $label, cost: $cost)';
}


}

/// @nodoc
abstract mixin class _$TripTransitCopyWith<$Res> implements $TripTransitCopyWith<$Res> {
  factory _$TripTransitCopyWith(_TripTransit value, $Res Function(_TripTransit) _then) = __$TripTransitCopyWithImpl;
@override @useResult
$Res call({
 String label, String? cost
});




}
/// @nodoc
class __$TripTransitCopyWithImpl<$Res>
    implements _$TripTransitCopyWith<$Res> {
  __$TripTransitCopyWithImpl(this._self, this._then);

  final _TripTransit _self;
  final $Res Function(_TripTransit) _then;

/// Create a copy of TripTransit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? cost = freezed,}) {
  return _then(_TripTransit(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$TripStop {

 String get id; String get timeLabel; String get durationLabel; StopStatus get status; String get title; String get description; CategoryType get category; String? get photoAsset; String? get bookingReference; TripTransit? get transitAfter;
/// Create a copy of TripStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripStopCopyWith<TripStop> get copyWith => _$TripStopCopyWithImpl<TripStop>(this as TripStop, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripStop;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripStop&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.timeLabel, _this.timeLabel) || other.timeLabel == _this.timeLabel)&&(identical(other.durationLabel, _this.durationLabel) || other.durationLabel == _this.durationLabel)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.photoAsset, _this.photoAsset) || other.photoAsset == _this.photoAsset)&&(identical(other.bookingReference, _this.bookingReference) || other.bookingReference == _this.bookingReference)&&(identical(other.transitAfter, _this.transitAfter) || other.transitAfter == _this.transitAfter));
}


@override
int get hashCode {
  final _this = this as TripStop;
  return Object.hash(runtimeType,_this.id,_this.timeLabel,_this.durationLabel,_this.status,_this.title,_this.description,_this.category,_this.photoAsset,_this.bookingReference,_this.transitAfter);
}

@override
String toString() {
  final _this = this as TripStop;
  return 'TripStop(id: ${_this.id}, timeLabel: ${_this.timeLabel}, durationLabel: ${_this.durationLabel}, status: ${_this.status}, title: ${_this.title}, description: ${_this.description}, category: ${_this.category}, photoAsset: ${_this.photoAsset}, bookingReference: ${_this.bookingReference}, transitAfter: ${_this.transitAfter})';
}


}

/// @nodoc
abstract mixin class $TripStopCopyWith<$Res>  {
  factory $TripStopCopyWith(TripStop value, $Res Function(TripStop) _then) = _$TripStopCopyWithImpl;
@useResult
$Res call({
 String id, String timeLabel, String durationLabel, StopStatus status, String title, String description, CategoryType category, String? photoAsset, String? bookingReference, TripTransit? transitAfter
});


$TripTransitCopyWith<$Res>? get transitAfter;

}
/// @nodoc
class _$TripStopCopyWithImpl<$Res>
    implements $TripStopCopyWith<$Res> {
  _$TripStopCopyWithImpl(this._self, this._then);

  final TripStop _self;
  final $Res Function(TripStop) _then;

/// Create a copy of TripStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timeLabel = null,Object? durationLabel = null,Object? status = null,Object? title = null,Object? description = null,Object? category = null,Object? photoAsset = freezed,Object? bookingReference = freezed,Object? transitAfter = freezed,}) {
  return _then(TripStop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,durationLabel: null == durationLabel ? _self.durationLabel : durationLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StopStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryType,photoAsset: freezed == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String?,bookingReference: freezed == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String?,transitAfter: freezed == transitAfter ? _self.transitAfter : transitAfter // ignore: cast_nullable_to_non_nullable
as TripTransit?,
  ));
}
/// Create a copy of TripStop
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripTransitCopyWith<$Res>? get transitAfter {
    if (_self.transitAfter == null) {
    return null;
  }

  return $TripTransitCopyWith<$Res>(_self.transitAfter!, (value) {
    return _then(_self.copyWith(transitAfter: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripStop].
extension TripStopPatterns on TripStop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripStop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripStop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripStop value)  $default,){
final _that = this;
switch (_that) {
case _TripStop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripStop value)?  $default,){
final _that = this;
switch (_that) {
case _TripStop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String timeLabel,  String durationLabel,  StopStatus status,  String title,  String description,  CategoryType category,  String? photoAsset,  String? bookingReference,  TripTransit? transitAfter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripStop() when $default != null:
return $default(_that.id,_that.timeLabel,_that.durationLabel,_that.status,_that.title,_that.description,_that.category,_that.photoAsset,_that.bookingReference,_that.transitAfter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String timeLabel,  String durationLabel,  StopStatus status,  String title,  String description,  CategoryType category,  String? photoAsset,  String? bookingReference,  TripTransit? transitAfter)  $default,) {final _that = this;
switch (_that) {
case _TripStop():
return $default(_that.id,_that.timeLabel,_that.durationLabel,_that.status,_that.title,_that.description,_that.category,_that.photoAsset,_that.bookingReference,_that.transitAfter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String timeLabel,  String durationLabel,  StopStatus status,  String title,  String description,  CategoryType category,  String? photoAsset,  String? bookingReference,  TripTransit? transitAfter)?  $default,) {final _that = this;
switch (_that) {
case _TripStop() when $default != null:
return $default(_that.id,_that.timeLabel,_that.durationLabel,_that.status,_that.title,_that.description,_that.category,_that.photoAsset,_that.bookingReference,_that.transitAfter);case _:
  return null;

}
}

}

/// @nodoc


class _TripStop implements TripStop {
  const _TripStop({required this.id, required this.timeLabel, required this.durationLabel, required this.status, required this.title, required this.description, required this.category, this.photoAsset, this.bookingReference, this.transitAfter});
  

@override final  String id;
@override final  String timeLabel;
@override final  String durationLabel;
@override final  StopStatus status;
@override final  String title;
@override final  String description;
@override final  CategoryType category;
@override final  String? photoAsset;
@override final  String? bookingReference;
@override final  TripTransit? transitAfter;

/// Create a copy of TripStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripStopCopyWith<_TripStop> get copyWith => __$TripStopCopyWithImpl<_TripStop>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripStop&&(identical(other.id, id) || other.id == id)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.durationLabel, durationLabel) || other.durationLabel == durationLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset)&&(identical(other.bookingReference, bookingReference) || other.bookingReference == bookingReference)&&(identical(other.transitAfter, transitAfter) || other.transitAfter == transitAfter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,timeLabel,durationLabel,status,title,description,category,photoAsset,bookingReference,transitAfter);
}

@override
String toString() {
    return 'TripStop(id: $id, timeLabel: $timeLabel, durationLabel: $durationLabel, status: $status, title: $title, description: $description, category: $category, photoAsset: $photoAsset, bookingReference: $bookingReference, transitAfter: $transitAfter)';
}


}

/// @nodoc
abstract mixin class _$TripStopCopyWith<$Res> implements $TripStopCopyWith<$Res> {
  factory _$TripStopCopyWith(_TripStop value, $Res Function(_TripStop) _then) = __$TripStopCopyWithImpl;
@override @useResult
$Res call({
 String id, String timeLabel, String durationLabel, StopStatus status, String title, String description, CategoryType category, String? photoAsset, String? bookingReference, TripTransit? transitAfter
});


@override $TripTransitCopyWith<$Res>? get transitAfter;

}
/// @nodoc
class __$TripStopCopyWithImpl<$Res>
    implements _$TripStopCopyWith<$Res> {
  __$TripStopCopyWithImpl(this._self, this._then);

  final _TripStop _self;
  final $Res Function(_TripStop) _then;

/// Create a copy of TripStop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timeLabel = null,Object? durationLabel = null,Object? status = null,Object? title = null,Object? description = null,Object? category = null,Object? photoAsset = freezed,Object? bookingReference = freezed,Object? transitAfter = freezed,}) {
  return _then(_TripStop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,durationLabel: null == durationLabel ? _self.durationLabel : durationLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StopStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryType,photoAsset: freezed == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String?,bookingReference: freezed == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String?,transitAfter: freezed == transitAfter ? _self.transitAfter : transitAfter // ignore: cast_nullable_to_non_nullable
as TripTransit?,
  ));
}

/// Create a copy of TripStop
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripTransitCopyWith<$Res>? get transitAfter {
    if (_self.transitAfter == null) {
    return null;
  }

  return $TripTransitCopyWith<$Res>(_self.transitAfter!, (value) {
    return _then(_self.copyWith(transitAfter: value));
  });
}
}

/// @nodoc
mixin _$TripDay {

 int get dayNumber; DateTime get date; String get title; String get weatherLabel; String get walkingLabel; String get pacingLabel; List<TripStop> get stops;
/// Create a copy of TripDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDayCopyWith<TripDay> get copyWith => _$TripDayCopyWithImpl<TripDay>(this as TripDay, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDay&&(identical(other.dayNumber, _this.dayNumber) || other.dayNumber == _this.dayNumber)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.weatherLabel, _this.weatherLabel) || other.weatherLabel == _this.weatherLabel)&&(identical(other.walkingLabel, _this.walkingLabel) || other.walkingLabel == _this.walkingLabel)&&(identical(other.pacingLabel, _this.pacingLabel) || other.pacingLabel == _this.pacingLabel)&&const DeepCollectionEquality().equals(other.stops, _this.stops));
}


@override
int get hashCode {
  final _this = this as TripDay;
  return Object.hash(runtimeType,_this.dayNumber,_this.date,_this.title,_this.weatherLabel,_this.walkingLabel,_this.pacingLabel,const DeepCollectionEquality().hash(_this.stops));
}

@override
String toString() {
  final _this = this as TripDay;
  return 'TripDay(dayNumber: ${_this.dayNumber}, date: ${_this.date}, title: ${_this.title}, weatherLabel: ${_this.weatherLabel}, walkingLabel: ${_this.walkingLabel}, pacingLabel: ${_this.pacingLabel}, stops: ${_this.stops})';
}


}

/// @nodoc
abstract mixin class $TripDayCopyWith<$Res>  {
  factory $TripDayCopyWith(TripDay value, $Res Function(TripDay) _then) = _$TripDayCopyWithImpl;
@useResult
$Res call({
 int dayNumber, DateTime date, String title, String weatherLabel, String walkingLabel, String pacingLabel, List<TripStop> stops
});




}
/// @nodoc
class _$TripDayCopyWithImpl<$Res>
    implements $TripDayCopyWith<$Res> {
  _$TripDayCopyWithImpl(this._self, this._then);

  final TripDay _self;
  final $Res Function(TripDay) _then;

/// Create a copy of TripDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayNumber = null,Object? date = null,Object? title = null,Object? weatherLabel = null,Object? walkingLabel = null,Object? pacingLabel = null,Object? stops = null,}) {
  return _then(TripDay(
dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,weatherLabel: null == weatherLabel ? _self.weatherLabel : weatherLabel // ignore: cast_nullable_to_non_nullable
as String,walkingLabel: null == walkingLabel ? _self.walkingLabel : walkingLabel // ignore: cast_nullable_to_non_nullable
as String,pacingLabel: null == pacingLabel ? _self.pacingLabel : pacingLabel // ignore: cast_nullable_to_non_nullable
as String,stops: null == stops ? _self.stops : stops // ignore: cast_nullable_to_non_nullable
as List<TripStop>,
  ));
}

}


/// Adds pattern-matching-related methods to [TripDay].
extension TripDayPatterns on TripDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripDay value)  $default,){
final _that = this;
switch (_that) {
case _TripDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripDay value)?  $default,){
final _that = this;
switch (_that) {
case _TripDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dayNumber,  DateTime date,  String title,  String weatherLabel,  String walkingLabel,  String pacingLabel,  List<TripStop> stops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripDay() when $default != null:
return $default(_that.dayNumber,_that.date,_that.title,_that.weatherLabel,_that.walkingLabel,_that.pacingLabel,_that.stops);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dayNumber,  DateTime date,  String title,  String weatherLabel,  String walkingLabel,  String pacingLabel,  List<TripStop> stops)  $default,) {final _that = this;
switch (_that) {
case _TripDay():
return $default(_that.dayNumber,_that.date,_that.title,_that.weatherLabel,_that.walkingLabel,_that.pacingLabel,_that.stops);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dayNumber,  DateTime date,  String title,  String weatherLabel,  String walkingLabel,  String pacingLabel,  List<TripStop> stops)?  $default,) {final _that = this;
switch (_that) {
case _TripDay() when $default != null:
return $default(_that.dayNumber,_that.date,_that.title,_that.weatherLabel,_that.walkingLabel,_that.pacingLabel,_that.stops);case _:
  return null;

}
}

}

/// @nodoc


class _TripDay implements TripDay {
  const _TripDay({required this.dayNumber, required this.date, required this.title, required this.weatherLabel, required this.walkingLabel, required this.pacingLabel, required  List<TripStop> stops}): _stops = stops;
  

@override final  int dayNumber;
@override final  DateTime date;
@override final  String title;
@override final  String weatherLabel;
@override final  String walkingLabel;
@override final  String pacingLabel;
 final  List<TripStop> _stops;
@override List<TripStop> get stops {
  if (_stops is EqualUnmodifiableListView) return _stops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stops);
}


/// Create a copy of TripDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripDayCopyWith<_TripDay> get copyWith => __$TripDayCopyWithImpl<_TripDay>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripDay&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.title, title) || other.title == title)&&(identical(other.weatherLabel, weatherLabel) || other.weatherLabel == weatherLabel)&&(identical(other.walkingLabel, walkingLabel) || other.walkingLabel == walkingLabel)&&(identical(other.pacingLabel, pacingLabel) || other.pacingLabel == pacingLabel)&&const DeepCollectionEquality().equals(other.stops, _stops));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dayNumber,date,title,weatherLabel,walkingLabel,pacingLabel,const DeepCollectionEquality().hash(_stops));
}

@override
String toString() {
    return 'TripDay(dayNumber: $dayNumber, date: $date, title: $title, weatherLabel: $weatherLabel, walkingLabel: $walkingLabel, pacingLabel: $pacingLabel, stops: $stops)';
}


}

/// @nodoc
abstract mixin class _$TripDayCopyWith<$Res> implements $TripDayCopyWith<$Res> {
  factory _$TripDayCopyWith(_TripDay value, $Res Function(_TripDay) _then) = __$TripDayCopyWithImpl;
@override @useResult
$Res call({
 int dayNumber, DateTime date, String title, String weatherLabel, String walkingLabel, String pacingLabel, List<TripStop> stops
});




}
/// @nodoc
class __$TripDayCopyWithImpl<$Res>
    implements _$TripDayCopyWith<$Res> {
  __$TripDayCopyWithImpl(this._self, this._then);

  final _TripDay _self;
  final $Res Function(_TripDay) _then;

/// Create a copy of TripDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayNumber = null,Object? date = null,Object? title = null,Object? weatherLabel = null,Object? walkingLabel = null,Object? pacingLabel = null,Object? stops = null,}) {
  return _then(_TripDay(
dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,weatherLabel: null == weatherLabel ? _self.weatherLabel : weatherLabel // ignore: cast_nullable_to_non_nullable
as String,walkingLabel: null == walkingLabel ? _self.walkingLabel : walkingLabel // ignore: cast_nullable_to_non_nullable
as String,pacingLabel: null == pacingLabel ? _self.pacingLabel : pacingLabel // ignore: cast_nullable_to_non_nullable
as String,stops: null == stops ? _self._stops : stops // ignore: cast_nullable_to_non_nullable
as List<TripStop>,
  ));
}


}

/// @nodoc
mixin _$Trip {

 String get id; String get title; String get destination; double? get destinationLat; double? get destinationLng; DateTime get startDate; DateTime get endDate; TripStyle? get travelStyle; BudgetTier get budgetTier; DailyPace get dailyPace; TripSource get source; List<TripDay> get days;
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCopyWith<Trip> get copyWith => _$TripCopyWithImpl<Trip>(this as Trip, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Trip;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trip&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.destinationLat, _this.destinationLat) || other.destinationLat == _this.destinationLat)&&(identical(other.destinationLng, _this.destinationLng) || other.destinationLng == _this.destinationLng)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.travelStyle, _this.travelStyle) || other.travelStyle == _this.travelStyle)&&(identical(other.budgetTier, _this.budgetTier) || other.budgetTier == _this.budgetTier)&&(identical(other.dailyPace, _this.dailyPace) || other.dailyPace == _this.dailyPace)&&(identical(other.source, _this.source) || other.source == _this.source)&&const DeepCollectionEquality().equals(other.days, _this.days));
}


@override
int get hashCode {
  final _this = this as Trip;
  return Object.hash(runtimeType,_this.id,_this.title,_this.destination,_this.destinationLat,_this.destinationLng,_this.startDate,_this.endDate,_this.travelStyle,_this.budgetTier,_this.dailyPace,_this.source,const DeepCollectionEquality().hash(_this.days));
}

@override
String toString() {
  final _this = this as Trip;
  return 'Trip(id: ${_this.id}, title: ${_this.title}, destination: ${_this.destination}, destinationLat: ${_this.destinationLat}, destinationLng: ${_this.destinationLng}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, travelStyle: ${_this.travelStyle}, budgetTier: ${_this.budgetTier}, dailyPace: ${_this.dailyPace}, source: ${_this.source}, days: ${_this.days})';
}


}

/// @nodoc
abstract mixin class $TripCopyWith<$Res>  {
  factory $TripCopyWith(Trip value, $Res Function(Trip) _then) = _$TripCopyWithImpl;
@useResult
$Res call({
 String id, String title, String destination, double? destinationLat, double? destinationLng, DateTime startDate, DateTime endDate, TripStyle? travelStyle, BudgetTier budgetTier, DailyPace dailyPace, TripSource source, List<TripDay> days
});




}
/// @nodoc
class _$TripCopyWithImpl<$Res>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._self, this._then);

  final Trip _self;
  final $Res Function(Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? destination = null,Object? destinationLat = freezed,Object? destinationLng = freezed,Object? startDate = null,Object? endDate = null,Object? travelStyle = freezed,Object? budgetTier = null,Object? dailyPace = null,Object? source = null,Object? days = null,}) {
  return _then(Trip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,destinationLat: freezed == destinationLat ? _self.destinationLat : destinationLat // ignore: cast_nullable_to_non_nullable
as double?,destinationLng: freezed == destinationLng ? _self.destinationLng : destinationLng // ignore: cast_nullable_to_non_nullable
as double?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,travelStyle: freezed == travelStyle ? _self.travelStyle : travelStyle // ignore: cast_nullable_to_non_nullable
as TripStyle?,budgetTier: null == budgetTier ? _self.budgetTier : budgetTier // ignore: cast_nullable_to_non_nullable
as BudgetTier,dailyPace: null == dailyPace ? _self.dailyPace : dailyPace // ignore: cast_nullable_to_non_nullable
as DailyPace,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TripSource,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<TripDay>,
  ));
}

}


/// Adds pattern-matching-related methods to [Trip].
extension TripPatterns on Trip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trip value)  $default,){
final _that = this;
switch (_that) {
case _Trip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trip value)?  $default,){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String destination,  double? destinationLat,  double? destinationLng,  DateTime startDate,  DateTime endDate,  TripStyle? travelStyle,  BudgetTier budgetTier,  DailyPace dailyPace,  TripSource source,  List<TripDay> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.title,_that.destination,_that.destinationLat,_that.destinationLng,_that.startDate,_that.endDate,_that.travelStyle,_that.budgetTier,_that.dailyPace,_that.source,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String destination,  double? destinationLat,  double? destinationLng,  DateTime startDate,  DateTime endDate,  TripStyle? travelStyle,  BudgetTier budgetTier,  DailyPace dailyPace,  TripSource source,  List<TripDay> days)  $default,) {final _that = this;
switch (_that) {
case _Trip():
return $default(_that.id,_that.title,_that.destination,_that.destinationLat,_that.destinationLng,_that.startDate,_that.endDate,_that.travelStyle,_that.budgetTier,_that.dailyPace,_that.source,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String destination,  double? destinationLat,  double? destinationLng,  DateTime startDate,  DateTime endDate,  TripStyle? travelStyle,  BudgetTier budgetTier,  DailyPace dailyPace,  TripSource source,  List<TripDay> days)?  $default,) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.title,_that.destination,_that.destinationLat,_that.destinationLng,_that.startDate,_that.endDate,_that.travelStyle,_that.budgetTier,_that.dailyPace,_that.source,_that.days);case _:
  return null;

}
}

}

/// @nodoc


class _Trip implements Trip {
  const _Trip({required this.id, required this.title, required this.destination, this.destinationLat, this.destinationLng, required this.startDate, required this.endDate, this.travelStyle, required this.budgetTier, required this.dailyPace, required this.source, required  List<TripDay> days}): _days = days;
  

@override final  String id;
@override final  String title;
@override final  String destination;
@override final  double? destinationLat;
@override final  double? destinationLng;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  TripStyle? travelStyle;
@override final  BudgetTier budgetTier;
@override final  DailyPace dailyPace;
@override final  TripSource source;
 final  List<TripDay> _days;
@override List<TripDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCopyWith<_Trip> get copyWith => __$TripCopyWithImpl<_Trip>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.destinationLat, destinationLat) || other.destinationLat == destinationLat)&&(identical(other.destinationLng, destinationLng) || other.destinationLng == destinationLng)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.travelStyle, travelStyle) || other.travelStyle == travelStyle)&&(identical(other.budgetTier, budgetTier) || other.budgetTier == budgetTier)&&(identical(other.dailyPace, dailyPace) || other.dailyPace == dailyPace)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.days, _days));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,destination,destinationLat,destinationLng,startDate,endDate,travelStyle,budgetTier,dailyPace,source,const DeepCollectionEquality().hash(_days));
}

@override
String toString() {
    return 'Trip(id: $id, title: $title, destination: $destination, destinationLat: $destinationLat, destinationLng: $destinationLng, startDate: $startDate, endDate: $endDate, travelStyle: $travelStyle, budgetTier: $budgetTier, dailyPace: $dailyPace, source: $source, days: $days)';
}


}

/// @nodoc
abstract mixin class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) _then) = __$TripCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String destination, double? destinationLat, double? destinationLng, DateTime startDate, DateTime endDate, TripStyle? travelStyle, BudgetTier budgetTier, DailyPace dailyPace, TripSource source, List<TripDay> days
});




}
/// @nodoc
class __$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(this._self, this._then);

  final _Trip _self;
  final $Res Function(_Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? destination = null,Object? destinationLat = freezed,Object? destinationLng = freezed,Object? startDate = null,Object? endDate = null,Object? travelStyle = freezed,Object? budgetTier = null,Object? dailyPace = null,Object? source = null,Object? days = null,}) {
  return _then(_Trip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,destinationLat: freezed == destinationLat ? _self.destinationLat : destinationLat // ignore: cast_nullable_to_non_nullable
as double?,destinationLng: freezed == destinationLng ? _self.destinationLng : destinationLng // ignore: cast_nullable_to_non_nullable
as double?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,travelStyle: freezed == travelStyle ? _self.travelStyle : travelStyle // ignore: cast_nullable_to_non_nullable
as TripStyle?,budgetTier: null == budgetTier ? _self.budgetTier : budgetTier // ignore: cast_nullable_to_non_nullable
as BudgetTier,dailyPace: null == dailyPace ? _self.dailyPace : dailyPace // ignore: cast_nullable_to_non_nullable
as DailyPace,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TripSource,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<TripDay>,
  ));
}


}

// dart format on
