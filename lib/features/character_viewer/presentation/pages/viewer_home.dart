import 'dart:io';

import 'package:anywhere_code_exercise/features/character_viewer/presentation/pages/components/character_listview_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:anywhere_code_exercise/features/character_viewer/presentation/character_viewer_blac/character_viewer_bloc.dart';
import 'package:flutter/material.dart';

import '../flavor_config_cubit/flavor_config_cubit.dart';
import 'components/horizontal_detail_page.dart';
import 'components/vertical_detail_page.dart';

class ViewerHome extends StatefulWidget {
  static const String id = "/";
  const ViewerHome({super.key});

  @override
  State<ViewerHome> createState() => _ViewerHomeState();
}

class _ViewerHomeState extends State<ViewerHome> {
  var selectedValue = 0;
  var isLargeScreen = false;
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
            body: OrientationBuilder(builder: (context, orientation) {
              if (!(Platform.isAndroid || Platform.isIOS) && MediaQuery.of(context).size.width >= 600) {
                isLargeScreen = true;
              } else {
                isLargeScreen = false;
              }
              return Row(
                children: [
                  Expanded(
                      child: CharacterListviewWidget(
                    itemCount: state.characters.length,
                    onItemSelected: (int index) {
                      if (isLargeScreen) {
                        selectedValue = index;
                        setState(() {});
                      } else {
                        Navigator.pushNamed(
                          context,
                          VerticalDetailPage.id,
                          arguments: {
                            "character": state.characters[index],
                          },
                        );
                      }
                    },
                    list: state.characters,
                  )),
                  isLargeScreen
                      ? Expanded(child: HorizontalDetailPage(selectedCharacter: state.characters[selectedValue]))
                      : Container(),
                ],
              );
            }),
          );
        }
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
