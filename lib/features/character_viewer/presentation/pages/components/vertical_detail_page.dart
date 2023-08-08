import 'package:anywhere_code_exercise/features/character_viewer/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../character_viewer_blac/character_viewer_bloc.dart';

class VerticalDetailPage extends StatelessWidget {
  static const String id = "/detailPage";
  const VerticalDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final argument = (ModalRoute.of(context)!.settings.arguments ?? <String, CharacterEntity>{})
        as Map<String, CharacterEntity>;
    final CharacterEntity? character = argument['character'];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 250,
              child: Center(
                  child: character?.image.url != null && character!.image.url.isNotEmpty
                      ? Image.network(
                          "https://duckduckgo.com/${character.image.url}",
                          height: 300,
                          width: 300,
                          fit: BoxFit.contain,
                        )
                      : CircleAvatar(
                          radius: 150,
                          backgroundColor: Colors.grey,
                          // backgroundImage: character?.image.url != null && character!.image.url.isNotEmpty
                          //     ? NetworkImage(
                          //         "https://duckduckgo.com/${character.image.url}",
                          //       )
                          //     : null,
                          child: character?.image.url != null && character!.image.url.isNotEmpty
                              ? null
                              : const Icon(
                                  Icons.person,
                                  size: 130,
                                  color: Colors.white,
                                ),
                        )),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    character?.title ?? "",
                    style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.all(25),
                height: 150,
                child: SingleChildScrollView(
                  child: Text(character?.description ?? "",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
