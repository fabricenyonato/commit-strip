import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Star extends StatelessWidget {
  final bool isFavorite;

  const Star({ Key? key, required this.isFavorite })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      isFavorite ?
        FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
      color: isFavorite ? Colors.yellow : null,
    );
  }
}
