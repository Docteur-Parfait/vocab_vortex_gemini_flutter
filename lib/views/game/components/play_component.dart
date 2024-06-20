import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_vortex/exports.dart';
import 'package:vocab_vortex/views/game/widgets/bingo_widget.dart';
import 'package:vocab_vortex/views/game/widgets/draggable_letter_widget.dart';
import 'package:vocab_vortex/views/game/widgets/letter_container.dart';

class PlayComponent extends ConsumerStatefulWidget {
  const PlayComponent({super.key});

  @override
  ConsumerState<PlayComponent> createState() => _PlayComponentState();
}

class _PlayComponentState extends ConsumerState<PlayComponent> {
  bool isWin = false;
  bool onError = false;
  List<String?> letters = [];

  // Conteneurs cibles (seront définis dynamiquement)
  List<String?> targetContainers = [];

  // Mot à deviner (sera défini dynamiquement)
  String word = '';

  // Conteneurs cibles (vides au début)
  // List<String?> targetContainers = List<String?>.filled(5, null);

  Future<void> getWord() async {
    // Simuler la récupération d'un mot depuis une source externe
    ref.read(geminiControllerProvider).getWord().then((value) {
      if (value != null) {
        setState(() {
          word = value.word; // Exemple de mot récupéré
          letters = value.vortex.split('');
          targetContainers = List<String?>.filled(word.length, null);
        });
      } else {
        setState(() {
          onError = true;
        });
      }
    }).onError((handleError, stf) {
      print(handleError);
      setState(() {
        onError = true;
      });
    });
  }

  void _verifyWord(BuildContext _) {
    log(word, name: "TARGET");
    if (targetContainers.join() == word) {
      setState(() {
        isWin = true;
      });
// Add score
      ref.read(scoreControllerProvider).addScore(win: true);

      // Alert
      AlertHelper.customAlertChoixDialog(
        context,
        title: "Congratulation 🥳",
        content: "You found the right word!",
        cancelText: "Leave 😓",
        acceptText: "Next game 🥳",
        cancelPress: () {
          Get.back();
          Get.back();
        },
        acceptPress: () {
          Get.back();

          setState(() {
            letters = [];
            targetContainers = [];
            isWin = false;
          });

          getWord();
        },
      );
    } else {
      // Add score
      ref.read(scoreControllerProvider).addScore(win: false);

      // Alert
      AlertHelper.customAlertChoixDialog(context,
          title: "Sorry 😢",
          content: "You didn't find the right word! The right word is :",
          bigInfo: word,
          cancelText: "Leave 😓",
          acceptText: "Next game 🥳", cancelPress: () {
        Get.back();
        Get.back();
      }, acceptPress: () {
        Get.back();

        setState(() {
          letters = [];
          targetContainers = [];
        });

        getWord();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getWord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return letters.isEmpty && targetContainers.isEmpty
        ? onError
            ? WidgetHelper.errorElementComponent(onPressed: () {
                getWord();
                setState(() {
                  onError = false;
                });
              })
            : WidgetHelper.customCircularLoading()
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          feedback: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorStyles.kWhite),
                              child: LetterContainer(letter: letter)),
                          childWhenDragging: const LetterContainer(letter: ''),
                          onDragCompleted: () {
                            setState(() {
                              letters[index] = "";
                            });
                          },
                          child: DraggableLetter(letter: letter),
                        );
                      }).toList(),
                    ),

                    const Gap(25),

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
                            setState(() {
                              // Met à jour les conteneurs cibles
                              targetContainers[index] = data.data;
                            });
                          },
                        );
                      }).toList(),
                    ),

                    targetContainers
                                .where((element) => element != null)
                                .length ==
                            word.length
                        ? Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: GestureDetector(
                              onTap: () => _verifyWord(context),
                              child: Image.asset(
                                IconAssets.submit,
                                height: 50,
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              Positioned(
                  bottom: 5,
                  child: Lottie.asset(LottieAssets.manette, width: 120)),
              if (isWin) const BingoWidget()
            ],
          );
  }
}
