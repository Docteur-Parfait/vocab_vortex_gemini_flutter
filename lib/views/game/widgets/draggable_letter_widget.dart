import 'package:flutter/material.dart';
import 'package:vocab_vortex/views/game/widgets/letter_container.dart';

class DraggableLetter extends StatelessWidget {
  final String? letter;

  const DraggableLetter({super.key, this.letter});

  @override
  Widget build(BuildContext context) {
    return LetterContainer(letter: letter);
  }
}
