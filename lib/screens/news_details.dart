import 'package:flutter/material.dart';
import '../model/lower_model.dart';

class NewsDetails extends StatelessWidget{
  final LowerNewsModel lowerNewsModel;
   const NewsDetails({super.key,required this.lowerNewsModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breaking News'), centerTitle: true, backgroundColor: Colors.black,elevation: 0,),
      body: Center(child: Column(
        children: [
          Hero( 
            tag:lowerNewsModel.tag! ,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(lowerNewsModel.image ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/495px-No-Image-Placeholder.svg.png?20200912122019'),
                fit: BoxFit.fill
                )
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Text(lowerNewsModel.description ?? 'No desciption   avaliable',maxLines: 100,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          const SizedBox(height: 4,),
          SizedBox(
            height: 200,
            child: Text(lowerNewsModel.content ?? 'No futher content avaliable',maxLines: 100,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ],
        )
        ),
    );
  }
}