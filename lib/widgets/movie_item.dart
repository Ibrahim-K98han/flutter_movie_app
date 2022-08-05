import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_model.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;
  final double pageNumber;
  final double index;
  //positional
  MovieItem(this.movie, this.pageNumber, this.index);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> with SingleTickerProviderStateMixin{
  Animation<double>? heightAnim;
  Animation<double>? elevationAnim;
  Animation<double>? yOffsetAnim;
  Animation<double>? scaleAnim;
  AnimationController? controller;

  @override
  initState(){
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller!.addListener(() {
      setState((){

      });
    });
    super.initState();
  }


  @override
  void didChangeDependencies(){
    heightAnim = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.5,1.0, curve: Curves.easeInOut)
    ));

    scaleAnim = Tween(begin: 0.95, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0,0.3, curve: Curves.easeInOut)
    ));

    yOffsetAnim = Tween(begin: 1.0, end: 10.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0,0.3, curve: Curves.easeInOut)
    ));

    elevationAnim = Tween(begin: 2.0, end: 10.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0,0.3, curve: Curves.easeInOut)
    ));
    super.didChangeDependencies();
  }
  @override
  dispose(){
    controller!.dispose();
    super.dispose();
  }

  final textWhitStyle = TextStyle(fontSize: 18, color: Colors.white);
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.movie.name!),
            background: Image.asset(widget.movie.image!,width: double.infinity,height: 200,fit: BoxFit.cover,),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Transform.scale(
              scale: scaleAnim!.value,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple.shade900,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: elevationAnim!.value,
                      spreadRadius: 1,
                      offset: Offset(0,yOffsetAnim!.value),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(widget.movie.name!,style: textWhitStyle),
                      subtitle: Text(widget.movie.category!,style: textWhitStyle,),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star,color: Colors.white,),
                          Text('${widget.movie.rating}',style: textWhitStyle,),
                        ],
                      ),
                      onTap: (){
                        if(isExpanded){
                          controller!.reverse();
                        }else{
                          controller!.forward();
                        }
                        setState((){
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade400],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        alignment: Alignment.center,
                        height: heightAnim!.value,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: ListView(
                            children: [
                              Text('Directed      : ${widget.movie.director}',style: textWhitStyle,),
                              Text('Produced      : ${widget.movie.producer}',style: textWhitStyle,),
                              Text('Production    : ${widget.movie.production}',style: textWhitStyle,),
                              Text('Language      : ${widget.movie.language}',style: textWhitStyle,),
                              Text('Running Time  : ${widget.movie.runningTime}',style: textWhitStyle,),
                              Text('Country       : ${widget.movie.country}',style: textWhitStyle,),
                              Text('Budget        : ${widget.movie.budget}',style: textWhitStyle,),
                              Text('Box Office    : ${widget.movie.boxOffice}',style: textWhitStyle,),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
            Stack(
              children: [
                Card(
                  color: Colors.deepPurple.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:10, right:10, top:100, bottom: 10),
                    child: Text(widget.movie.description!, style: textWhitStyle),
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      ],
    );
  }
}
