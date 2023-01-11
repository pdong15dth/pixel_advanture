import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:pixel_advanture/blocs/score/score_bloc.dart';
import 'package:pixel_advanture/flame_layer/flame_layer.dart';
import 'package:pixel_advanture/flutter_layer/flutter_layer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_advanture/flutter_layer/main_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(const PixelAdvanture());
}

class PixelAdvanture extends StatelessWidget {
  const PixelAdvanture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            backgroundColor: Colors.blueGrey,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: BlocProvider<ScoreBloc>(
        create: (context) => ScoreBloc(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.orange,
          ),
          drawer: MainDrawer(),
          body: Stack(
            children: const [
              FlameLayer(),
              FlutterLayer(),
            ],
          ),
        ),
      ),
    );
  }
}

