import 'package:flutter/material.dart';
import 'package:flutter_movie_app/temp_db/db.dart';
import 'package:flutter_movie_app/widgets/movie_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? pageController;
  double pageNumber = 0.0;
  @override
  void intiState(){
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 1
    );
    pageController?.addListener(() {
      setState((){
        pageNumber = pageController!.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset('images/spotlight.jpg', width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
            PageView.builder(
                controller: pageController,
                itemBuilder: (context, index)=>MovieItem(movies[index], pageNumber, index.toDouble()),
                itemCount: movies.length,
            ),
          ],
        ),
      ),
    );
  }
}
