import 'package:flutter/material.dart';
import 'package:news_app/custom%20widgets/upper_news_viewer.dart';
import 'package:news_app/custom%20widgets/lower_news_viewer.dart';
import 'package:news_app/model/upper_model.dart';
import 'package:news_app/screens/specific_news.dart';
import 'package:news_app/services/news_services.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {  
  @override
  Widget build(BuildContext context) {
    List<UpperNewsModel> newsmodel=[
      UpperNewsModel(image: 'assets/images/business.jpg', name: 'business'),
      UpperNewsModel(image: 'assets/images/entertainment.jpg', name: 'entertainment'),
      UpperNewsModel(image: 'assets/images/sport.jpg', name: 'sports'),
      UpperNewsModel(image: 'assets/images/Health.avif', name: 'health'),
      UpperNewsModel(image: 'assets/images/Technology.avif', name: 'technology')
    ];
    return  FutureBuilder(
      future: NewsServics().getgeneralnews(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
            return Scaffold(
        appBar: AppBar(
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
              SliverToBoxAdapter(child:
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsmodel.length,
                  itemBuilder:(context, index) {
                  return Upperviewer(newsmodel: newsmodel[index],onTap:() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
                      return SpecifiedNews(category: newsmodel[index].name,);
                    },
                    )
                    );
                  },
                  );
                  }
                  )
                ),
              ),
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