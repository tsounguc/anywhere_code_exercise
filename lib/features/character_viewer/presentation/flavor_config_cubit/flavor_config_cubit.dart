import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import "package:equatable/equatable.dart";

import '../../../../config_flavors.dart';

part 'flavor_config_state.dart';

class FlavorConfigCubit extends Cubit<FlavorConfigState> {
  FlavorConfig? config;
  FlavorConfigCubit() : super(FlavorConfigInitial());
}
