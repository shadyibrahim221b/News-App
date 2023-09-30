import 'package:flutter/material.dart';
import 'package:news_app/model/lower_model.dart';
import 'package:news_app/screens/news_details.dart';

class Lowerviewer extends StatelessWidget {
  final LowerNewsModel lowerNewsModel;
  const Lowerviewer({super.key,required this.lowerNewsModel});
  @override
  Widget build(BuildContext context) {
     return  Column(
        children: [
          InkWell(
            onTap:() {
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return NewsDetails(lowerNewsModel: lowerNewsModel);
              },));
            },
            child: Hero(
              tag: lowerNewsModel.tag!,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(lowerNewsModel.image ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/495px-No-Image-Placeholder.svg.png?20200912122019',),
                  fit: BoxFit.fill
                  ),
                  shape: BoxShape.rectangle
                ),
              ),
            ),
          ),  
          const SizedBox(height: 8,),
          Text(lowerNewsModel.author ?? 'author is not provided'),
          const SizedBox(height: 8,),
          SizedBox(
            height:50,
            child: Text(lowerNewsModel.title ?? 'No title is provided',maxLines: 20,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            const SizedBox(height: 4,),
            SizedBox(
              height: 34,
              child: Text(lowerNewsModel.description ?? 'No description is provided')),
            const SizedBox(height: 16,)
      ],
      );
  }
}