// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../doodle_dash.dart';

abstract class PowerUp extends SpriteComponent
    with HasGameRef<DoodleDash>, CollisionCallbacks {
  final hitbox = RectangleHitbox();
  double get jumpSpeedMultiplier;

  PowerUp({
    super.position,
  }) : super(
          size: Vector2.all(50),
          priority: 2,
        );

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    await add(hitbox);
  }
}

// Powerups: Add Rocket class
class Rocket extends PowerUp {
  @override
  double get jumpSpeedMultiplier => 3.5;

  Rocket({
    super.position,
  });

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/rocket_1.png');
    size = Vector2(50, 70);
  }
}

// Powerups: Add NooglerHat class
class NooglerHat extends PowerUp {
  @override
  double get jumpSpeedMultiplier => 2.5;

  NooglerHat({
    super.position,
  });

  final int activeLengthInMS = 5000;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/noogler_hat.png');
    size = Vector2(75, 50);
  }
}

class Supergirl extends PowerUp {
  // Add lines from here...
  @override
  double get jumpSpeedMultiplier => 5.5;

  Supergirl({
    super.position,
  });
  final int activeLengthInMS = 7000;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/supergirl_left.png');
    size = Vector2(120, 120);
  }
}

class Spaceship extends PowerUp {
  // Add lines from here...
  @override
  double get jumpSpeedMultiplier => 6.5;

  Spaceship({
    super.position,
  });
  final int activeLengthInMS = 8000;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/alien_in_spaceship.png');
    size = Vector2(120, 110);
  }
}
