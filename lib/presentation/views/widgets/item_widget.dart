import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final String text;
  const ItemWidget({super.key,required this.title,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical:4.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
            const SizedBox(
              height: 8,
            ),
            Text(text,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),

          ],
        ));
  }
}
