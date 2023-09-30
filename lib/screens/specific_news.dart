import 'package:flutter/material.dart';
import 'package:news_app/custom%20widgets/lower_news_viewer.dart';
import 'package:news_app/screens/news_home_view.dart';
import 'package:news_app/services/news_services.dart';

class SpecifiedNews extends StatelessWidget {
 final String category;
   const SpecifiedNews({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: NewsServics().getspecificnews(category),
      builder: (context, snapshot) {
        if(snapshot.hasData){
            return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
              return const NewsView();
            },
            )
            );
          }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
          backgroundColor: Colors.white,
          title: const Text.rich(
            TextSpan(
            text: 'News',style: TextStyle(color: Colors.black), // default text style
            children: [
              TextSpan(text: 'Cloud', style: TextStyle(fontStyle:FontStyle.normal,color: Colors.orange)),
            ],
            ),
            ),
            centerTitle: true,
            elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
               const SliverToBoxAdapter(child: SizedBox(height: 32,),),
               SliverList(delegate:SliverChildBuilderDelegate(
                childCount: snapshot.data!.length, 
                (context, index) {return Lowerviewer(lowerNewsModel: snapshot.data![index],);}))
            ],
          )
        )
      );
        }
        else{
          return const Center(  child: CircularProgressIndicator());
        }
      },
    );
  }
}