import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:pixel_advanture/actors/pinkie.dart';
import 'package:pixel_advanture/blocs/score/score_bloc.dart';
import 'package:pixel_advanture/flame_layer/pinkie_game.dart';

class Treasure extends SpriteComponent
    with
        HasGameRef<PinkieGame>,
        CollisionCallbacks,
        FlameBlocListenable<ScoreBloc, ScoreState> {
  Vector2 treasurePosition;
  Treasure({required this.treasurePosition})
      : super(position: treasurePosition, size: Vector2.all(100)) {
    debugMode = true;
  }

  late Sprite redGem;
  late Sprite pinkGem;
  late Sprite greenGem;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    redGem = await gameRef.loadSprite('red_gem.png');
    pinkGem = await gameRef.loadSprite('pink_gem.png');
    greenGem = await gameRef.loadSprite('green_gem.png');
    sprite = redGem;
    size = Vector2.all(64);
    position.x += 250;
  }

  @override
  void update(double dt) async {
    super.update(dt);
  }

  @override
  void onNewState(ScoreState state) {
    super.onNewState(state);
    print('new state is $state');
    if (state.score == 1) {
      sprite = pinkGem;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Pinkie) {
      print('va cham voi Pinkie');
      gameRef.scoreBloc.add(IncreateScoreEvent());
      removeFromParent();
    }
  }
}
