import 'package:client/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: [
                        Text(meal.title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white)),
                      const SizedBox(height: 12),

                      Row(
                        children: [],
                      )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
