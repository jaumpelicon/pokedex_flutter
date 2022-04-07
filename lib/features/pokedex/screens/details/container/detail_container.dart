import 'package:flutter/material.dart';
import 'package:pokedex/common/widgets/error_screen.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_screen.dart';

import '../../../../../common/errors/failure.dart';
import '../../../../../common/models/pokemon.dart';
import '../../../../../common/repository/pokemon_repository.dart';
import '../../../../../common/widgets/loading_screen.dart';

class DetailArguments {
  final Pokemon pokemon;
  final int? index;
  DetailArguments({ required this.index ,required this.pokemon});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key,
        required this.repository,
        required this.arguments,
        required this.onBack
      })
      : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailScreen(
              onBack: onBack,
              pokemon: arguments.pokemon,
              list: snapshot.data!,
            );
          }
          if (snapshot.hasError) {
            return ErrorScreen(
              error: (snapshot.error as Failure).message!,
            );
          }

          return Container();
        });
  }
}
