import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flavor_config_state.dart';

class FlavorConfigCubit extends Cubit<FlavorConfigState> {
  FlavorConfigCubit() : super(FlavorConfigInitial());
}
