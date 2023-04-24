part of 'connecten_cubit.dart';

@freezed
class ConnectenState with _$ConnectenState {
  const factory ConnectenState.initial() = _Initial;
  const factory ConnectenState.advertising() = _Advertising;
  const factory ConnectenState.discovering() = _Discovering;
}

// @freezed
// class ConnectenState with _$ConnectionState {
//   const factory ConnectionState.initial() = _Initial;
//   const factory ConnectionState.advertising() = _Advertising;
//   const factory ConnectionState.discovering() = _Discovering;
// }
