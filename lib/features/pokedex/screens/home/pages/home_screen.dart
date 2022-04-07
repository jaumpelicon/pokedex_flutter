import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item.dart';

import '../../../../../common/models/pokemon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.list, required this.onItemClicked})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Pokedex', style: TextStyle(color: Colors.black, fontSize: 26),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu), color: Colors.black,),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        children: list.map((e) => PokemonItem(pokemon: e, onClick: onItemClicked,)).toList()
      ),
    );
  }
}
