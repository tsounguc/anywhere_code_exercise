import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:anywhere_code_exercise/features/character_viewer/presentation/character_viewer_blac/character_viewer_bloc.dart';
import 'package:flutter/material.dart';

import '../flavor_config_cubit/flavor_config_cubit.dart';
import 'detail_page.dart';

class ViewerHome extends StatelessWidget {
  static const String id = "/";
  const ViewerHome({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterViewerBloc, CharacterViewerState>(
      builder: (context, state) {
        if (state is CharacterViewerInitial) {
          BlocProvider.of<CharacterViewerBloc>(context)
              .add(GetCharactersEvent(config: BlocProvider.of<FlavorConfigCubit>(context).config!));
        } else if (state is CharacterViewerLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CharacterErrorState) {
          return Scaffold(
            body: Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        } else if (state is CharactersNotFoundState) {
          return Scaffold(
            body: Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        } else if (state is CharactersFoundState) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(title: Text(BlocProvider.of<FlavorConfigCubit>(context).config!.appTitle)),
            body: Column(children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.characters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailPage.id,
                            arguments: {"character": state.characters[index]},
                          );
                        },
                        title: SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                state.characters[index].title,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                // size: 30,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          );
        }
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
