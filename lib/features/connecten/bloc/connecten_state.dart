part of 'connecten_cubit.dart';

@freezed
class ConnectenState with _$ConnectenState {
  const factory ConnectenState.initial() = _Initial;
  const factory ConnectenState.advertising() = _Advertising;
  const factory ConnectenState.discovering() = _Discovering;
}
