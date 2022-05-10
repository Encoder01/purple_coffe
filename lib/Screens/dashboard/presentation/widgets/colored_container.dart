import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({Key? key, required this.child, this.image}) : super(key: key);
  final Widget child;
  final DecorationImage? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromRGBO(197, 122, 29, 1), width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),image: image
      ),
      child:child ,
    );
  }
}
