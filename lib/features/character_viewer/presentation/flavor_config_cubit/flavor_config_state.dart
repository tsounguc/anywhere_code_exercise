part of 'flavor_config_cubit.dart';

@immutable
abstract class FlavorConfigState {}

class FlavorConfigInitial extends FlavorConfigState {
  final FlavorConfig? config;
  FlavorConfigInitial({this.config});
}
