import 'package:flutter/material.dart';
import 'package:pokedex/common/errors/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repository/pokemon_repository.dart';
import 'package:pokedex/common/widgets/error_screen.dart';
import 'package:pokedex/common/widgets/loading_screen.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_screen.dart';

import '../../details/container/detail_container.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository, required this.onItemClicked}) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemClicked;

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
            return HomeScreen(
              list: snapshot.data!, onItemClicked: onItemClicked,
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
