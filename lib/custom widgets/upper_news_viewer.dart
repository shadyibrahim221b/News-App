import 'package:flutter/material.dart';
import 'package:news_app/model/upper_model.dart';

class Upperviewer extends StatelessWidget {
 final UpperNewsModel newsmodel;
 final VoidCallback onTap;
   const Upperviewer({super.key,required this.newsmodel,required this.onTap});
  @override
  Widget build(BuildContext context) {
     return InkWell(
      onTap: onTap,
       child: Container(
          margin: const EdgeInsets.all(3),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), 
            image: DecorationImage(image:AssetImage(newsmodel.image))
          ),
          alignment: Alignment.center,
          child: Text(newsmodel.name, style:const TextStyle(
                       color: Colors.white,
                       fontSize: 20))
       ),
     );
  }
}