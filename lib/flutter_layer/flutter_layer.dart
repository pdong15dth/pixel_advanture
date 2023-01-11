import 'package:flutter/material.dart';
import 'package:pixel_advanture/blocs/score/score_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ScoreBloc, ScoreState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Scrore: ${state.score}'),
              TextButton(
                onPressed: () {
                  context.read<ScoreBloc>().add(IncreateScoreEvent());
                },
                child: const Text('+ Score'),
              ),
            ],
          );
        },
      ),
    );
  }
}
