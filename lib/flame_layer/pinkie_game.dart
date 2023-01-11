
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pixel_advanture/actors/pinkie.dart';
import 'package:pixel_advanture/actors/treasure.dart';
import 'package:pixel_advanture/blocs/score/score_bloc.dart';

class PinkieGame extends FlameGame with HasCollisionDetection, HasDraggables {
  final ScoreBloc scoreBloc;
  late JoystickComponent joystick;
  PinkieGame({required this.scoreBloc});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    var physicalSize = window.physicalSize;
    camera.viewport = FixedResolutionViewport(Vector2(physicalSize.width, physicalSize.height));
    SpriteComponent background = SpriteComponent();
    background.sprite = await loadSprite('background.gif');
    background.size = size;
    add(background);

    add(
      FlameBlocProvider<ScoreBloc, ScoreState>.value(
        value: scoreBloc,
        children: [
          Treasure(treasurePosition: Vector2(300, 100)),
          Treasure(treasurePosition: Vector2(150, 100)),
          Pinkie(),
        ],
      ),
    );

    final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 30, paint: knobPaint),
      background: CircleComponent(radius: 100, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);
    // add(Pinkie());
    // add(Treasure());
  }
}
