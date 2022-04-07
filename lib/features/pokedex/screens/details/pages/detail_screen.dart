import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/widgets/details_app_bar.dart';

import '../widgets/detail_list.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.onBack})
      : super(key: key);
  final Pokemon pokemon;

  final List<Pokemon> list;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBar(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailList(
            pokemon: pokemon,
          ),
        ],
      ),
    );
  }
}
