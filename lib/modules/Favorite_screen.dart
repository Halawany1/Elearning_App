import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant.dart';
import '../shared/shared_component.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          shrinkWrap: true,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
              crossAxisSpacing:12 ,
              mainAxisSpacing: 12,
              childAspectRatio:0.7
        ),
            itemBuilder: (context, index) => buildFavourite(index: index),
          itemCount: courses.length,),
      ),

    );
  }


}
