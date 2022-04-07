
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailList extends StatelessWidget {
  const DetailList({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 66,
      left: 0,
      right: 0,
      height: 120,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
