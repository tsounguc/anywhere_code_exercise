import 'package:anywhere_code_exercise/features/character_viewer/presentation/character_viewer_blac/character_viewer_bloc.dart';
import 'package:anywhere_code_exercise/features/character_viewer/presentation/flavor_config_cubit/flavor_config_cubit.dart';
import 'package:anywhere_code_exercise/features/character_viewer/presentation/pages/viewer_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config_flavors.dart';

void mainCommon(FlavorConfig config) {
  runApp(MyApp(config: config));
}

class MyApp extends StatefulWidget {
  final FlavorConfig config;
  const MyApp({super.key, required this.config});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharacterViewerBloc()),
        BlocProvider(
          create: (context) => FlavorConfigCubit(),
        )
      ],
      child: BlocConsumer<FlavorConfigCubit, FlavorConfigState>(
          listener: (context, state) {
            if (state is FlavorConfigInitial) {
              BlocProvider.of<CharacterViewerBloc>(context).add(GetCharactersEvent(config: state.config));
            }
          },
          builder: (context, state) => MaterialApp(
                title: widget.config.appTitle,
                theme: widget.config.theme,
                home: const ViewerHome(),
                debugShowCheckedModeBanner: false,
              )),
    );
  }
}

// class MyHomePage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: Text(ref.read(flavorConfigProvider).appTitle)),
//       body: Column(children: [
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: 10,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(title: Text("index$index"));
//           },
//         )
//       ]),
//     );
//   }
// }
