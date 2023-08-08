import 'package:anywhere_code_exercise/features/character_viewer/presentation/character_viewer_blac/character_viewer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewerHome extends StatelessWidget {
  const ViewerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterViewerBloc, CharacterViewerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("ref.read(flavorConfigProvider).appTitle")),
          body: Column(children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("index$index"));
              },
            )
          ]),
        );
      },
    );
  }
}
