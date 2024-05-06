part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class GetLocation extends MapEvent {
  const GetLocation();
}

class SharePressed extends MapEvent {
  const SharePressed();
}

class CopyPressed extends MapEvent {
  final String copyValue;
  const CopyPressed(this.copyValue);
}
