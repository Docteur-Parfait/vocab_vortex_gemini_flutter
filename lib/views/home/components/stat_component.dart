import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocab_vortex/exports.dart';

import '../widgets/stat_profil_widget.dart';
import '../widgets/stat_widget.dart';

class StatComponent extends ConsumerStatefulWidget {
  const StatComponent({super.key});

  @override
  ConsumerState<StatComponent> createState() => _StatComponentState();
}

class _StatComponentState extends ConsumerState<StatComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatProfilWidget(
            icon: IconAssets.profil,
            value: ref.read(currentUserProvider)!.name,
          ),
          StatWidget(
            icon: IconAssets.match,
            value: ref.read(currentScoreProvider)!.totalMatch.toString(),
          ),
          StatWidget(
            icon: IconAssets.win,
            value: ref.read(currentScoreProvider)!.winMatch.toString(),
          ),
          StatWidget(
            icon: IconAssets.lost,
            value: ref.read(currentScoreProvider)!.lostMatch.toString(),
          ),
        ],
      ),
    );
  }
}
