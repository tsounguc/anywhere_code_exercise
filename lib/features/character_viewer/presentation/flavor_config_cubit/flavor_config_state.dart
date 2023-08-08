part of 'flavor_config_cubit.dart';

@immutable
abstract class FlavorConfigState extends Equatable {
  const FlavorConfigState();
}

class FlavorConfigInitial extends FlavorConfigState {
  @override
  List<Object?> get props => [];
}
