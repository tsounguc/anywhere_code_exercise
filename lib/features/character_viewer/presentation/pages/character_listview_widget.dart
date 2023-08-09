import 'package:anywhere_code_exercise/features/character_viewer/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';

typedef ItemSelectedCallback = void Function(int value);

class CharacterListviewWidget extends StatefulWidget {
  final int itemCount;
  final ItemSelectedCallback onItemSelected;
  final List<CharacterEntity> list;
  const CharacterListviewWidget({
    super.key,
    required this.list,
    required this.itemCount,
    required this.onItemSelected,
  });

  @override
  State<CharacterListviewWidget> createState() => _CharacterListviewWidgetState();
}

class _CharacterListviewWidgetState extends State<CharacterListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: widget.itemCount,
      itemBuilder: (BuildContext context, int index) {
        if (widget.list[index].title.isEmpty) {
          return Container();
        }
        return Card(
          child: ListTile(
            onTap: () {
              widget.onItemSelected(index);
            },
            title: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.list[index].title,
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
    );
  }
}
