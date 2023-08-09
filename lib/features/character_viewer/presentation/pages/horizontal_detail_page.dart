import 'package:anywhere_code_exercise/features/character_viewer/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';

class HorizontalDetailPage extends StatelessWidget {
  static const String id = "/detailPage";
  final CharacterEntity selectedCharacter;
  const HorizontalDetailPage({
    super.key,
    required this.selectedCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: selectedCharacter.image.url.isNotEmpty
                      ? Image.network(
                          "https://duckduckgo.com/${selectedCharacter.image.url}",
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
                          child: selectedCharacter.image.url.isNotEmpty
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
                    selectedCharacter.title,
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
                  child: Text(selectedCharacter.description,
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
