import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title, price;
  const CardItem({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/Images/camera.webp',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              spacing: 5,
              children: [
                Text(title, 
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                ),
                Text(price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
