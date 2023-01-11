import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_advanture/blocs/score/score_bloc.dart';
import 'package:pixel_advanture/flame_layer/pinkie_game.dart';

class FlameLayer extends StatelessWidget {
  const FlameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: PinkieGame(scoreBloc: context.read<ScoreBloc>()));
  }
}
