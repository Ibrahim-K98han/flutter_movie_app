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

class _MovieItemState extends State<MovieItem> {
  final textWhitStyle = TextStyle(fontSize: 18, color: Colors.white);
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple.shade900,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0,5),
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
                      height: 150,
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
