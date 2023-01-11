import 'dart:ffi';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pixel_advanture/flame_layer/pinkie_game.dart';

class Pinkie extends SpriteComponent with HasGameRef<PinkieGame> {
  Pinkie() : super(position: Vector2.all(100), size: Vector2.all(100)) {
    debugMode = true;
  }

  double speed = 5;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    sprite =
        await gameRef.loadSprite('pinkie_run.png', srcSize: Vector2.all(32));
  }

  @override
  void update(double dt) async {
    super.update(dt);
    // x += 1;
    position.add(gameRef.joystick.delta * dt * speed);
  }
}
