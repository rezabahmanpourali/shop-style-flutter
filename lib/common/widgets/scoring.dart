import 'package:flutter/material.dart';

class Scoring extends StatelessWidget {
  const Scoring({
    super.key,
    this.hasShowvotesVotes = true,
  });

  final bool hasShowvotesVotes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '4.5',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star_border, size: 21),
        hasShowvotesVotes
            ? Text(
                '(55)',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : const Text(''),
      ],
    );
  }
}
