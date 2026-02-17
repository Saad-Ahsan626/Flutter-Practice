import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String image, category;
  final Color color;
  const CategoryItem({
    super.key,
    required this.color,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Image.asset('assets/Images/drugs.png', height: 35,),
          ),
          Text(category, style: TextStyle(fontWeight: FontWeight.w300,)),
        ],
      ),
    );
  }
}
