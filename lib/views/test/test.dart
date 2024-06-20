import 'package:flutter/material.dart';
import 'package:vocab_vortex/views/game/widgets/draggable_letter_widget.dart';
import 'package:vocab_vortex/views/game/widgets/letter_container.dart';

class DragDropWord extends StatefulWidget {
  const DragDropWord({super.key});

  @override
  _DragDropWordState createState() => _DragDropWordState();
}

class _DragDropWordState extends State<DragDropWord> {
  // Liste des lettres initiales (OECEL)
  List<String?> letters = ['O', 'E', 'C', 'E', 'L'];

  // Conteneurs cibles (vides au début)
  List<String?> targetContainers = List<String?>.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag and Drop Word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Conteneurs de lettres
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: letters.asMap().entries.map((entry) {
                int index = entry.key;
                String? letter = entry.value;
                return LongPressDraggable<String>(
                  data: letter ?? '',
                  feedback: Material(
                    child: LetterContainer(letter: letter),
                  ),
                  childWhenDragging: const LetterContainer(letter: ''),
                  onDragCompleted: () {
                    setState(() {
                      letters[index] = null;
                    });
                  },
                  child: DraggableLetter(letter: letter),
                );
              }).toList(),
            ),

            const SizedBox(height: 20.0),

            // Zones de dépôt (conteneurs vides)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: targetContainers.asMap().entries.map((entry) {
                int index = entry.key;
                String? letter = entry.value;
                return DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return LetterContainer(letter: letter);
                  },
                  onWillAcceptWithDetails: (data) => letter == null,
                  onAcceptWithDetails: (data) {
                    onAccept(data.data, index);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void onAccept(String letter, int index) {
    setState(() {
      // Met à jour les conteneurs cibles
      targetContainers[index] = letter;

      // Vérifie si toutes les lettres ont été déposées
      if (targetContainers.where((element) => element != null).length == 5) {
        // Vérifie si le mot formé est "ECOLE"
        if (targetContainers.join() == "ECOLE") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Succès!'),
              content:
                  const Text('Vous avez correctement arrangé le mot "ECOLE"!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Echec!'),
              content: const Text('Erreur lors du rangement'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    });
  }
}
